import 'dart:io';
import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/fireplace_pages/fireplace_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:business_layout/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/theme_app/custom_theme/material_theme/dark_custom_theme_material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'packages/ui_layout/all_pages/connect_homeWiFi_page/connect_homeWiFi_page.dart';
import 'packages/ui_layout/all_pages/fireplace_pages/pages/block_page/block_page.dart';
import 'packages/ui_layout/all_pages/fireplace_pages/pages/setting_page/setting_page.dart';
import 'packages/ui_layout/all_pages/search_fireplace_page/search_fireplace_page.dart';
import 'packages/ui_layout/all_pages/wifi_off_screen_page/wifi_off_screen_page.dart';

Future<void> main() async {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
      stream: Connectivity().onConnectivityChanged,
      initialData: ConnectivityResult.wifi,
      builder: (c, AsyncSnapshot<ConnectivityResult> snapshot) {
        final state = snapshot.data;
        return state == ConnectivityResult.wifi
            ? MyGetApp()
            : WifiOffScreenPage(
                state: state,
              );
      },
    );
  }
}

class MyGetApp extends StatefulWidget {
  MyGetApp({super.key});

  @override
  State<MyGetApp> createState() => _MyGetAppState();
}

class _MyGetAppState extends State<MyGetApp> {
  @override
  void initState() {
    super.initState();
    _initPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BasicsExampleBinding(),
      //инициируем страницу для проверки подключения блютуза и на все настройки
      theme: themeDark,
      initialRoute: SearchFireplacePage.id,
      getPages: [
        ///menu pages with controllers
        GetPage(
          name: SearchFireplacePage.id,
          page: () => SearchFireplacePage(),
          binding: BasicsExampleBinding(),
        ),
        GetPage(
          name: FireplacePage.id,
          page: () => FireplacePage(),
          binding: BasicsExampleBinding(),
        ),
        GetPage(
          name: ConnectHomeWiFiPage.id,
          page: () => ConnectHomeWiFiPage(),
          binding: BasicsExampleBinding(),
        ),

        GetPage(
          name: BodyBlockFireplace.id,
          page: () => BodyBlockFireplace(),
          binding: BasicsExampleBinding(),
        ),
        GetPage(
          name: BodySettingPage.id,
          page: () => BodySettingPage(),
          binding: BasicsExampleBinding(),
        ),
        GetPage(
          name: WifiOffScreenPage.id,
          page: () => WifiOffScreenPage(),
          binding: BasicsExampleBinding(),
        ),
      ],
    );
  }

  Future<void> _initPermissions() async {
    if (await Permission.location.serviceStatus.isEnabled) {
      //проверяю какой статус у разрешение на геопозицию
      var status = await Permission.location.request();

      if (status.isGranted) {
        print('Location is Granted');
      } else if (status.isDenied) {
        print('Location is Denied');
        Get.snackbar(
          'Необходим доступ к локации',
          'Для корректного определения WiFi сети',
        );

        Map<Permission, PermissionStatus> statuses = await [
          Permission.location,
          // Permission.storage,
        ].request();
        print(statuses[Permission.location]);
      }
    } else if (await Permission.location.isPermanentlyDenied) {
      //если навсегда отключена геопозиция
      openAppSettings();
    } else {
      print('location.serviceStatus.isDisable');
    }
  }
}
