import 'package:business_layout/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/fireplace_pages/fireplace_page.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/widgets_for_all_pages/rowWithDomain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'widgets/fireplace_added_to_the_network.dart';
import 'widgets/text_fields_added_to_the_network_widgets.dart';

class ConnectHomeWiFiPage extends StatefulWidget {
  static const String id = '/connectHomeWiFiPage';

  ConnectHomeWiFiPage({Key? key}) : super(key: key);

  @override
  State<ConnectHomeWiFiPage> createState() => _ConnectHomeWiFiPageState();
}

class _ConnectHomeWiFiPageState extends State<ConnectHomeWiFiPage> {
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    Expanded(
                      child: SvgPicture.asset(
                        'assets/icons/header_logo.svg',
                        semanticsLabel: 'header_logo',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Text(
                  'Подключение к локальной сети:',
                  style: myTextStyleFontRoboto(),
                ),
                SizedBox(height: 30),
                TextFieldsAddedToTheNetworkWidgets(),
                SizedBox(height: 40),
                _buttonWithBack(),
                Expanded(child: SizedBox()),
                rowWithDomain(context: context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buttonWithBack() {
    return TextButton(
      onPressed: () {
        Get.back();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          'assets/icons/back.svg',
          semanticsLabel: 'back',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
