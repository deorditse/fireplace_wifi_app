import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';

alertAndTimerOnBodyScreen(context, {required String textAlert}) {
  return Column(
    children: [
      MyContainerAlert(
        child: Text(
          textAlert,
          style: myTextStyleFontRoboto(
            fontSize: 24,
            textColor: myTwoColor,
          ),
        ),
      ),
      SizedBox(height: 10),
      timeWorkFireplace(context),
    ],
  );
}

Widget timeWorkFireplace(BuildContext context) {
  return MyContainerAlert(
    width: MediaQuery.of(context).size.width * 0.7,
    child: FittedBox(
      child: Column(
        children: [
          Text(
            'время работы',
            style: myTextStyleFontSarpanch(
              fontSize: 24,
              textColor: myTwoColor,
            ),
          ),
          Text(
            '00:00:00',
            style: myTextStyleFontSarpanch(
              fontSize: 24,
              textColor: myTwoColor,
            ),
          ),
        ],
      ),
    ),
  );
}
