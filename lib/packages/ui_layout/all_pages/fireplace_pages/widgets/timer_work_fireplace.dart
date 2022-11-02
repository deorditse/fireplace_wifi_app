import 'package:business_layout/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/fireplace_pages/widgets/container_alert.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'timer/default_dialog_for_timer_new.dart';
import 'timer/timer_format.dart';

Widget timeWorkFireplace(BuildContext context) {
  if (FireplaceConnectionGetXController.instance.isOptionTimer) {
    return MyContainerAlert(
          width: MediaQuery.of(context).size.width * 0.64,
          height: 80,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FittedBox(
                child: GetBuilder<FireplaceConnectionGetXController>(
                  builder: (controllerApp) => TextButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero)),
                    onPressed: () {
                      if (!FireplaceConnectionGetXController
                          .instance.isBlocButton) {
                        // defaultDialogIfDayHasNotCome(context: context);
                        defaultDialogIfDayHasNotComeNew(context: context);
                        print('timeWorkFireplace open');
                      }
                    },
                    child: SvgPicture.asset(
                      'assets/icons/timer.svg',
                      semanticsLabel: 'timer',
                      color:
                          controllerApp.timerIsRunning ? myColorActivity : null,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   width: mySizedHeightBetweenAlert,
              // ),
              Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                        child: timerFormat(myFontSize: 29),

                        //     Text(
                        //   controllerApp.timerDateInHHMMSS[0],
                        //   style: myTextStyleFontSarpanch(
                        //     fontSize: 28,
                        //     textColor: myTwoColor,
                        //   ),
                        // ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
  } else {
    return SizedBox(
          height: MediaQuery.of(context).size.height / 10,
        );
  }
}
