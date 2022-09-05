import 'package:get/get.dart';

//каждый раз при изменении запускать кодогенерацию
//для запуска кодогенерации flutter packages pub run build_runner build --delete-conflicting-outputs
//чтобы зарегистрировать как фабрику для GetIt и обращаться к сервис локатору через  MainSimpleStateManagement

class MySettingGetXController extends GetxController {
  Rx<int> currentTabIndex = 0.obs;
  bool switchChangeTheme = Get.isDarkMode;

  void changeTheme({required bool bolSwitch}) {
    switchChangeTheme = bolSwitch;
    update();
  }
}
