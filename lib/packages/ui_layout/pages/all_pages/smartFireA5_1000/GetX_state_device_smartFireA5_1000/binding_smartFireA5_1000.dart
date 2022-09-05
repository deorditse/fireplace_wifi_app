import 'package:fireplace_wifi_app/packages/ui_layout/pages/all_pages/smartFireA5_1000/GetX_state_device_smartFireA5_1000/controller_smartFireA5_1000.dart';
import 'package:get/get.dart';

class BindingSmartFireA51000 implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyGetXControllerSmartFireA51000());
  }
}
