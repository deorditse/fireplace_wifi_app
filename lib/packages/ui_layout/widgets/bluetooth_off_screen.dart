import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/theme_app/custom_theme/material_theme/dark_custom_theme_material.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/widgets/rowWithDomain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BluetoothOffScreen extends StatelessWidget {
  BluetoothOffScreen({Key? key, this.state, required BuildContext myContext})
      : super(key: key);

  final BluetoothState? state;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeDark,
      home: Scaffold(
        body: Container(
          decoration: myDecorationBackground,
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.bluetooth_disabled,
                            size: 200,
                            color: Colors.white54,
                          ),
                          FittedBox(
                            child: Text(
                              'Bluetooth ${state != null ? state.toString().substring(15) : 'не включен'}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontFamily: 'Roboto',
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  FittedBox(
                    child: rowWithDomain(context: context),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
