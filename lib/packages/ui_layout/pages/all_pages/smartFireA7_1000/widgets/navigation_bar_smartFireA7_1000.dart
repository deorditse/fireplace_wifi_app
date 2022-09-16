import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/navigation_bar/my_navigation_bar.dart';
import 'package:flutter/cupertino.dart';

Widget navigationBarsmartFireA7_1000(BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.width / 2.9,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FittedBox(child: imageOil()),
                SizedBox(
                  width: 10,
                ),
                percentOil(),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 1,
          // height: MediaQuery.of(context).size.width / 9,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
              iconValueDescription(
                iconPath: 'assets/icons/level_CO2.png',
                value: '45%',
                description: 'уровень CO2',
              ),
            ],
          ),
        )
      ],
    ),
  );
}
