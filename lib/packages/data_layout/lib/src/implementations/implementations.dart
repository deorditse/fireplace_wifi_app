import 'package:get/get.dart';
import 'package:model/model.dart';

import '../../data_layout.dart';
import '../api/storage_test.dart';

//каждый раз при изменении запускать кодогенерацию
//для запуска кодогенерации flutter packages pub run build_runner build --delete-conflicting-outputs
//чтобы зарегистрировать как фабрику для GetIt и обращаться к сервис локатору через  MainSimpleStateManagement
//при использовании пакета freezed будет реализовано
//регистрируем как LazySingleton (одиночный) но вытаскиваем по запросу ShoppingData
class ImplementationFireplaceServices {
  ///общие параметры__________________________________

  Future<double> getDataPercentOil({required String url}) async {
    try {
      return 99.0;
    } catch (error) {
      throw Exception('$error from getDataPercentOil Data Layout');
    }
  }

  Future<double> getDataTemperature({required String url}) async {
    try {
      return 10.0;
    } catch (error) {
      throw Exception('$error from getDataTemperature Data Layout');
    }
  }

  Future<double> getDataCO2value({required String url}) async {
    try {
      return 10.0;
    } catch (error) {
      throw Exception('$error from getDataCO2value Data Layout');
    }
  }

  Future<double> getDataWet({required String url}) async {
    try {
      return 10.0;
    } catch (error) {
      throw Exception('$error from getDataWet Data Layout');
    }
  }

  ///для экрана настройки___________________________________________________

  Future<String> getDataSerialNumber({required String url}) async {
    try {
      return 'test';
    } catch (error) {
      throw Exception('$error from getDataSerialNumber Data Layout');
    }
  }

  Future<String> getDataDcCode({required String url}) async {
    try {
      return '1324r5432';
    } catch (error) {
      throw Exception('$error from getDataDcCode Data Layout');
    }
  }

  Future<String> getDataDateOfManufacture({required String url}) async {
    try {
      return '21.01.1997';
    } catch (error) {
      throw Exception('$error from getDataDateOfManufacture Data Layout');
    }
  }

  Future<bool> getDataIsSwitchClickSound({required String url}) async {
    try {
      return true;
    } catch (error) {
      throw Exception('$error from getDataIsSwitchClickSound Data Layout');
    }
  }

  Future<bool> getDataIsSwitchCracklingSoundEffect(
      {required String url}) async {
    try {
      return true;
    } catch (error) {
      throw Exception(
          '$error from getDataIsSwitchCracklingSoundEffect Data Layout');
    }
  }

  Future<double> getDataSliderValueCracklingSoundEffect(
      {required String url}) async {
    try {
      return 3.0;
    } catch (error) {
      throw Exception(
          '$error from getDataSliderValueCracklingSoundEffect Data Layout');
    }
  }

  //Голосовые подсказки
  Future<bool> getDataSwitchVoicePrompts({required String url}) async {
    try {
      return true;
    } catch (error) {
      throw Exception('$error from getDataSwitchVoicePrompts Data Layout');
    }
  }

  Future<double> getDataSliderValueVoicePrompts({required String url}) async {
    try {
      return 3.0;
    } catch (error) {
      throw Exception('$error from getDataSliderValueVoicePrompts Data Layout');
    }
  }

  ///для экрана блокировки___________________________________________________

  Future<String> getDataPasswordBlock({required String url}) async {
    try {
      return '5539';
    } catch (error) {
      throw Exception('$error from getDataPasswordBlock Data Layout');
    }
  }

  ///для запуска и управления камином___________________________________________________
  Future<bool> getDataIsPlayFireplace({required String url}) async {
    try {
      return false;
    } catch (error) {
      throw Exception('$error from getDataIsPlayFireplace Data Layout');
    }
  }

  Future<bool> getDataIsCoolingFireplace({required String url}) async {
    try {
      return false;
    } catch (error) {
      throw Exception('$error from getDataIsCoolingFireplace Data Layout');
    }
  }

  Future<bool> getDataIsFuelSystemError({required String url}) async {
    try {
      return false;
    } catch (error) {
      throw Exception('$error from getDataIsFuelSystemError Data Layout');
    }
  }

  //для слайдера / максимальное значение
  Future<double> getDataSliderValueMainScreen({required String url}) async {
    try {
      return 2.0;
    } catch (error) {
      throw Exception('$error from getDataSliderValueMainScreen Data Layout');
    }
  }

  ///для таймера___________________________________________________
  Future<String> getDataTimeWorkFireplace({required String url}) async {
    try {
      return '00 : 00 : 00';
    } catch (error) {
      throw Exception('$error from getDataTimeWorkFireplace Data Layout');
    }
  }

  Future<String> getDataCountdownTimer({required String url}) async {
    try {
      return '00 : 10 : 00';
    } catch (error) {
      throw Exception('$error from getDataCountdownTimer Data Layout');
    }
  }

  ///для поиска и подключение к камину с установкой параметров___________________________________________________

  Future<Map<String, String>>
      getDataMapWithWifiNameHomeNetworkAndNameFromListWifiName() async {
    try {
      ///ToDo: create инициализация данных из локальной памяти
      return {'wifiName': '1'};
    } catch (error) {
      throw Exception(
          '$error from initialDataMapWithWifiNameHomeNetworkAndNameFromListWifiName Data Layout');
    }
  }

  Future<void>
      saveInLocalStorageInMapWithWifiNameHomeNetworkAndNameFromListWifiName(
          {required Map<String, String> newMapHomeWifi}) async {
    try {
      ///ToDo: create сохранение данных из локальной памяти
    } catch (error) {
      throw Exception(
          '$error from saveInLocalStorageInMapWithWifiNameHomeNetworkAndNameFromListWifiName Data Layout');
    }
  }

  Future<void>
      deleteFromLocalStorageFromMapWithWifiNameHomeNetworkAndNameFromListWifiName(
          {required Map<String, String> newMapHomeWifi}) async {
    try {
      ///ToDo: create удаление данных из локальной памяти
    } catch (error) {
      throw Exception(
          '$error from deleteFromLocalStorageFromMapWithWifiNameHomeNetworkAndNameFromListWifiName Data Layout');
    }
  }
}
