import 'dart:io';

import 'package:business_layout/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/fireplace_pages/widgets/timer/timer_format.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/widgets_for_all_pages/my_default_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

defaultDialogIfDayHasNotComeNew({required context}) {
  myDefaultDialog(
    context: context,
    bodyWidget: DefaultDialogIfDayHasNotCome(),
  );
}

class DefaultDialogIfDayHasNotCome extends StatelessWidget {
  const DefaultDialogIfDayHasNotCome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FireplaceConnectionGetXController>(
      builder: (controllerApp) {
        bool isRunning = controllerApp.timerIsRunning;

        return Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: SvgPicture.asset(
                'assets/icons/timer.svg',
                semanticsLabel: 'timer',
                color: isRunning ? myColorActivity : null,
                fit: BoxFit.contain,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: Platform.isIOS ? 12.0 : 2),
                child: TextButton(
                  onPressed: () {
                    if (!isRunning) {
                      controllerApp.updateTimerFireplace(isIncrement: true);
                    }
                  },
                  child: SvgPicture.asset(
                    'assets/icons/icon_up.svg',
                    semanticsLabel: 'icon_bottom',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Get.close(0),
                child: Image.asset(
                  'assets/icons/close.png',
                  fit: BoxFit.contain,
                  scale: 2,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: timerFormat(padding: 22),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(
                    const Color.fromRGBO(255, 0, 0, 1).withOpacity(0.1),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: () {
                  controllerApp.updateTimerFireplace(cancel: true);
                },
                child: Text(
                  isRunning ? '' : 'Сброс.',
                  textAlign: TextAlign.left,
                  style: myTextStyleFontSarpanch(
                    fontSize: 24,
                    textColor:
                        myColorActivity, //const Color.fromRGBO(255, 0, 0, 1),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: Platform.isIOS ? 12.0 : 2),
                child: RotatedBox(
                  quarterTurns: 2,
                  child: TextButton(
                    onPressed: () {
                      if (!isRunning) {
                        controllerApp.updateTimerFireplace(isIncrement: false);
                      }
                    },
                    child: SvgPicture.asset(
                      'assets/icons/icon_up.svg',
                      semanticsLabel: 'icon_bottom',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent)),
                onPressed: () {
                  if (isRunning) {
                    controllerApp.updateTimerFireplace(cancel: true);
                    return;
                  } else {
                    controllerApp.startTimer();
                  }
                },
                child: FittedBox(
                  child: Text(
                    isRunning ? 'Выкл.' : 'Установ.',
                    textAlign: TextAlign.right,
                    style: myTextStyleFontSarpanch(
                      fontSize: 24,
                      textColor:
                          // !isRunning
                          //     ? const Color.fromRGBO(0, 255, 71, 1)
                          //     :
                          myColorActivity, //const Color.fromRGBO(253, 133, 0, 1),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
