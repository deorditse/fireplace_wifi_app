import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/rowWithDomain.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/theme_app/custom_theme/material_theme/dark_custom_theme_material.dart';
import 'package:flutter/material.dart';

class WifiOffScreen extends StatelessWidget {
  WifiOffScreen({Key? key, this.state})
      : super(key: key);

  final ConnectivityResult? state;

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
                            Icons.wifi_off,
                            size: 200,
                            color: Colors.white54,
                          ),
                          FittedBox(
                            child: Text(
                              'включите Wi-Fi',
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
