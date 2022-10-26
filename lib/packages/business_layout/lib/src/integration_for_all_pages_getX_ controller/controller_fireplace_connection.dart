import 'package:data_layout/data_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_countdown_timer/countdown.dart';
import 'package:flutter_countdown_timer/countdown_controller.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';

//для запуска кодогенерации flutter packages pub run build_runner build --delete-conflicting-outputs

// в этом файле лежат общие настройки состояний для всех моделей, c отдельными модификациями будет свои контроллеры у каждой модели
class FireplaceConnectionGetXController extends GetxController {
  static FireplaceConnectionGetXController instance = Get.find();

  //подключение к слою данных / сервисному слою
  final services = ImplementationFireplaceServices();

  @override
  void onClose() {
    super.onClose();
    print('onClose onCloseonCloseonCloseonClose');
  }

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

  ///обновление данных с сервера
  ifIsFireplaceDetectedInDatabase({required String url}) {
    // if (isFireplaceDetectedInDatabase) {
    Timer.periodic(Duration(seconds: 2), (timer) {
      // initialFireplaceData(url: '');
      print(timer.toString());
    });
    // }
  }

  ///инициализация данных на экране

  Future<void> initialFireplaceData({required String url}) async {
    fireplaceData = await services.getFireplaceData(url: url);
    update();
  }

  ///общие параметры__________________________________
  //при первом входе в приложение - либо сделать linear bar при загрузке данных

  FireplaceDataModel? fireplaceData;

//выбран камин For1000Fireplace
  bool isButtonFor1000Fireplace = false;

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

  // //серийный номер
  // String serialNumber = '';
  //
  // //Дс code
  // String dcCode = '';
  //
  // //дата производства
  // String dateOfManufacture = '';

  // //звук нажатия кнопок
  // bool isSwitchClickSound = false;

  void changeSwitchButtonClickSound() {
    fireplaceData!.isSwitchClickSound = !fireplaceData!.isSwitchClickSound;
    update();
  }

  //Звуковой эффект потрескивание дров
  bool isSwitchCracklingSoundEffect = false;
  double sliderValueCracklingSoundEffect = 0.0;

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
  // bool isBlocButton = false;

  void changeIsBlocButton({bool? newIsBlocButton}) {
    fireplaceData!.isBlocButton =
        newIsBlocButton ?? !fireplaceData!.isBlocButton;
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

  void playFireplace() {
    alertMessage =
        /* isButtonFor1000Fireplace ? 'уровень пламени NORM' :*/ 'розжиг камина';
    isPlayFireplace = true;
    update();
  }

  void stopFireplace() async {
    //запуск озлаждения камина
    await startCoolingFireplace();
    //после чего обновляем стейт
    alertMessage = 'камин готов к работе';
    isPlayFireplace = false;
    update();
  }

  //запуск озлаждения камина
  Future<void> startCoolingFireplace() async {
    isCoolingFireplace = true;
    alertMessage = 'охлаждение камина';
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

  //общее время работы камина
  String dataTimeWorkFireplace = '00 : 00 : 00';

  //данные таймера обратного отсчета
  String dataCountdownTimer = '00 : 10 : 00';
  List<String> dataTimer = ['00', '00', '00']; //часы _ минуты _секунды
  bool timerIsRunning = false;
  CountdownController? _countdownController;

  void dataTimerStart({int? hours, int? minutes, int? seconds}) {
    try {
      dataTimer[0] = '${hours ?? dataTimer[0]}';
      dataTimer[1] = '${minutes ?? dataTimer[1]}';
      dataTimer[2] = '${seconds ?? dataTimer[2]}';
      update();

      if (dataTimer[0] == '00' &&
          dataTimer[1] == '00' &&
          dataTimer[2] == '00') {
        Get.snackbar('Установите таймер', 'не может быть 00 : 00 : 00');
      } else {
        timerIsRunning = true;
        update();
      }

      _countdownController = CountdownController(
          duration: Duration(
            hours: hours ?? 0,
            minutes: minutes ?? 0,
            seconds: seconds ?? 0,
          ),
          onEnd: () {
            print('onEnd');
          });
      update();
      Countdown(
        countdownController: _countdownController!,
        builder: (_, Duration time) {
          return Container();
        },
      );
    } catch (error) {
      throw Exception('$error from dataTimerStart Business Layout');
    }
  }

  void dataTimerStop() {
    timerIsRunning = false;
    update();
  }

  void updateDataTimer({String? hour, String? minutes, String? seconds}) {
    dataTimer = [
      hour ?? dataTimer[0],
      minutes ?? dataTimer[1],
      seconds ?? dataTimer[2],
    ];
    print('newDataTimer');
    update();
  }

  ///для добавления камина в домашнюю сеть Wifi___________________________________________________

  //сохранять этот  map в локальную память и первым делом проверять его при инициации и проверке на совпадение со списком имен
  Map<String, String>? _mapWithWifiNameHomeNetworkAndNameFromListWifiName;

  ///для поиска и подключение к камину с установкой параметров___________________________________________________
  //тут будут лежать id каминов
  Set<String> _listWifiName = {'1', '2', '3', '4'};

  String titleModel = '';

  //загрузка данных фай фай чтобы отобразить circular progress indicator
  bool isLoadingDataIdWifi = true;

  //если обнаружен id в базе
  bool isFireplaceDetectedInDatabase = false;

  String wifiName = '';
  String wifiBSSID = '';

  Future<void> searchFireplaceInListWithIdWifi({
    required String wifiName,
    /*String? wifiBSSID*/
  }) async {
    try {
      //загрузка камина
      isLoadingDataIdWifi = true;
      //перевожу в состояние не найден с начала
      isFireplaceDetectedInDatabase = false;
      update();

      //первым делом проверю на данные из локальной памяти
      if (wifiName == _listWifiName.elementAt(0)) {
        //smartPrime_1000
        try {
          ifIsFireplaceDetectedInDatabase(url: '');
          initialFireplaceData(url: '');
//delete after testing
          ///перенесено в отдельный метод куда нужно отправлять SSID wifi data
          print('detected fireplace from searchFireplaceInListWithIdWifi el 0');
          titleModel = 'smartPrime_1000';
          //камин обнаружен и идет переход на главную страницу
          isFireplaceDetectedInDatabase = true;
          //опции для камина
          isOptionTimer = false;
          //
          fireplaceData?.temperature = 20;
          fireplaceData?.CO2value = null;
          fireplaceData?.percentOil = 90;
          fireplaceData?.wet = 10;
          fireplaceData?.CO2value = 234; //null
          isButtonFor1000Fireplace = true;
          isSwitchCracklingSoundEffect = false;
          sliderValueCracklingSoundEffect = 5;
          sliderValueVoicePrompts = 0;
          alertMessage = 'камин готов к работе';
          isFuelSystemError = false;
          isCoolingFireplace = false;
          isLoadingDataIdWifi = false;
          update();
          // await getDataForFireplace();
          return;
        } catch (error) {
          print(
              'error from searchFireplaceInListWithIdWifi smartPrime_1000 $error');
          return;
        }
      } else if (wifiName == _listWifiName.elementAt(1)) {
        //smartFireA7_1000
        try {
          ifIsFireplaceDetectedInDatabase(url: '');
          print('detected fireplace from searchFireplaceInListWithIdWifi el 1');
          titleModel = 'smartFireA7_1000';
          //камин обнаружен и идет переход на главную страницу
          isFireplaceDetectedInDatabase = true;
          //опции для камина
          fireplaceData?.sliderValueVoicePrompts = 2;
          fireplaceData?.sliderValueCracklingSoundEffect = 3;
          isOptionTimer = true;
          fireplaceData?.wet = 45;
          fireplaceData?.CO2value = 45;
          fireplaceData?.temperature = 40;
          fireplaceData?.percentOil = 50;
          isButtonFor1000Fireplace = false;
          fireplaceData?.sliderValue?[0] = 3;
          fireplaceData?.sliderValue?[1] = 7;
          fireplaceData?.serialNumber = 'smartFireA7_1000';
          fireplaceData?.dcCode = 'smartFireA7_1000';
          fireplaceData?.dateOfManufacture = '11.01.2022';
          fireplaceData?.isSwitchClickSound = true;
          isSwitchCracklingSoundEffect = false;
          sliderValueCracklingSoundEffect = 0;
          sliderValueVoicePrompts = 0;
          alertMessage = 'камин готов к работе';
          isFuelSystemError = false;
          isCoolingFireplace = false;
          isLoadingDataIdWifi = false;
          update();
          return;
        } catch (error) {
          print(
              'error from searchFireplaceInListWithIdWifi smartFireA7_1000 $error');
          return;
        }
      } else if (wifiName == _listWifiName.elementAt(2)) {
        //smartFireA5_1000
        try {
          ifIsFireplaceDetectedInDatabase(url: '');
          print('detected fireplace from searchFireplaceInListWithIdWifi el 2');
          titleModel = 'smartFireA5_1000';
          //камин обнаружен и идет переход на главную страницу
          isFireplaceDetectedInDatabase = true;
          //опции для камина
          isOptionTimer = true;
          //
          // CO2value = 45;
          fireplaceData?.sliderValueVoicePrompts = 1;
          fireplaceData?.sliderValueCracklingSoundEffect = 2;
          fireplaceData?.wet = 15;
          fireplaceData?.temperature = 120;
          fireplaceData?.percentOil = 10;
          isButtonFor1000Fireplace = false;
          fireplaceData?.sliderValue?[0] = 1;
          fireplaceData?.sliderValue?[1] = 5;
          fireplaceData?.serialNumber = 'smartFireA5_1000';
          fireplaceData?.dcCode = 'smartFireA5_1000';
          fireplaceData?.dateOfManufacture = '12.05.2022';
          fireplaceData?.isSwitchClickSound = true;
          isSwitchCracklingSoundEffect = false;
          sliderValueCracklingSoundEffect = 20;
          sliderValueVoicePrompts = 0;
          alertMessage = 'камин готов к работе';
          isFuelSystemError = false;
          isCoolingFireplace = false;
          isLoadingDataIdWifi = false;
          update();
          return;
        } catch (error) {
          print(
              'error from searchFireplaceInListWithIdWifi smartFireA5_1000 $error');
          return;
        }
      } else if (wifiName == _listWifiName.elementAt(3)) {
        //smartFireA3_1000
        try {
          ifIsFireplaceDetectedInDatabase(url: '');
          print('detected fireplace from searchFireplaceInListWithIdWifi el 3');
          titleModel = 'smartFireA3_1000';
          //камин обнаружен и идет переход на главную страницу
          isFireplaceDetectedInDatabase = true;
          //опции для камина
          isOptionTimer = false;
          //
          // CO2value = 45;
          fireplaceData?.sliderValueVoicePrompts = 0;
          fireplaceData?.sliderValueCracklingSoundEffect = 3;
          fireplaceData?.wet = 75;
          fireplaceData?.temperature = 50;
          fireplaceData?.percentOil = 100;
          isButtonFor1000Fireplace = false;
          fireplaceData?.sliderValue?[0] = 2;
          fireplaceData?.sliderValue?[1] = 3;
          fireplaceData?.serialNumber = 'smartFireA3_1000';
          fireplaceData?.dcCode = 'smartFireA3_1000';
          fireplaceData?.dateOfManufacture = '10.08.2022';
          fireplaceData?.isSwitchClickSound = true;
          isSwitchCracklingSoundEffect = false;
          sliderValueCracklingSoundEffect = 20;
          sliderValueVoicePrompts = 0;
          alertMessage = 'камин готов к работе';
          isFuelSystemError = false;
          isCoolingFireplace = false;
          isLoadingDataIdWifi = false;
          update();
          return;
        } catch (error) {
          print(
              'error from searchFireplaceInListWithIdWifi smartFireA3_1000 $error');
          return;
        }
      } else {
        try {
          // проверяю по сохраненному в память листу с именами домашних сетей
          _mapWithWifiNameHomeNetworkAndNameFromListWifiName = await services
              .getDataMapWithWifiNameHomeNetworkAndNameFromListWifiName();
          update();

          //форматт сохранения в базу Map<имя домашней WiFi, IP камина из _listWifiName> _mapWithWifiNameHomeNetworkAndNameFromListWifiName

          String? _wifiNameHomeNetworkFromLocalStorage;
          if (_mapWithWifiNameHomeNetworkAndNameFromListWifiName != null &&
              _mapWithWifiNameHomeNetworkAndNameFromListWifiName!.isNotEmpty &&
              _mapWithWifiNameHomeNetworkAndNameFromListWifiName!.keys
                  .contains(wifiName)) {
            isFireplaceDetectedInDatabase = true;

            _mapWithWifiNameHomeNetworkAndNameFromListWifiName!.keys
                .toList()
                .forEach((key) {
              if (key == wifiName) {
                _wifiNameHomeNetworkFromLocalStorage =
                    _mapWithWifiNameHomeNetworkAndNameFromListWifiName![key];
                update();

                wifiName = _wifiNameHomeNetworkFromLocalStorage!;
                update();

                searchFireplaceInListWithIdWifi(
                    wifiName: _wifiNameHomeNetworkFromLocalStorage!);
              }
            });
          } else {
            isFireplaceDetectedInDatabase = false;
            update();

            Get.defaultDialog(
                title:
                    'Камин не найден для этой домашней сети - показать инструкцию');
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
    wifiName = thisWifiName ?? '';
    wifiBSSID = thisWifiBSSID ?? '';
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
