import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'timer/default_dialog_for_timer.dart';

Widget timeWorkFireplace(BuildContext context) {
  return MyContainerAlert(
    width: MediaQuery.of(context).size.width * 0.7,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if (FireplaceConnectionGetXController.instance.isOptionTimer == true)
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                defaultDialogIfDayHasNotCome(context: context);
                print('timeWorkFireplace open');
              },
              child: GetBuilder<FireplaceConnectionGetXController>(
                builder: (controllerApp) => Image.asset(
                  controllerApp.timerIsRunning
                      ? 'assets/icons/timer_active.png'
                      : 'assets/icons/icon_timer.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        Flexible(
          flex: 7,
          child: Column(
            crossAxisAlignment:
                FireplaceConnectionGetXController.instance.isOptionTimer == true
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
              GetBuilder<FireplaceConnectionGetXController>(
                builder: (controllerApp) => Flexible(
                  child: Text(
                    controllerApp.dataTimeWorkFireplace.toString(),
                    style: myTextStyleFontSarpanch(
                      fontSize: 28,
                      textColor: myTwoColor,
                    ),
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
