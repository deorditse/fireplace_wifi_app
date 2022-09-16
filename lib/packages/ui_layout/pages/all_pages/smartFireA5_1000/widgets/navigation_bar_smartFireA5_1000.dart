import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/navigation_bar/my_navigation_bar.dart';
import 'package:flutter/cupertino.dart';

Widget navigationBarSmartFireA5_1000(BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.width / 3.5,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          // alignment: Alignment.topLeft,
          child: imageOil(),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width / 10,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FittedBox(
                child: percentOil(),
              ),
              SizedBox(
                width: 20,
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
  );
}
