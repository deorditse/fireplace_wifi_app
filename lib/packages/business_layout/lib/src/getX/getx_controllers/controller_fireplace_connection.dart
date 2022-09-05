import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';

//каждый раз при изменении запускать кодогенерацию
//для запуска кодогенерации flutter packages pub run build_runner build --delete-conflicting-outputs
//чтобы зарегистрировать как фабрику для GetIt и обращаться к сервис локатору через  MainSimpleStateManagement

class FireplaceConnectionGetXController extends GetxController {
  static FireplaceConnectionGetXController instance = Get.find();

  @override
  void onInit() {
    super.onInit();
    //сразу проверю данные сети, в которой нахожусь
    _initNetworkInfo().then((_) {
      ///сделать поиск по id камина вызовом searchFireplaceInlistWithIdWifi
      //  searchFireplaceInlistWithIdWifi(wifiName: wifiName, wifiBSSID: wifiBSSID);
    });
  }

  bool isLoadingDataIdWifi = true;
  bool isFireplaceDetectedInDatabase = false;
  String? namePage;

  String wifiName = '';
  String wifiBSSID = '';

  //тут будут лежать id каминов
  Set<String> listWithIdWifi = {'1', '2', '3', '4'};

  //для локальной сети
  Map<String, String> mapLocalNetworkNameAndIdWifi = {};

  Rx<bool> isSettingButton = false.obs;
  Rx<bool> isBlocButton = false.obs;
  int? passwordBlock = 5539;
  TextEditingController textFieldPassword = TextEditingController();

  searchFireplaceInlistWithIdWifi({String? wifiName, String? wifiBSSID}) {
    isLoadingDataIdWifi = true;
    namePage = null;
    isFireplaceDetectedInDatabase = false;
    update();
    if (wifiBSSID == listWithIdWifi.elementAt(0)) {
      //smartPrime_1000
      print('smartPrime_1000');
      isLoadingDataIdWifi = false;
      isFireplaceDetectedInDatabase = true;
      namePage = '/smartPrime1000Page';
      update();
      return;
    }
    if (wifiBSSID == listWithIdWifi.elementAt(1)) {
      //smartFireA7_1000
      print('smartFireA7_1000');
      isLoadingDataIdWifi = false;
      isFireplaceDetectedInDatabase = true;
      namePage = '/smartFireA71000Page';
      update();
      return;
    }
    if (wifiBSSID == listWithIdWifi.elementAt(2)) {
      //smartFireA5_1000
      print('smartFireA5_1000');
      isLoadingDataIdWifi = false;
      isFireplaceDetectedInDatabase = true;
      namePage = '/smartFireA51000Page';
      update();
      return;
    }
    if (wifiBSSID == listWithIdWifi.elementAt(3)) {
      //smartFireA3_1000
      print('smartFireA3_1000');
      isLoadingDataIdWifi = false;
      isFireplaceDetectedInDatabase = true;
      namePage = '/smartFireA31000Page';
      update();
      return;
    }
    isLoadingDataIdWifi = false;
    update();
  }

  //получение данных о сети wifi
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
}
