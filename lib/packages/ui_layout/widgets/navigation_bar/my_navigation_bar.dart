import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/cupertino.dart';

Widget myNavigationBar(context) {
  return Container(
    height: MediaQuery.of(context).size.height / 9,
    child: Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: Image.asset(
                  'assets/icons/oil.png',
                  fit: BoxFit.contain,
                  // width: 50,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  '100%',
                  style: myTextStyleFontSarpanch(fontSize: 36),
                ),
              ),
            ],
          ),
        ),
        Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _temperature(),
                SizedBox(
                  height: 15,
                ),
                _wet(),
              ],
            )),
      ],
    ),
  );
}

_temperature() {
  return Flexible(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      // mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 20,
                child: FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/icons/temperature.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(
                  '24°C',
                  style: myTextStyleFontSarpanch(fontSize: 24),
                ),
              ),
            ],
          ),
        ),
        // SizedBox(height: 10,),
        Text(
          'температура',
          style: myTextStyleFontSarpanch(
            fontSize: 14,
            textColor: myTreeColor,
          ),
        ),
      ],
    ),
  );
}

_wet() {
  return Flexible(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      // mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 20,
                child: FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/icons/wet.png',
                      fit: BoxFit.contain,
                      // width: 50,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(
                  '45%',
                  style: myTextStyleFontSarpanch(fontSize: 24),
                ),
              ),
            ],
          ),
        ),
        Text(
          'влажность',
          style: myTextStyleFontSarpanch(
            fontSize: 14,
            textColor: myTreeColor,
          ),
        ),
      ],
    ),
  );
}
