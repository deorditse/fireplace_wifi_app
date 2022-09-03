import 'package:fire_ble_app/packages/business_layout/lib/business_layout.dart';
import 'package:fire_ble_app/packages/ui_layout/style_app/style.dart';
import 'package:fire_ble_app/packages/ui_layout/widgets/app_bar/body_block_fireplace/block_fireplace.dart';
import 'package:fire_ble_app/packages/ui_layout/widgets/app_bar/body_setting_fireplace/body_setting_page.dart';
import 'package:fire_ble_app/packages/ui_layout/widgets/app_bar/myAppBar.dart';
import 'package:fire_ble_app/packages/ui_layout/widgets/navigation_bar/my_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

class SmartPrime1000Page extends StatefulWidget {
  static const String id = '/smartPrime1000Page';

  SmartPrime1000Page({Key? key, this.device}) : super(key: key);
  BluetoothDevice? device;

  @override
  State<SmartPrime1000Page> createState() => _SmartPrime1000PageState();
}

class _SmartPrime1000PageState extends State<SmartPrime1000Page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: myDecorationBackground,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                mySettingAppBar(context: context),
                BodyContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

myTitleModel() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Text(
      'Модель: Smart Prime 1000',
      style: myTextStyleFontRoboto(fontSize: 14),
    ),
  );
}

class BodyContent extends StatelessWidget {
  const BodyContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Obx(() {
            if (FireplaceConnectionGetXController.instance.isBlocButton.value) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  myTitleModel(),
                  Expanded(
                    child: Center(
                      child: BlockFireplace(),
                    ),
                  ),
                  myNavigationBar(context),
                ],
              );
            } else {
              if (FireplaceConnectionGetXController
                  .instance.isSettingButton.value) {
                return BodySettingPage();
              } else {
                return Column(
                  children: [
                    myTitleModel(),
                    Expanded(
                      child: Center(
                        child: Text('основной контент'),
                      ),
                    ),
                    myNavigationBar(context),
                  ],
                );
              }
            }
          }),
        ),
      ),
    );
  }
}
