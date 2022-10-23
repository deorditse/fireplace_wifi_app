import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
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
      final percentOil = controllerApp.percentOil;

      return Text(
        percentOil != null ? '${percentOil.toInt()}%' : '...%',
        style: myTextStyleFontSarpanch(fontSize: 30),
        textAlign: TextAlign.center,
      );
    });

Widget bottomRowWithParameters(BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.width / 2,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(child: imageOil()),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: percentOil(),
                )
              ],
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: GetBuilder<FireplaceConnectionGetXController>(
            builder: (controllerApp) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  iconValueDescription(
                    iconPath: 'assets/icons/temperature.svg',
                    value: controllerApp.temperature != null
                        ? '${controllerApp.temperature!.toInt()}°C'
                        : '...°C',
                    description: 'температура',
                  ),
                  iconValueDescription(
                    iconPath: 'assets/icons/wet.svg',
                    value: controllerApp.wet != null
                        ? '${controllerApp.wet!.toInt()}%'
                        : '...%',
                    description: 'влажность',
                  ),
                  if (controllerApp.isOptionCO2level)
                    iconValueDescription(
                      iconPath: 'assets/icons/level_CO2.svg',
                      value: controllerApp.CO2value != null
                          ? '${controllerApp.CO2value!.toInt()}%'
                          : '...%',
                      description: 'уровень CO2',
                    )
                  else
                    Flexible(
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
