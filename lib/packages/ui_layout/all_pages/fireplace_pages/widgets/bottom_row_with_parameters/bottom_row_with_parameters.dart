import 'package:business_layout/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'my_navigation_bar.dart';

Widget imageOil() => SvgPicture.asset(
      'assets/icons/oil.svg',
      semanticsLabel: 'icon_bottom',
      fit: BoxFit.contain,
    );

Widget percentOil() =>
    GetBuilder<FireplaceConnectionGetXController>(builder: (controllerApp) {
      final percentOil = controllerApp.fireplaceData?.percentOil;

      return Text(
        percentOil != null ? '${percentOil.toInt()}%' : '...%',
        style: myTextStyleFontSarpanch(fontSize: 39).copyWith(height: 0.01),
      );
    });

Widget bottomRowWithParameters(BuildContext context) {
  return SizedBox(
    height: Get.height / 4.3,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(width: 100, child: FittedBox(child: imageOil())),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(child: Container()),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: percentOil(),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Flexible(
          child: GetBuilder<FireplaceConnectionGetXController>(
            builder: (controllerApp) {
              return Row(
                children: [
                  iconValueDescription(
                    iconPath: 'assets/icons/temperature.svg',
                    value: controllerApp.fireplaceData?.temperature != null
                        ? '${controllerApp.fireplaceData!.temperature!.toInt()}°C'
                        : '...°C',
                    description: 'температура',
                  ),
                  SizedBox(width: 10),
                  iconValueDescription(
                    iconPath: 'assets/icons/wet.svg',
                    value: controllerApp.fireplaceData?.wet != null
                        ? '${controllerApp.fireplaceData!.wet!.toInt()}%'
                        : '...%',
                    description: 'влажность',
                  ),
                  SizedBox(width: 10),
                  controllerApp.fireplaceData?.CO2value != null
                      ? iconValueDescription(
                        iconPath: 'assets/icons/level_CO2.svg',
                        value:
                            '${controllerApp.fireplaceData!.CO2value!.toInt()}%',
                        description: 'уровень CO2',
                      )
                      : Flexible(
                          child: Container(),
                        )
                ],
              );
            },
          ),
        ),
      ],
    ),
  );
}
