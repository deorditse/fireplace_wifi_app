import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/cupertino.dart';

Image imageOil() => Image.asset(
      'assets/icons/oil.png',
      fit: BoxFit.cover,
    );

Text percentOil() => Text(
      '100%',
      style: myTextStyleFontSarpanch(fontSize: 30),
      textAlign: TextAlign.center,
    );

Widget myNavigationBar(context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height / 9,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: imageOil(),
              ),
              SizedBox(
                width: 10,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: percentOil(),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              iconValueDescription(
                iconPath: 'assets/icons/temperature.png',
                value: '24°C',
                description: 'температура',
              ),
              SizedBox(
                height: 15,
              ),
              iconValueDescription(
                iconPath: 'assets/icons/wet.png',
                value: '45%',
                description: 'влажность',
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget iconValueDescription(
    {required String iconPath, required value, required String description}) {
  return Flexible(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        FittedBox(
          child: Padding(
            padding: const EdgeInsets.only(top: 18.0, right: 8.0, bottom: 18),
            child: Image.asset(
              iconPath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          // flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Text(
                  '$value',
                  style: myTextStyleFontSarpanch(fontSize: 24),
                ),
              ),
              FittedBox(
                child: Text(
                  '$description',
                  style: myTextStyleFontSarpanch(
                    fontSize: 14,
                    textColor: myTreeColor,
                  ),
                ),
              ),
            ],
          ),
        ),

        // SizedBox(height: 10,),
      ],
    ),
  );
}
