import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';

Widget timeWorkFireplace(BuildContext context, {bool? isIconTimer}) {
  return MyContainerAlert(
    width: MediaQuery.of(context).size.width * 0.7,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if (isIconTimer == true)
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                print('timeWorkFireplace open');
              },
              child: Image.asset(
                'assets/icons/icon_timer.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        Flexible(
          flex: 7,
          child: Column(
            crossAxisAlignment: isIconTimer == true
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  'время работы',
                  style: myTextStyleFontSarpanch(
                    fontSize: 24,
                    textColor: myTwoColor,
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  '00:00:00',
                  style: myTextStyleFontSarpanch(
                    fontSize: 28,
                    textColor: myTwoColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
