// Copyright 2017, Paul DeMarco.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/test_sensor_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

class ScanResultTile extends StatelessWidget {
  const ScanResultTile({Key? key, required this.result}) : super(key: key);

  final ScanResult result;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8),
              child: Column(
                children: [
                  Text(
                    result.device.name,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  FittedBox(
                    child: Text(
                      result.device.id.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: StreamBuilder<BluetoothDeviceState>(
              stream: result.device.state,
              initialData: BluetoothDeviceState.connecting,
              builder: (c, snapshot) {
                VoidCallback? onPressed;
                Text text;
                Icon? iconState;
                switch (snapshot.data) {
                  case BluetoothDeviceState.connected:
                    onPressed = () {
                      result.device.disconnect();
                      FlutterBlue.instance.startScan();
                    };
                    iconState = const Icon(
                      Icons.check,
                    );
                    text = Text(
                      'подключено',
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                            color: myColorActivity,
                          ),
                    );

                    break;
                  case BluetoothDeviceState.disconnected:
                    onPressed = () async {
                      await result.device.connect(
                        // timeout: Duration(seconds: 2),
                        autoConnect: false,
                      );

                      ///сделать проверку по имени и только после этого переводить на страницу управления

                      // if (result.device.name == TARGET_DEVICE_NAME) {
                      //   //перебрасывать на страницу с функционалом
                      // }
                      Get.to(
                        () => SensorPage(
                          device: result.device,
                        ),
                      );

                      FlutterBlue.instance.stopScan();
                    };

                    iconState = null;
                    text = Text(
                      'подключить',
                      style: Theme.of(context).textTheme.headline2!,
                    );

                    break;
                  case BluetoothDeviceState.connecting:
                    iconState = const Icon(
                      Icons.bluetooth_audio_outlined,
                    );

                    text = Text(
                      'подключение',
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                            color: myColorActivity,
                          ),
                    );

                    onPressed = null;
                    break;
                  default:
                    onPressed = null;
                    text = Text(
                        snapshot.data.toString().substring(21).toUpperCase());
                    break;
                }
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: iconState,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Align(
                        child: ElevatedButton(
                          onPressed: onPressed,
                          child: text,
                        ),
                        alignment: Alignment.centerRight,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
