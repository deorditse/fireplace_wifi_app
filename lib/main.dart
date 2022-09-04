import 'package:fireplace_wifi_app/packages/ui_layout/pages/all_pages/smartFireA3_1000/main_smartFireA3_1000.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/all_pages/smartFireA5_1000/main_smartFireA5_1000.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/all_pages/smartPrime_1000/smartPrime_1000.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/main_connection_to_the_fireplace_page.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/widgets/bluetooth_off_screen.dart';
import 'package:fireplace_wifi_app/test_page/scan.dart';
import 'package:fireplace_wifi_app/test_page/wifi_iot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/theme_app/custom_theme/material_theme/dark_custom_theme_material.dart';
import 'packages/ui_layout/pages/all_pages/smartFireA7_1000/main_smartFireA7_1000.dart';
import 'packages/ui_layout/pages/all_pages/smartPrime_1000/main_smartPrime_1000.dart';
import 'packages/ui_layout/pages/pages_for_integration/connection_to_the_fireplace_page/GetX/blue_binding.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

Future<void> main() async {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
      stream: Connectivity().onConnectivityChanged,
      builder: (c,AsyncSnapshot<ConnectivityResult>  snapshot) {
        final state = snapshot.data;
        return state == ConnectivityResult.wifi
            ? /*MyGetApp()*/ FlutterWifiIoT()
            : BluetoothOffScreen(
                state: state,
                myContext: context,
              );
      },
    );
  }
}

// class MyGetApp extends StatelessWidget {
//   MyGetApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       initialBinding: BasicsExampleBinding(),
//       //инициируем страницу для проверки подключения блютуза и на все настройки
//       theme: themeDark,
//       initialRoute: SmartPrime1000Page.id,
//       // initialRoute: ConnectionToTheFireplacePage.id,
//       getPages: [
//         GetPage(
//           name: ConnectionToTheFireplacePage.id,
//           page: () => ConnectionToTheFireplacePage(),
//           bindings: [
//             BasicsExampleBinding(),
//             BleBinding(),
//           ],
//         ),
//         GetPage(
//           name: SmartPrime1000.id,
//           page: () => SmartPrime1000(),
//           bindings: [
//             BasicsExampleBinding(),
//             BleBinding(),
//           ],
//         ),
//
//         GetPage(
//           name: SmartPrime1000Page.id,
//           page: () => SmartPrime1000Page(),
//           bindings: [
//             BleBinding(),
//           ],
//         ),
//         GetPage(
//           name: SmartFireA71000Page.id,
//           page: () => SmartFireA71000Page(),
//           bindings: [
//             BasicsExampleBinding(),
//             BleBinding(),
//           ],
//         ),
//         GetPage(
//           name: SmartFireA51000Page.id,
//           page: () => SmartFireA51000Page(),
//           bindings: [
//             BasicsExampleBinding(),
//             BleBinding(),
//           ],
//         ),
//         GetPage(
//           name: SmartFireA31000Page.id,
//           page: () => SmartFireA31000Page(),
//           bindings: [
//             BasicsExampleBinding(),
//             BleBinding(),
//           ],
//         ),
//         // GetPage(
//         //   name: FlutterBlueApp.id,
//         //   page: () => FlutterBlueApp(),
//         //   // binding: BasicsExampleBinding(),
//         // ),
//       ],
//     );
//   }
// }
