import 'package:fire_ble_app/packages/business_layout/lib/business_layout.dart';
import 'package:fire_ble_app/packages/ui_layout/pages/pages_for_integration/connection_to_the_fireplace_page/GetX/blue_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

Row mySwitchRow({required context}) {
  BleGetXController _controllerBlue = Get.find();

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Image.asset(
        'assets/icons/free-icon-bluetooth-signal-indicator-60939 1 (Traced).png',
        fit: BoxFit.cover,
      ),
      StreamBuilder<bool>(
        stream: FlutterBlue.instance.isScanning,
        initialData: false,
        builder: (c, snapshot) {
          return Obx(
            () {
              return Switch(
                value: _controllerBlue.isSwitch.value,
                onChanged: (value) {
                  _controllerBlue.isSwitch.value =
                      !_controllerBlue.isSwitch.value;

                  value
                      ? FlutterBlue.instance.startScan(
                          // timeout: Duration(
                          //   seconds: 2,
                          // ),
                        )
                      : FlutterBlue.instance.stopScan();
                },
              );
            },
          );
        },
      ),
      Expanded(
        child: Text(
          'Сканирование\nдоступных устройств',
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    ],
  );
}
