import 'package:business_layout/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget timerFormat({double? padding, double? myFontSize}) {
  return GetBuilder<FireplaceConnectionGetXController>(
      builder: (controllerApp) {
        final constFontSize = myFontSize ?? 45;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding ?? 0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              controllerApp.timerDateInHHMMSS[0],
              textAlign: TextAlign.center,
              style: myTextStyleFontSarpanch(
                fontSize: constFontSize,
                textColor: myTwoColor,
              ),
            ),
          ),
          Text(
            ':',
            textAlign: TextAlign.center,
            style: myTextStyleFontSarpanch(
              fontSize: constFontSize,
              textColor: myTwoColor,
            ),
          ),
          Expanded(
            child: Text(
              controllerApp.timerDateInHHMMSS[1],
              textAlign: TextAlign.center,
              style: myTextStyleFontSarpanch(
                fontSize: constFontSize,
                textColor: myTwoColor,
              ),
            ),
          ),
          Text(
            ':',
            textAlign: TextAlign.center,
            style: myTextStyleFontSarpanch(
              fontSize: constFontSize,
              textColor: myTwoColor,
            ),
          ),
          Expanded(
            child: Text(
              controllerApp.timerDateInHHMMSS[2],
              textAlign: TextAlign.center,
              style: myTextStyleFontSarpanch(
                fontSize: constFontSize,
                textColor: myTwoColor,
              ),
            ),
          ),
        ],
      ),
    );
  });
}
