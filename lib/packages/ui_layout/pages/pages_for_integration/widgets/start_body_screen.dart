import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/alert_with_message_and_timer_on_body_screen.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartBodyScreenFireplace extends StatelessWidget {
  StartBodyScreenFireplace(
      {Key? key, this.isIconTimer, required this.alertMessage})
      : super(key: key);
  bool? isIconTimer;
  String alertMessage;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FireplaceConnectionGetXController>(
      builder: (controllerApp) => Column(
        children: [
          MyContainerAlert(
            child: Text(
              //камин готов к работе
              controllerApp.alertMessage,
              style: myTextStyleFontRoboto(
                fontSize: 24,
                textColor: myTwoColor,
              ),
            ),
          ),
          SizedBox(height: mySizedHeigtBetweenAlert),
          timeWorkFireplace(context, isIconTimer: isIconTimer),
          Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              onTap: () {
                //playAndStopFireplace
                controllerApp.changeButtonPlayStopFireplace(
                    message: alertMessage);
              },
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: MediaQuery.of(context).size.width / 4,
                child: Image.asset(
                  (controllerApp.isPlayFireplace == false &&
                          !controllerApp.fuelSystemError)
                      ? 'assets/button_fireplace/play.png'
                      : 'assets/button_fireplace/stop.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
