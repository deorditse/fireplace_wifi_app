import 'package:data_layout/data_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_countdown_timer/countdown.dart';
import 'package:flutter_countdown_timer/countdown_controller.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:models/models.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';
import 'package:hive/hive.dart';
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
    _initNetworkInfo().then((_) {
      //   теперь Wifi name известен и можно парсить данные с апи
      //чтобы понять какой камин нужно обращаться к
      searchFireplaceInListWithIdWifi(wifiName: wifiName).then((value) {
        print('wifiName _______initNetworkInfo  $wifiName');
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
  Future<void> initFireplaceData({required /*String?*/ int? url}) async {
    if (url != null && url != '') {
      fireplaceData =
          await services.getFireplaceData(url: url).whenComplete(() async {
        changeIsTimerUpdateDataBase(isTimerUpdateDataBase: true);
        await _initialFireplaceData(url: url);
      });
      update();
      await _optionsFireplace();
    }
  }

  Future<void> _initialFireplaceData({
    required /*String?*/ int? url,
  }) async {
    Timer.periodic(Duration(seconds: 2), (timer) async {
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
    // isSettingButton
    //     ? changeStartStopTimer(isTimerStart: false)
    //     : changeStartStopTimer(isTimerStart: true);
  }

  // //серийный номер
  // String serialNumber = '';
  //
  // //Дс code
  // String dcCode = '';
  //
  // //дата производства
  // String dateOfManufacture = '';

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
  // double sliderValue = 1.0;
  // int maxLevelSliderFireplace = 3;

  void changeButtonPlayStopFireplace() {
    isPlayFireplace ? stopFireplace() : playFireplace();
  }

  changeAlertMessage({required String? newAlertMessage}) {
    alertMessage = newAlertMessage ?? "камин готов к работе";
    update();
  }

  Future<void> playFireplace() async {
    if (!isCoolingFireplace) {
      changeAlertMessage(newAlertMessage: 'розжиг камина');
      isPlayFireplace = true;
      update();
    }

    await Future.delayed(Duration(seconds: 4)).whenComplete(
      () => changeAlertMessage(
          newAlertMessage: (isPlayFireplace)
              ? "уровень пламени №${valuePowerFireplace.toInt()}"
              : null),
    );
  }

  void stopFireplace() async {
    if (!isCoolingFireplace) {
      isPlayFireplace = false;
      update();
      //запуск озлаждения камина
      await startCoolingFireplace();
      //после чего обновляем стейт
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
    changeAlertMessage(newAlertMessage: 'охлаждение камина');
    update();
    await Future.delayed(
      const Duration(seconds: 3),
    ).then((value) {
      isCoolingFireplace = false;
      update();
    });
  }

  ///для таймера___________________________________________________
  //данные таймера
  bool isOptionTimer = false;

  //данные таймера обратного отсчета

  bool timerIsRunning = false;

  Timer? _timer;
  int _timerStart = 0; // 10 min
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
      _timerStart = 0;
      timerIsRunning = false;
      _timer?.cancel();
      update();
      _formatHHMMSS(_timerStart);
      return;
    }
    if (isIncrement != null && isIncrement) {
      _timerStart += 600;
      update();
      _formatHHMMSS(_timerStart);
      return;
    } else {
      if (_timerStart > 0) {
        _timerStart -= 600;
        update();
        _formatHHMMSS(_timerStart);
      }
      return;
    }
  }

  void startTimer() {
    if (_timerStart == 0) {
      Get.snackbar('Установите таймер', '');
      return;
    }

    timerIsRunning = true;

    _timer = Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) {
        if (_timerStart == 0) {
          timerIsRunning = false;
          timer.cancel();
          update();
          return;
        } else {
          _timerStart -= 1;
          _formatHHMMSS(_timerStart);
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

  Future<void> _getInstanceHive({required String keyWifiName}) async {
    homeLocalNetworksData = await services.getInstanceHiveHomeLocalNetworksData(
        keyWifiName: keyWifiName);
    update();
  }

  void addHomeLocalNetworksData({
    required String customName,
    required String nameHomeWifiNetwork,
    required String nameFromListListWifiName,
  }) {
    homeLocalNetworksData?.add(HomeNetworkModel(
      customName: customName,
      nameHomeWifiNetwork: nameHomeWifiNetwork,
      nameFromListListWifiName: nameFromListListWifiName,
    ));
  }

  void removeHomeLocalNetworksData(int indexCategory) async {
    final rec = homeLocalNetworksData?.values.elementAt(indexCategory);
    rec?.delete();
  }

  void renameHomeLocalNetworksData(
      {required int indexCategory, required customName}) async {
    final rec = homeLocalNetworksData!.values.elementAt(indexCategory);
    rec.customName = customName;

    rec.save(); //запишет как раз все изменения
    update();
  }

  ///для поиска и подключение к камину с установкой параметров___________________________________________________
  //тут будут лежать id каминов
  Set<String> _listWifiName = {'1', '2', '3', '4'};

  String titleModel = '';

  //если обнаружен id в базе или в мапе локальных данных
  bool isFireplaceDetectedInDatabase = false;

  String wifiName = 'null wifiName';
  String wifiBSSID = 'null wifiBSSID';

  Future<void> _optionsFireplace() async {
    print('____________optionsFireplace $fireplaceData');

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

  Future<void> searchFireplaceInListWithIdWifi({
    required String wifiName,
    /*String? wifiBSSID*/
  }) async {
    try {
      changeIsTimerUpdateDataBase(isTimerUpdateDataBase: false);
      disposeFireplaceData();
      //перевожу в состояние не найден с начала
      isFireplaceDetectedInDatabase = false;

      update();

      //первым делом проверю на данные из локальной памяти
      if (wifiName == _listWifiName.elementAt(0)) {
        //smartPrime_1000
        try {
          //обнуляю таймер
          ///перенесено в отдельный метод куда нужно отправлять SSID wifi data
          print('detected fireplace from searchFireplaceInListWithIdWifi el 0');
          titleModel = 'smart Prime 1000';
          //камин обнаружен и идет переход на главную страницу
          isFireplaceDetectedInDatabase = true;
          update();
          await initFireplaceData(url: 0);
          //опции для камина

          return;
        } catch (error) {
          print(
              'error from searchFireplaceInListWithIdWifi smartPrime_1000 $error');
          return;
        }
      } else if (wifiName == _listWifiName.elementAt(1)) {
        //smartFireA7_1000
        try {
          print('detected fireplace from searchFireplaceInListWithIdWifi el 1');
          titleModel = 'smart Fire A7 1000';
          //камин обнаружен и идет переход на главную страницу
          isFireplaceDetectedInDatabase = true;
          update();
          await initFireplaceData(url: 1);

          return;
        } catch (error) {
          print(
              'error from searchFireplaceInListWithIdWifi smartFireA7_1000 $error');
          return;
        }
      } else if (wifiName == _listWifiName.elementAt(2)) {
        //smartFireA5_1000
        try {
          print('detected fireplace from searchFireplaceInListWithIdWifi el 2');
          titleModel = 'smart Fire A5 1000';
          //камин обнаружен и идет переход на главную страницу
          isFireplaceDetectedInDatabase = true;
          update();

          await initFireplaceData(url: 2);

          return;
        } catch (error) {
          print(
              'error from searchFireplaceInListWithIdWifi smartFireA5_1000 $error');
          return;
        }
      } else if (wifiName == _listWifiName.elementAt(3)) {
        //smartFireA3_1000
        try {
          print('detected fireplace from searchFireplaceInListWithIdWifi el 3');
          titleModel = 'smart Fire A3 1000';
          //камин обнаружен и идет переход на главную страницу
          isFireplaceDetectedInDatabase = true;
          update();
          await initFireplaceData(url: 3);

          return;
        } catch (error) {
          print(
              'error from searchFireplaceInListWithIdWifi smartFireA3_1000 $error');
          return;
        }
      } else {
        try {
          // проверяю по сохраненному в память листу с именами домашних сетей
          await _getInstanceHive(
              keyWifiName: wifiName); //получаю данные по локальным сетям

          ///delete after test
          wifiName == _listWifiName.elementAt(int.parse(wifiName));

          ///

          String? _wifiNameHomeNetworkFromLocalStorage;

          if (homeLocalNetworksData != null &&
              homeLocalNetworksData!.isNotEmpty) {
            isFireplaceDetectedInDatabase = true;

            // homeLocalNetworksData!.values
            //     .toList()
            //     .forEach((key) {
            //   if (key == wifiName) {
            //     _wifiNameHomeNetworkFromLocalStorage =
            //         mapWithWifiNameHomeNetworkAndNameFromListWifiName![key];
            //     update();
            //
            //     wifiName = _wifiNameHomeNetworkFromLocalStorage!;
            //     update();
            //
            //     searchFireplaceInListWithIdWifi(
            //         wifiName: _wifiNameHomeNetworkFromLocalStorage!);
            //   }
            // });
          } else {
            isFireplaceDetectedInDatabase = false;
            update();

            Get.defaultDialog(
              titlePadding: EdgeInsets.zero,
              content: Text(
                'Камин с именем ${wifiName} не распознан',
                style: Get.textTheme.headline2,
              ),
            );
          }
        } catch (error) {
          print(
              'error from searchFireplaceInListWithIdWifi _wifiNameHomeNetworkFromLocalStorage $error');
          return;
        }
      }

      // isLoadingDataIdWifi = false;
      // update();

    } catch (error) {
      throw Exception(
          '$error from searchFireplaceInListWithIdWifi Business Layout');
    }
  }

  //получение данных о сети wifi через пакет network_info_plus
  Future<void> _initNetworkInfo() async {
    final NetworkInfo _networkInfo = NetworkInfo();
    String? thisWifiName,
        thisWifiBSSID,
        thisWifiIPv4,
        thisWifiIPv6,
        thisWifiGatewayIP,
        thisWifiBroadcast,
        thisWifiSubmask;

    try {
      if (!kIsWeb && Platform.isIOS) {
        var status = await _networkInfo.getLocationServiceAuthorization();
        if (status == LocationAuthorizationStatus.notDetermined) {
          status = await _networkInfo.requestLocationServiceAuthorization();
        }
        if (status == LocationAuthorizationStatus.authorizedAlways ||
            status == LocationAuthorizationStatus.authorizedWhenInUse) {
          thisWifiName = await _networkInfo.getWifiName();
        } else {
          thisWifiName = await _networkInfo.getWifiName();
        }
      } else {
        var status = await Permission.location.status;
        if (status.isDenied || status.isRestricted) {
          if (await Permission.location.request().isGranted) {}
        }
        thisWifiName = await _networkInfo.getWifiName();
      }
    } on PlatformException catch (e) {
      developer.log('Failed to get Wifi Name', error: e);
      thisWifiName = 'Failed to get Wifi Name';
    }

    try {
      if (!kIsWeb && Platform.isIOS) {
        var status = await _networkInfo.getLocationServiceAuthorization();
        if (status == LocationAuthorizationStatus.notDetermined) {
          status = await _networkInfo.requestLocationServiceAuthorization();
        }
        if (status == LocationAuthorizationStatus.authorizedAlways ||
            status == LocationAuthorizationStatus.authorizedWhenInUse) {
          thisWifiBSSID = await _networkInfo.getWifiBSSID();
        } else {
          thisWifiBSSID = await _networkInfo.getWifiBSSID();
        }
      } else {
        thisWifiBSSID = await _networkInfo.getWifiBSSID();
      }
    } on PlatformException catch (e) {
      developer.log('Failed to get Wifi BSSID', error: e);
      thisWifiBSSID = 'Failed to get Wifi BSSID';
    }

    try {
      thisWifiIPv4 = await _networkInfo.getWifiIP();
    } on PlatformException catch (e) {
      developer.log('Failed to get Wifi IPv4', error: e);
      thisWifiIPv4 = 'Failed to get Wifi IPv4';
    }

    try {
      thisWifiIPv6 = await _networkInfo.getWifiIPv6();
    } on PlatformException catch (e) {
      developer.log('Failed to get Wifi IPv6', error: e);
      thisWifiIPv6 = 'Failed to get Wifi IPv6';
    }

    try {
      thisWifiSubmask = await _networkInfo.getWifiSubmask();
    } on PlatformException catch (e) {
      developer.log('Failed to get Wifi submask address', error: e);
      thisWifiSubmask = 'Failed to get Wifi submask address';
    }

    try {
      thisWifiBroadcast = await _networkInfo.getWifiBroadcast();
    } on PlatformException catch (e) {
      developer.log('Failed to get Wifi broadcast', error: e);
      thisWifiBroadcast = 'Failed to get Wifi broadcast';
    }

    try {
      thisWifiGatewayIP = await _networkInfo.getWifiGatewayIP();
    } on PlatformException catch (e) {
      developer.log('Failed to get Wifi gateway address', error: e);
      thisWifiGatewayIP = 'Failed to get Wifi gateway address';
    }

    try {
      thisWifiSubmask = await _networkInfo.getWifiSubmask();
    } on PlatformException catch (e) {
      developer.log('Failed to get Wifi submask', error: e);
      thisWifiSubmask = 'Failed to get Wifi submask';
    }

    ///все доступные данные
    wifiName = thisWifiName ?? 'null';
    wifiBSSID = thisWifiBSSID ?? 'null';
    update();
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
