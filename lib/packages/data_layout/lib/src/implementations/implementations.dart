import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:models/models.dart';
import '../test_data.dart';

//каждый раз при изменении запускать кодогенерацию
//для запуска кодогенерации flutter packages pub run build_runner build --delete-conflicting-outputs
//чтобы зарегистрировать как фабрику для GetIt и обращаться к сервис локатору через  MainSimpleStateManagement
//при использовании пакета freezed будет реализовано
//регистрируем как LazySingleton (одиночный) но вытаскиваем по запросу ShoppingData

enum ListNamesFireplace {
  smartPrime1000,
  smartFireA71000,
  smartFireA51000,
  smartFireA31000,
}

class ImplementationFireplaceServices {
  Future<FireplaceDataModel> getFireplaceData(
      {required /*String*/ int url}) async {
    await Future.delayed(Duration(seconds: 2));

    ///todo get api http request for server
    return listFireplaceDataModel[url];
  }

  ///для поиска и подключение к камину с установкой параметров___________________________________________________

  ///получение данных домашней сети
  Future<Box<HomeNetworkModel>?> getInstanceHiveHomeLocalNetworksData(
      {required String keyWifiName}) async {
    return await Hive.openBox<HomeNetworkModel>(keyWifiName);
  }

  Future<void>
      saveInLocalStorageInMapWithWifiNameHomeNetworkAndNameFromListWifiName(
          {required HomeNetworkModel newHomeLocalNetworksData}) async {
    try {
      await Future.delayed(const Duration(seconds: 2));

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
      await Future.delayed(Duration(seconds: 2));

      ///ToDo: create удаление данных из локальной памяти
    } catch (error) {
      throw Exception(
          '$error from deleteFromLocalStorageFromMapWithWifiNameHomeNetworkAndNameFromListWifiName Data Layout');
    }
  }
}
