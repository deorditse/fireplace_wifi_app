import 'package:get/get.dart';

//каждый раз при изменении запускать кодогенерацию
//для запуска кодогенерации flutter packages pub run build_runner build --delete-conflicting-outputs
//чтобы зарегистрировать как фабрику для GetIt и обращаться к сервис локатору через  MainSimpleStateManagement

enum Devices {
  smartFireA7_1000,
  smartFireA5_1000,
  smartFireA3_1000,
  smartPrime_1000,
}

class MySettingGetXController extends GetxController {
  Rx<int> currentTabIndex = 0.obs;
  bool switchChangeTheme = Get.isDarkMode;


  void changeBleDevices({required Devices device}) {
    switch (device) {
      case Devices.smartFireA7_1000:
        break;
        return;
      case Devices.smartFireA5_1000:
        break;
      // return ;
      case Devices.smartFireA3_1000:
        break;
      // return ;
      case Devices.smartPrime_1000:
        break;
      default:
        break;
      // return 'SelectedScheme Title is null';
    }
  }

  void changeTheme({required bool bolSwitch}) {
    switchChangeTheme = bolSwitch;
    update();
  }
}
