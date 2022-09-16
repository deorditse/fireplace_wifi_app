import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/alert_with_message_and_timer_on_body_screen.dart';
import 'package:flutter/material.dart';

class IfTheFireplaceIsNotRunningBody extends StatelessWidget {
  const IfTheFireplaceIsNotRunningBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        alertAndTimerOnBodyScreen(context, textAlert: 'камин готов к работе'),
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
