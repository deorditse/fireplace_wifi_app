import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/alert_with_message_and_timer_on_body_screen.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';

class IfTheFireplaceIsNotRunningBody extends StatelessWidget {
  IfTheFireplaceIsNotRunningBody({Key? key, this.isIconTimer})
      : super(key: key);
  bool? isIconTimer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyContainerAlert(
          child: Text(
            'камин готов к работе',
            style: myTextStyleFontRoboto(
              fontSize: 24,
              textColor: myTwoColor,
            ),
          ),
        ),
        SizedBox(height: 10),
        timeWorkFireplace(context, isIconTimer: isIconTimer),
        Align(
          alignment: Alignment.topCenter,
          child: GestureDetector(
            onTap: () {
              //playFireplace
              FireplaceConnectionGetXController.instance.playFireplace();
            },
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: MediaQuery.of(context).size.width / 4,
              child: Image.asset(
                'assets/button_fireplace/play.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
