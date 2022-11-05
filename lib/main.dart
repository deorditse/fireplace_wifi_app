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
            ? TestPremiss() //MyGetApp()
            : WifiOffScreenPage(
                state: state,
              );
      },
    );
  }
}

class MyGetApp extends StatelessWidget {
  MyGetApp({super.key});

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
}

class TestPremiss extends StatelessWidget {
  const TestPremiss({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
          children: Permission.values
              .where((permission) {
                if (Platform.isIOS) {
                  return permission != Permission.unknown &&
                      permission != Permission.sms &&
                      permission != Permission.storage &&
                      permission != Permission.ignoreBatteryOptimizations &&
                      permission != Permission.accessMediaLocation &&
                      permission != Permission.activityRecognition &&
                      permission != Permission.manageExternalStorage &&
                      permission != Permission.systemAlertWindow &&
                      permission != Permission.requestInstallPackages &&
                      permission != Permission.accessNotificationPolicy &&
                      permission != Permission.bluetoothScan &&
                      permission != Permission.bluetoothAdvertise &&
                      permission != Permission.bluetoothConnect;
                } else {
                  return permission != Permission.unknown &&
                      permission != Permission.mediaLibrary &&
                      permission != Permission.photos &&
                      permission != Permission.photosAddOnly &&
                      permission != Permission.reminders &&
                      permission != Permission.appTrackingTransparency &&
                      permission != Permission.criticalAlerts;
                }
              })
              .map((permission) => PermissionWidget(permission))
              .toList()),
    );
  }
}

// Permission widget containing information about the passed [Permission]
class PermissionWidget extends StatefulWidget {
  const PermissionWidget(this._permission);

  final Permission _permission;

  @override
  _PermissionState createState() => _PermissionState(_permission);
}

class _PermissionState extends State<PermissionWidget> {
  _PermissionState(this._permission);

  final Permission _permission;
  PermissionStatus _permissionStatus = PermissionStatus.denied;

  @override
  void initState() {
    super.initState();

    _listenForPermissionStatus();
  }

  void _listenForPermissionStatus() async {
    final status = await _permission.status;
    setState(() => _permissionStatus = status);
  }

  Color getPermissionColor() {
    switch (_permissionStatus) {
      case PermissionStatus.denied:
        return Colors.red;
      case PermissionStatus.granted:
        return Colors.green;
      case PermissionStatus.limited:
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        _permission.toString(),
        style: Theme.of(context).textTheme.bodyText1,
      ),
      subtitle: Text(
        _permissionStatus.toString(),
        style: TextStyle(color: getPermissionColor()),
      ),
      trailing: (_permission is PermissionWithService)
          ? IconButton(
              icon: const Icon(
                Icons.info,
                color: Colors.white,
              ),
              onPressed: () {
                checkServiceStatus(
                    context, _permission as PermissionWithService);
              })
          : null,
      onTap: () {
        requestPermission(_permission);
      },
    );
  }

  void checkServiceStatus(
      BuildContext context, PermissionWithService permission) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text((await permission.serviceStatus).toString()),
    ));
  }

  Future<void> requestPermission(Permission permission) async {
    final status = await permission.request();

    setState(() {
      print(status);
      _permissionStatus = status;
      print(_permissionStatus);
    });
  }
}
