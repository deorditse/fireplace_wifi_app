import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

Widget appBarFireplace({context}) {
  FireplaceConnectionGetXController _controllerFireplace =
      FireplaceConnectionGetXController.instance;
  return Container(
    height: MediaQuery.of(context).size.height / 10,
    child: Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: GetBuilder<FireplaceConnectionGetXController>(
            builder: (controllerApp) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0, right: 8),
              child: TextButton(
                onPressed: () {
                  controllerApp.changeIsBlocButton(newIsBlocButton: true);
                  controllerApp.changeIsSettingButton(
                      newIsSettingButton: false);
                },
                child: SvgPicture.asset(
                  controllerApp.isBlocButton
                      ? 'assets/icons/blocs_2.svg'
                      : 'assets/icons/blocs.svg',
                  semanticsLabel: 'premium-icon-internet',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: SvgPicture.asset(
            'assets/icons/header_logo.svg',
            semanticsLabel: 'header_logo',
            fit: BoxFit.contain,
          ),
        ),
        Expanded(
          flex: 1,
          child: GetBuilder<FireplaceConnectionGetXController>(
            builder: (controllerApp) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: 8),
              child: TextButton(
                onPressed: () {
                  if (!controllerApp.isBlocButton) {
                    controllerApp.changeIsSettingButton();
                  }
                },
                child: SvgPicture.asset(
                  'assets/icons/setting.svg',
                  semanticsLabel: 'setting',
                  color: controllerApp.isSettingButton ? myColorActivity : null,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
