import 'dart:io';
import 'dart:math';

import 'package:business_layout/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

Widget iconValueDescription(
    {required String iconPath, required value, required String description}) {
  return Flexible(
    child: Container(
      // color: Color.fromARGB(255, 255, Random().nextInt(255), 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  iconPath,
                  semanticsLabel: 'icon_bottom',
                  fit: BoxFit.scaleDown,
                ),
                SizedBox(width: 6),
                Flexible(
                  flex: 10,
                  child: Text(
                    '$value',
                    style: myTextStyleFontSarpanch(fontSize: 27)
                        .copyWith(height: Platform.isIOS ? 1 : 0.9),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  iconPath,
                  semanticsLabel: 'icon_bottom',
                  fit: BoxFit.scaleDown,
                  color: Colors.transparent,
                ),
                SizedBox(width: 6),
                Flexible(
                  flex: 10,
                  child: Text(
                    description,
                    style: myTextStyleFontSarpanch(
                      fontSize: 15,
                      textColor: myTreeColor,
                    ).copyWith(height: 0.9),
                    overflow: TextOverflow.visible,
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
