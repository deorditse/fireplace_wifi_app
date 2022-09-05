import 'package:fireplace_wifi_app/packages/ui_layout/pages/all_pages/smartFireA7_1000/GetX_state_device_smartFireA7_1000/controller_smartFireA7_1000.dart';
import 'package:get/get.dart';

class BindingSmartFireA71000 implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyGetXControllerSmartFireA71000());
  }
}
