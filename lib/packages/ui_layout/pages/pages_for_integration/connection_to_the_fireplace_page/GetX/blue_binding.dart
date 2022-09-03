import 'package:fire_ble_app/packages/ui_layout/pages/pages_for_integration/connection_to_the_fireplace_page/GetX/blue_controller.dart';
import 'package:get/get.dart';

class BleBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BleGetXController());
  }
}
