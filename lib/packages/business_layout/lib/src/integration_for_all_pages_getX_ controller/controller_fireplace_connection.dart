import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_countdown_timer/countdown.dart';
import 'package:flutter_countdown_timer/countdown_controller.dart';
import 'package:get/get.dart';
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

  @override
  void onClose() {
    super.onClose();
    print('onClose onCloseonCloseonCloseonClose');
  }

  @override
  void onInit() {
    super.onInit();
    //сразу проверю данные сети, в которой нахожусь
    _initNetworkInfo().then((_) {
      ///сделать поиск по id камина вызовом searchFireplaceInlistWithIdWifi
      ///первым делом проверять id локальной сети телефона mapLocalNetworkNameAndIdWifi, только потом иммутабельные данные listWithIdWifi
      //  searchFireplaceInlistWithIdWifi(wifiName: wifiName, wifiBSSID: wifiBSSID);
    });
  }

  bool isButtonFor1000Fireplace = false;

  //значение уровня топлива
  double? percentOil;

  //значение температуры
  double? temperature;

  //опция isOptionCO2level
  bool isOptionCO2level = false;

  //значение CO2
  double? CO2value;

//значение влажности
  double? wet;

  ///для информационных сообщений___________________________________________________
  //окно с информационным сообщением
  String alertMessage = 'камин готов к работе';

  // void ifFuelSystemError() {
  //   alertMessage = 'ОШИБКА: неисправность\nтопливной системы!!!';
  //   update();
  // }

  ///для экрана настройки___________________________________________________
  //кнопка настроек нажата?
  Rx<bool> isSettingButton = false.obs;

  //серийный номер
  String serialNumber = '';

  //Дс code
  String dcCode = '';

  //дата производства
  String dateOfManufacture = '';

  //звук нажатия кнопок
  bool isSwitchClickSound = false;

  void changeSwitchButtonClickSound() {
    isSwitchClickSound = !isSwitchClickSound;
    update();
  }

  //Звуковой эффект потрескивание дров
  bool isOptionFirewoodCracklingSoundEffect = false;
  bool isSwitchCracklingSoundEffect = false;
  double sliderValueCracklingSoundEffect = 0.0;

  void changeSwitchCracklingSoundEffect() {
    isSwitchCracklingSoundEffect = !isSwitchCracklingSoundEffect;
    update();
  }

  //Голосовые подсказки
  bool isOptionVoicePrompts = false;
  bool isSwitchVoicePrompts = false;
  double sliderValueVoicePrompts = 0;

  void changeSwitchVoicePrompts() {
    isSwitchVoicePrompts = !isSwitchVoicePrompts;
    update();
  }

  ///для экрана блокировки___________________________________________________
  //кнопка блокирования экрана нажата?
  Rx<bool> isBlocButton = false.obs;

  //заданный пользователем пароль - сохранить в локальную базу
  int? passwordBlock = 5539;

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
  bool isOptionSliderFireplace = false;
  int maxLevelSliderFireplace = 3;

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
  String dataTimeWorkFireplace = '00 : 00 : 00';
  List<String> dataTimer = ['00', '00', '00']; //часы _ минуты _секунды
  bool timerIsRunning = false;
  CountdownController? _countdownController;

  void dataTimerStart({int? hours, int? minutes, int? seconds}) {
    dataTimer[0] = '${hours ?? dataTimer[0]}';
    dataTimer[1] = '${minutes ?? dataTimer[1]}';
    dataTimer[2] = '${seconds ?? dataTimer[2]}';
    update();

    if (dataTimer[0] == '00' && dataTimer[1] == '00' && dataTimer[2] == '00') {
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

  ///для поиска и подключение к камину с установкой параметров___________________________________________________
  //тут будут лежать id каминов
  Set<String> listWithIdWifi = {'1', '2', '3', '4'};

  String titleModel = '';

  //для локальной сети id каминов - сравнение в первую очередь
  Map<String, String> mapLocalNetworkNameAndIdWifi = {};

  //загрузка данных фай фай чтобы отобразить circular progress indicator
  bool isLoadingDataIdWifi = true;

  //если обнаружен id в базе
  bool isFireplaceDetectedInDatabase = false;

  String wifiName = '';
  String wifiBSSID = '';

  void searchFireplaceInListWithIdWifi({String? wifiName, String? wifiBSSID}) {
    //загрузка камина
    isLoadingDataIdWifi = true;
    //перевожу в состояние не найден с начала
    isFireplaceDetectedInDatabase = false;
    update();
    if (wifiBSSID == listWithIdWifi.elementAt(0)) {
      //smartPrime_1000
      try {
        print('detected fireplace from searchFireplaceInListWithIdWifi el 0');
        titleModel = 'smartPrime_1000';
        //камин обнаружен и идет переход на главную страницу
        isFireplaceDetectedInDatabase = true;
        //опции для камина
        isOptionCO2level = false;
        isOptionSliderFireplace = false;
        isOptionFirewoodCracklingSoundEffect = false;
        isOptionTimer = false;
        isOptionVoicePrompts = false;
        //
        temperature = 20;
        percentOil = 90;
        wet = 10;
        // CO2value = 45;
        isButtonFor1000Fireplace = false;
        maxLevelSliderFireplace = 0;
        serialNumber = 'smartPrime_1000';
        dcCode = 'smartPrime_1000';
        dateOfManufacture = '21.08.2022';
        isSwitchClickSound = true;
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
    }
    if (wifiBSSID == listWithIdWifi.elementAt(1)) {
      //smartFireA7_1000
      try {
        print('detected fireplace from searchFireplaceInListWithIdWifi el 1');
        titleModel = 'smartFireA7_1000';
        //камин обнаружен и идет переход на главную страницу
        isFireplaceDetectedInDatabase = true;
        //опции для камина
        isOptionCO2level = true;
        isOptionFirewoodCracklingSoundEffect = true;
        isOptionTimer = true;
        isOptionVoicePrompts = true;
        isOptionSliderFireplace = true;
        //
        wet = 45;
        CO2value = 45;
        temperature = 40;
        percentOil = 50;
        isButtonFor1000Fireplace = false;
        maxLevelSliderFireplace = 7;
        serialNumber = 'smartFireA7_1000';
        dcCode = 'smartFireA7_1000';
        dateOfManufacture = '11.01.2022';
        isSwitchClickSound = true;
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
    }
    if (wifiBSSID == listWithIdWifi.elementAt(2)) {
      //smartFireA5_1000
      try {
        print('detected fireplace from searchFireplaceInListWithIdWifi el 2');
        titleModel = 'smartFireA5_1000';
        //камин обнаружен и идет переход на главную страницу
        isFireplaceDetectedInDatabase = true;
        //опции для камина
        isOptionCO2level = false;
        isOptionFirewoodCracklingSoundEffect = true;
        isOptionTimer = true;
        isOptionVoicePrompts = false;
        isOptionSliderFireplace = true;
        //
        // CO2value = 45;
        wet = 15;
        temperature = 120;
        percentOil = 10;
        isButtonFor1000Fireplace = false;
        maxLevelSliderFireplace = 5;
        serialNumber = 'smartFireA5_1000';
        dcCode = 'smartFireA5_1000';
        dateOfManufacture = '12.05.2022';
        isSwitchClickSound = true;
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
    }
    if (wifiBSSID == listWithIdWifi.elementAt(3)) {
      //smartFireA3_1000
      try {
        print('detected fireplace from searchFireplaceInListWithIdWifi el 3');
        titleModel = 'smartFireA3_1000';
        //камин обнаружен и идет переход на главную страницу
        isFireplaceDetectedInDatabase = true;
        //опции для камина
        isOptionCO2level = false;
        isOptionFirewoodCracklingSoundEffect = false;
        isOptionTimer = false;
        isOptionVoicePrompts = false;
        isOptionSliderFireplace = true;
        //
        // CO2value = 45;
        wet = 75;
        temperature = 50;
        percentOil = 100;
        isButtonFor1000Fireplace = false;
        maxLevelSliderFireplace = 3;
        serialNumber = 'smartFireA3_1000';
        dcCode = 'smartFireA3_1000';
        dateOfManufacture = '10.08.2022';
        isSwitchClickSound = true;
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
    }
    // isLoadingDataIdWifi = false;
    // update();
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
