import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/fireplace_page/widgets/alert_with_message_and_timer_on_body_screen.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'widgets/buttons_for_A1000_SmartFire.dart';

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
                style: myTextStyleFontRoboto(
                  fontSize: 24,
                  textColor: myTwoColor,
                ),
              ),
            ),
            SizedBox(height: mySizedHeigtBetweenAlert),
            timeWorkFireplace(context),
            controllerApp.isButtonFor1000Fireplace
                ? ButtonsIfFireplaceSmartPrime1000()
                : Align(
                    alignment: Alignment.topCenter,
                    child: GestureDetector(
                      onTap: () {
                        //playAndStopFireplace
                        controllerApp.changeButtonPlayStopFireplace();
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: MediaQuery.of(context).size.width / 4,
                        child: SvgPicture.asset(
                          (controllerApp.isPlayFireplace == false &&
                                  !controllerApp.isFuelSystemError)
                              ? 'assets/button_fireplace/play.svg'
                              : 'assets/button_fireplace/stop.svg',
                          semanticsLabel: 'icon_bottom',
                          fit: BoxFit.contain,
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
