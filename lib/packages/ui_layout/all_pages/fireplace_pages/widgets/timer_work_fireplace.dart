import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/fireplace_pages/widgets/container_alert.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'timer/default_dialog_for_timer.dart';

Widget timeWorkFireplace(BuildContext context) {
  return FireplaceConnectionGetXController.instance.isOptionTimer
      ? MyContainerAlert(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: GetBuilder<FireplaceConnectionGetXController>(
                  builder: (controllerApp) => TextButton(
                    onPressed: () {
                      if (!FireplaceConnectionGetXController
                          .instance.isBlocButton) {
                        defaultDialogIfDayHasNotCome(context: context);
                        print('timeWorkFireplace open');
                      }
                    },
                    child: SvgPicture.asset(
                      'assets/icons/timer.svg',
                      semanticsLabel: 'icon_bottom',
                      color:
                          controllerApp.timerIsRunning ? myColorActivity : null,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: mySizedHeightBetweenAlert,
              ),
              Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Text(
                          'таймер',
                          style: myTextStyleFontSarpanch(
                            fontSize: 20,
                            textColor: myTwoColor,
                          ),
                        ),
                      ),
                      Flexible(
                        child: GetBuilder<FireplaceConnectionGetXController>(
                          builder: (controllerApp) => FittedBox(
                            child: Text(
                              controllerApp.dataTimerFireplace.toString(),
                              style: myTextStyleFontSarpanch(
                                fontSize: 28,
                                textColor: myTwoColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      : SizedBox(
          height: MediaQuery.of(context).size.height / 10,
        );
}
