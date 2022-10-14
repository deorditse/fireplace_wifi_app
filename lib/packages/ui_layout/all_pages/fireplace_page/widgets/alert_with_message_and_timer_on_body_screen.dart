import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                builder: (controllerApp) => SvgPicture.asset(
                  'assets/icons/timer.svg',
                  semanticsLabel: 'icon_bottom',
                  color: controllerApp.timerIsRunning ? myColorActivity : null,
                  fit: BoxFit.contain,
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
