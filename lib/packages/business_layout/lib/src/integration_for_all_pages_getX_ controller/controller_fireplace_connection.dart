import 'dart:developer';
import 'package:data_layout/data_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'dart:async';
import 'package:hive_flutter/hive_flutter.dart';
//для запуска кодогенерации flutter packages pub run build_runner build --delete-conflicting-outputs

// в этом файле лежат общие настройки состояний для всех моделей, c отдельными модификациями будет свои контроллеры у каждой модели
class FireplaceConnectionGetXController extends GetxController {
  static FireplaceConnectionGetXController instance = Get.find();

  //подключение к слою данных / сервисному слою
  final services = ImplementationFireplaceServices();

  @override
  void onInit() {
    super.onInit();
    //сначала достаю имя вай вай сети к которой подключен

    _initNetworkInfo().then((wifiNameInfo) {
      wifiName = wifiNameInfo;
      update();
      //   теперь Wifi name известен и можно парсить данные с апи
      //чтобы понять какой камин нужно обращаться к
      searchFireplaceInListWithIdWifi(wifiName: wifiNameInfo).then((value) {
        print('wifiName _______initNetworkInfo  $wifiNameInfo');
      });
    });
  }

  bool _isTimerUpdateDataBase = false;

  void changeIsTimerUpdateDataBase({bool? isTimerUpdateDataBase}) {
    _isTimerUpdateDataBase = isTimerUpdateDataBase ?? !_isTimerUpdateDataBase;
    update();
  }

  void disposeFireplaceData() async {
    changeIsTimerUpdateDataBase(isTimerUpdateDataBase: false);
    isSettingButton = false;
    fireplaceData = null;
    update();
  }

  ///инициализация данных на экране
  Future<void> initFireplaceData({required ListNamesFireplace wifiName}) async {
    ///delete after todo api
    int url = 0;
    switch (wifiName) {
      case ListNamesFireplace.smartPrime1000:
        url = 0;
        break;
      case ListNamesFireplace.smartFireA71000:
        url = 1;
        break;
      case ListNamesFireplace.smartFireA51000:
        url = 2;
        break;
      case ListNamesFireplace.smartFireA31000:
        url = 3;
        break;
    }
    fireplaceData =
        await services.getFireplaceData(url: url).whenComplete(() async {
      changeIsTimerUpdateDataBase(isTimerUpdateDataBase: true);
      await _initialFireplaceData(url: url);
    });
    update();
    await _optionsFireplace();
  }

  Future<void> _initialFireplaceData({
    required /*String?*/ int? url,
  }) async {
    Timer.periodic(const Duration(seconds: 2), (timer) async {
      //для обновление данных каждые 2 секунды
      if (!_isTimerUpdateDataBase) {
        timer.cancel();
        print('stopTimer');
      } else if (url != null && url != '') {
        fireplaceData = await services.getFireplaceData(url: url);
        print(_isTimerUpdateDataBase);
        print(timer);
        update();
      }
    });
  }

  ///общие параметры__________________________________
  //при первом входе в приложение - либо сделать linear bar при загрузке данных

  FireplaceDataModel? fireplaceData;

  //значение уровня топлива
  // double? percentOil;

  //значение температуры
  // double? temperature;

  //значение CO2
  // double? CO2value;

//значение влажности
//   double? wet;

  ///для информационных сообщений___________________________________________________
  //окно с информационным сообщением
  String alertMessage = 'камин готов к работе';

  // void ifFuelSystemError() {
  //   alertMessage = 'ОШИБКА: неисправность\nтопливной системы!!!';
  //   update();
  // }

  ///для экрана настройки___________________________________________________
  //кнопка настроек нажата?
  bool isSettingButton = false;

  void changeIsSettingButton({bool? newIsSettingButton}) {
    isSettingButton = newIsSettingButton ?? !isSettingButton;
    update();
  }

  // //звук нажатия кнопок
  bool isSwitchClickSound = false;

  void changeSwitchButtonClickSound() {
    isSwitchClickSound = !isSwitchClickSound;
    update();
  }

  //Звуковой эффект потрескивание дров
  bool isSwitchCracklingSoundEffect = false;

  void changeSwitchCracklingSoundEffect() {
    isSwitchCracklingSoundEffect = !isSwitchCracklingSoundEffect;
    update();
  }

  //Голосовые подсказки
  bool isSwitchVoicePrompts = false;
  double sliderValueVoicePrompts = 0;

  void changeSwitchVoicePrompts() {
    isSwitchVoicePrompts = !isSwitchVoicePrompts;
    update();
  }

  ///для экрана блокировки___________________________________________________
  //кнопка блокирования экрана нажата?
  bool isBlocButton = false;

  void changeIsBlocButton({bool? newIsBlocButton}) {
    isBlocButton = newIsBlocButton ?? !isBlocButton;
    update();
  }

  //заданный пользователем пароль - сохранить в локальную базу
  // int? passwordBlock = 5539;

  //пароль, который приходит с тектового поля
  TextEditingController textFieldPassword = TextEditingController();

  ///для запуска и управления камином___________________________________________________

  //камин запущен?
  bool isPlayFireplace = false;

  //охлаждение камина начато?
  bool isCoolingFireplace = false;

  //если ошибка топливной системы
  bool isFuelSystemError = false;

  //для слайдера / максимальное значение

  void changeButtonPlayStopFireplace() {
    isPlayFireplace ? stopFireplace() : playFireplace();
  }

  changeAlertMessage({required String? newAlertMessage}) {
    alertMessage = newAlertMessage ?? "камин готов к работе";
    update();
  }

  Future<void> playFireplace() async {
    if (!isCoolingFireplace && !isPlayFireplace) {
      changeAlertMessage(newAlertMessage: 'розжиг камина');
      isPlayFireplace = true;
      update();
    }

    ///todo play fireplace

    await Future.delayed(const Duration(seconds: 4)).whenComplete(
      () => changeAlertMessage(
          newAlertMessage: (isPlayFireplace)
              ? "уровень пламени №${valuePowerFireplace.toInt()}"
              : null),
    );
  }

  void stopFireplace() async {
    if (!isCoolingFireplace && isPlayFireplace) {
      isPlayFireplace = false;
      update();
      updateTimerFireplace(cancel: true);

      //запуск озлаждения камина
      await startCoolingFireplace();
      changeAlertMessage(newAlertMessage: null);
    }
  }

  double valuePowerFireplace = 1;

  changePowerSliderFireplace({required double newValuePowerFireplace}) {
    valuePowerFireplace = newValuePowerFireplace;
    update();
    changeAlertMessage(
        newAlertMessage: isPlayFireplace
            ? "уровень пламени №${newValuePowerFireplace.toInt()}"
            : null);
  }

  //запуск озлаждения камина
  Future<void> startCoolingFireplace() async {
    isCoolingFireplace = true;
    update();
    changeAlertMessage(newAlertMessage: 'охлаждение камина');

    await Future.delayed(
      const Duration(seconds: 4),
    ).then(
      (value) {
        isCoolingFireplace = false;
        update();
      },
    );
  }

  ///для таймера___________________________________________________
  //данные таймера
  bool isOptionTimer = false;

  //данные таймера обратного отсчета

  bool timerIsRunning = false;

  Timer? _timer;
  int _timerFireplaceValue = 0; // 10 min
  List<String> timerDateInHHMMSS = ['00', '00', '00'];

  void _formatHHMMSS(int seconds) {
    final hours = (seconds / 3600).truncate();
    seconds = (seconds % 3600).truncate();
    final minutes = (seconds / 60).truncate();

    final hoursStr = (hours).toString().padLeft(2, '0');
    final minutesStr = (minutes).toString().padLeft(2, '0');
    final secondsStr = (seconds % 60).toString().padLeft(2, '0');

    if (hours == 0) {
      timerDateInHHMMSS = ['00', '$minutesStr', '$secondsStr'];
      update();
      return;
    }

    timerDateInHHMMSS = ['$hoursStr', '$minutesStr', '$secondsStr'];
    update();
  }

  void updateTimerFireplace({bool? cancel, bool? isIncrement}) {
    if (cancel != null && cancel) {
      _timerFireplaceValue = 0;
      timerIsRunning = false;
      _timer?.cancel();
      update();
      _formatHHMMSS(_timerFireplaceValue);
      return;
    } else if (isIncrement != null && isIncrement) {
      _timerFireplaceValue += 600;
      update();
      _formatHHMMSS(_timerFireplaceValue);
    } else {
      if (_timerFireplaceValue > 0) {
        _timerFireplaceValue -= 600;
        update();
        _formatHHMMSS(_timerFireplaceValue);
      }
    }
  }

  void startTimer() {
    if (_timerFireplaceValue == 0) {
      Get.snackbar('Время не установлено', '');
      return;
    }

    timerIsRunning = true;
    playFireplace();
    update();

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (_timerFireplaceValue == 0) {
          stopFireplace();
          timerIsRunning = false;
          timer.cancel();
          update();
          return;
        } else {
          _timerFireplaceValue -= 1;
          _formatHHMMSS(_timerFireplaceValue);
          update();
        }
      },
    );

    Future.delayed(Duration(milliseconds: 200)).whenComplete(() {
      Get.back(canPop: true);
    });
    update();
  }

  ///для добавления камина в домашнюю сеть Wifi___________________________________________________

  //храню в таком виде
  ///Map<кастомное имя : Map<имя сохраненной домашней wifi : название из _listWifiName>>

  Box<HomeNetworkModel>? homeLocalNetworksData;

  void addHomeLocalNetworksData({
    required String customName,
    required String nameHomeWifiNetwork,
    required String nameFromListListWifiName,
  }) {
    homeLocalNetworksData?.add(
      HomeNetworkModel(
        customName: customName,
        nameHomeWifiNetwork: nameHomeWifiNetwork,
        nameFromListListWifiName: nameFromListListWifiName,
      ),
    );
    update();
  }

  void removeHomeLocalNetworksData(int indexFireplace) async {
    final rec = homeLocalNetworksData?.values.elementAt(indexFireplace);
    rec?.delete();
  }

  void renameHomeLocalNetworksData(
      {required int indexFireplace, required customName}) async {
    final rec = homeLocalNetworksData!.values.elementAt(indexFireplace);
    rec.customName = customName;

    rec.save(); //запишет как раз все изменения
    update();
  }

  ///для поиска и подключение к камину с установкой параметров___________________________________________________
  //тут будут лежать id каминов
  static const Set<String> _listWifiName = <String>{'1', '2', '3', '4'};

  String titleModel = '';

  //если обнаружен id в базе или в мапе локальных данных
  bool? isFireplaceDetectedInDatabase;

  String? wifiName = 'null wifiName';

  Future<void> _optionsFireplace() async {
    isBlocButton = fireplaceData?.isBlocButton ?? false;

    isSwitchCracklingSoundEffect =
        fireplaceData?.sliderValueCracklingSoundEffect != null ? true : false;

    isSwitchVoicePrompts =
        fireplaceData?.sliderValueVoicePrompts != null ? true : false;

    isOptionTimer =
        fireplaceData?.optionTimerStatusAndValue.values.first != null
            ? true
            : false;

    isSwitchClickSound = fireplaceData?.isSwitchClickSound ?? false;

    //камин запущен?
    isPlayFireplace = fireplaceData?.isPlayFireplace ?? false;

    valuePowerFireplace =
        (fireplaceData?.sliderValue.values.first ?? 1).toDouble();

    //охлаждение камина начато?
    // isCoolingFireplace = fireplaceData?.isPlayFireplace ?? false;;

    //если ошибка топливной системы
    // isFuelSystemError = false;
    update();
    changeAlertMessage(
        newAlertMessage: (isPlayFireplace)
            ? "уровень пламени №${valuePowerFireplace.toInt()}"
            : null);
  }

  Future<void> detectedFireplaceFromSearchFireplaceInListWithIdWifi({
    required ListNamesFireplace nameFireplace,
  }) async {
    try {
      printTitle({required String title}) => print(
          'detected fireplace from searchFireplaceInListWithIdWifi el $nameFireplace $title');
      await initFireplaceData(wifiName: nameFireplace);
      //опции для камина
      switch (nameFireplace) {
        case ListNamesFireplace.smartPrime1000:
          titleModel = 'smart Prime 1000';
          printTitle(title: titleModel);
          update();
          break;
        case ListNamesFireplace.smartFireA71000:
          titleModel = 'smart Fire A7 1000';
          printTitle(title: titleModel);
          update();
          break;
        case ListNamesFireplace.smartFireA51000:
          titleModel = 'smart Fire A5 1000';
          printTitle(title: titleModel);
          update();
          break;
        case ListNamesFireplace.smartFireA31000:
          titleModel = 'smart Fire A3 1000';
          printTitle(title: titleModel);
          update();
          break;
      }

      return;
    } catch (error) {
      print(
          'error from detectedFireplaceFromSearchFireplaceInListWithIdWifi $titleModel $error');
      return;
    }
  }

  Future<void> searchFireplaceInListWithIdWifi({
    required String? wifiName,
  }) async {
    if (wifiName != null) {
      wifiName = wifiName.removeAllWhitespace.toLowerCase();
      try {
        changeIsTimerUpdateDataBase(isTimerUpdateDataBase: false);
        disposeFireplaceData();
        //перевожу в состояние не найден с начала
        isFireplaceDetectedInDatabase = null;
        update();

        //первым делом проверю на данные из списка констант id wifi
        if (_listWifiName.contains(wifiName)) {
          log("идет поиск каимна напрямую по сравнению имени wifi и списка костант имен сетей");
          //камин обнаружен и идет переход на главную страницу
          isFireplaceDetectedInDatabase = true;
          update();

          //проверка всех типов камина  ///delete after test
          if (wifiName == _listWifiName.elementAt(0)) {
            detectedFireplaceFromSearchFireplaceInListWithIdWifi(
              nameFireplace: ListNamesFireplace.smartPrime1000,
            );
            return;
          } else if (wifiName == _listWifiName.elementAt(1)) {
            detectedFireplaceFromSearchFireplaceInListWithIdWifi(
              nameFireplace: ListNamesFireplace.smartFireA71000,
            );
            return;
          } else if (wifiName == _listWifiName.elementAt(2)) {
            detectedFireplaceFromSearchFireplaceInListWithIdWifi(
              nameFireplace: ListNamesFireplace.smartFireA51000,
            );
            return;
          } else if (wifiName == _listWifiName.elementAt(3)) {
            detectedFireplaceFromSearchFireplaceInListWithIdWifi(
              nameFireplace: ListNamesFireplace.smartFireA31000,
            );
            return;
          }
        } else {
          /// проверяю по сохраненному в память листу с именами домашних сетей
          log("проверяю по сохраненному в память листу с именами домашних сетей");

          await services
              .getInstanceHiveHomeLocalNetworksData(keyWifiName: wifiName)
              .then(
            (Box<HomeNetworkModel>? newHomeLocalNetworksData) {
              if (newHomeLocalNetworksData != null &&
                  newHomeLocalNetworksData.isNotEmpty) {
                homeLocalNetworksData = newHomeLocalNetworksData;
                update();
                isFireplaceDetectedInDatabase = true;
                for (var homeNetwork in newHomeLocalNetworksData.values) {
                  if (homeNetwork.nameHomeWifiNetwork.toLowerCase() ==
                      wifiName!.toLowerCase()) {
                    wifiName = homeNetwork.nameFromListListWifiName;
                    update();
                  }
                }
              } else {
                isFireplaceDetectedInDatabase = false;
                update();

                Get.defaultDialog(
                  titlePadding: EdgeInsets.zero,
                  content: Column(
                    children: [
                      Text(
                        'Камин с именем $wifiName не распознан',
                        style: Get.textTheme.headline2,
                        textAlign: TextAlign.center,
                      ),
                      GestureDetector(
                        onTap: () {
                          print('todo url instruction');

                          ///todo url instruction
                        },
                        child: Text(
                          "ИНСТРУКЦИЯ",
                          style: Get.textTheme.headline2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ); //получаю данные по локальным сетям
        }
      } catch (error) {
        throw Exception(
            '$error from searchFireplaceInListWithIdWifi Business Layout');
      }
    } else {
      isFireplaceDetectedInDatabase = false;
      update();
      Get.defaultDialog(
        titlePadding: EdgeInsets.zero,
        content: Column(
          children: [
            Text(
              "Ошибка подключения, посмотрите интсрукцию\n",
              style: Get.textTheme.headline2,
              textAlign: TextAlign.center,
            ),
            GestureDetector(
              onTap: () {
                print('todo url instruction');

                ///todo url instruction
              },
              child: Text(
                "ИНСТРУКЦИЯ",
                style: Get.textTheme.headline2,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        title: 'WiFi is null',
      );
    }
  }

  //получение данных о сети wifi через пакет network_info_plus
  Future<String?> _initNetworkInfo() async {
    await Hive.initFlutter(); //иннициализируем
    // для сложных типов нужно зарегистрировать адаптеры
    Hive.registerAdapter(HomeNetworkModelAdapter());
    return await NetworkInfo().getWifiName();
  }

  ///отдельно для контроллера SmartA1000
  void setNormModeForSmartA1000() {
    alertMessage = 'уровень пламени NORM';
    update();
  }

  void setEcoModeForSmartA1000() {
    alertMessage = 'уровень пламени ECO';
    update();
  }
}
