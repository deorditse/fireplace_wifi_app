import 'package:business_layout/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/fireplace_pages/widgets/timer_work_fireplace.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'widgets/buttons_for_A1000_SmartFire.dart';
import 'widgets/container_alert.dart';

class StartBodyScreenFireplace extends StatelessWidget {
  StartBodyScreenFireplace({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FireplaceConnectionGetXController>(
      builder: (controllerApp) {
        String alertMessage = controllerApp.alertMessage;
        return Column(
          children: [
            MyContainerAlert(
              child: Text(
                alertMessage,
                style:
                    myTextStyleFontRoboto(fontSize: 24, textColor: myTwoColor),
              ),
            ),
            SizedBox(height: mySizedHeightBetweenAlert),
            timeWorkFireplace(context),
            // (controllerApp.fireplaceData?.sliderValue == null)
            //     ? ButtonsIfFireplaceSmartPrime1000()
            //     :
            Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: MediaQuery.of(context).size.width / 5,
                child: TextButton(
                  onPressed: () {
                    controllerApp.changeButtonPlayStopFireplace();
                  },
                  child: SvgPicture.asset(
                    (controllerApp.isPlayFireplace == false &&
                            !controllerApp.isFuelSystemError)
                        ? 'assets/button_fireplace/play.svg'
                        : 'assets/button_fireplace/stop.svg',
                    semanticsLabel: 'icon_bottom',
                    fit: BoxFit.none,
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
