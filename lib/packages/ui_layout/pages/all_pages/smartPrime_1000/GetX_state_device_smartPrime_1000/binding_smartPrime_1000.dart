import 'package:fireplace_wifi_app/packages/ui_layout/pages/all_pages/smartPrime_1000/GetX_state_device_smartPrime_1000/controller_smartPrime_1000.dart';
import 'package:get/get.dart';

class BindingSmartPrime1000 implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyGetXControllerSmartPrime1000());
  }
}