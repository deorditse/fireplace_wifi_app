import 'package:fire_ble_app/packages/ui_layout/style_app/style.dart';
import 'package:fire_ble_app/packages/ui_layout/pages/pages_for_integration/connection_to_the_fireplace_page/widgets/switch.dart';
import 'package:fire_ble_app/packages/ui_layout/pages/pages_for_integration/find_device_screen_widget.dart';
import 'package:fire_ble_app/packages/ui_layout/pages/pages_for_integration/widgets/setting_end_drawer/end_drawer_app_bar.dart';
import 'package:fire_ble_app/packages/ui_layout/widgets/rowWithDomain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class ConnectionToTheFireplacePage extends StatefulWidget {
  static const String id = '/connectionToTheFireplacePage';

  ConnectionToTheFireplacePage({Key? key}) : super(key: key);

  @override
  State<ConnectionToTheFireplacePage> createState() =>
      _ConnectionToTheFireplacePageState();
}

class _ConnectionToTheFireplacePageState
    extends State<ConnectionToTheFireplacePage> {


  @override
  void dispose() {
    super.dispose();
    FlutterBlue.instance.stopScan();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: myDecorationBackground,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        endDrawer: MyEndDrawer(),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    Expanded(
                      child: Image.asset(
                        'assets/icons/header_logo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Подключение к камину:',
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  height: 40,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  // mainAxisSize: MainAxisSize.min,

                  children: [
                    Text(
                      '1. Установите камин согласно инструкции пользователя.',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '2. Подключение к камину',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '3. Включите сканирование доступных устройств.',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '4. Выберите ваше устройство.',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                mySwitchRow(context: context),
                SizedBox(
                  height: 40,
                ),
                FindDeviceScreenWidget(),
                Expanded(child: SizedBox()),
                rowWithDomain(context: context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
