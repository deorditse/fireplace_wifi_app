import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

Widget iconValueDescription(
    {required String iconPath, required value, required String description}) {
  return Flexible(
    child: Column(
      children: [
        Expanded(
          flex: 1,
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  iconPath,
                  semanticsLabel: 'icon_bottom',
                  fit: BoxFit.scaleDown,
                ),
                SizedBox(width: 6),
                Expanded(
                  flex: 10,
                  child: Text(
                    '$value',
                    style: myTextStyleFontSarpanch(fontSize: 27)
                        .copyWith(height: 1),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              SvgPicture.asset(
                iconPath,
                semanticsLabel: 'icon_bottom',
                fit: BoxFit.scaleDown,
                color: Colors.transparent,
              ),
              SizedBox(width: 6),
              Expanded(
                flex: 10,
                child: Text(
                  '$description',
                  style: myTextStyleFontSarpanch(
                    fontSize: 15,
                    textColor: myTreeColor,
                  ).copyWith(height: 0.9),
                  overflow: TextOverflow.clip,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
