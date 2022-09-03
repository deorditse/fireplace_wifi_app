import 'package:get/get.dart';

import '../../../business_layout.dart';

class BasicsExampleBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FireplaceConnectionGetXController());
    Get.lazyPut(() => MySettingGetXController());
    // Get.lazyPut(() => BleGetXController());
  }
}
