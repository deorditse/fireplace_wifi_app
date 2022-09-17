import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/navigation_bar/my_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget navigationBarSmartFireA5_1000(BuildContext context) {
  return Container(
    color: Colors.teal,
    child: SizedBox(
      height: MediaQuery.of(context).size.width / 2.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: imageOil(),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 9,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: FittedBox(
                    child: percentOil(),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                iconValueDescription(
                  iconPath: 'assets/icons/temperature.png',
                  value: '24°C',
                  description: 'температура',
                ),
                iconValueDescription(
                  iconPath: 'assets/icons/wet.png',
                  value: '45%',
                  description: 'влажность',
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
