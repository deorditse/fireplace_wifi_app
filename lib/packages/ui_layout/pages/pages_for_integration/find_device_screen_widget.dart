import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/connection_to_the_fireplace_page/GetX/blue_controller.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/connection_to_the_fireplace_page/widgets/scanBleSwitchFalse.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/scan_result_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

import '../../style_app/style.dart';

class FindDeviceScreenWidget extends StatelessWidget {
  static const String id = '/listDevices';

  BleGetXController _controllerBlue = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _controllerBlue.isSwitch.value
          ? /*FindDevicesScreenTest()*/ FindDevicesScreen()
          : scanBleSwitchFalse(context: context),
    );
  }
}

class FindDevicesScreen extends StatefulWidget {
  @override
  State<FindDevicesScreen> createState() => _FindDevicesScreenState();
}

class _FindDevicesScreenState extends State<FindDevicesScreen> {
  bool barrier = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 2,
      width: MediaQuery.of(context).size.width,
      child: MyContainerAlert(
        child: RefreshIndicator(
          onRefresh: () => FlutterBlue.instance.startScan(
            timeout: Duration(seconds: 2),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                StreamBuilder<List<ScanResult>>(
                  stream: FlutterBlue.instance.scanResults,
                  initialData: [],
                  builder: (context, snapshot) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...snapshot.data!.map((r) {
                          // return ScanResultTile(
                          //     result: r); //это удалить и добавить ниже
                          ///
                          if (r.device.name.length > 0) {
                            barrier = false;
                            return ScanResultTile(result: r);
                          } else {
                            return Container();
                          }
                        }).toList(),

                        ///добавиь
                        if (barrier)
                          Padding(
                            padding: const EdgeInsets.only(top: 28.0),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: myColorActivity,
                                strokeWidth: 2,
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
