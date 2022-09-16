import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/all_pages/smartFireA3_1000/body_page_smartFireA3_1000.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/all_pages/smartFireA5_1000/widgets/navigation_bar_smartFireA5_1000.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/all_pages/smartPrime_1000/body_page_smart_prime_1000.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/button_play_pause_fireplace_sceleton_for_all_page.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/start_body_screen.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/navigation_bar/my_navigation_bar.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/tittle_fireplace_model_name.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainContentBodySmartFireA51000 extends StatelessWidget {
  MainContentBodySmartFireA51000({Key? key, required this.titleModel})
      : super(key: key);
  String titleModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        myTitleModel(titleModel: titleModel),
        Expanded(
          child: ButtonPlayStopPauseFireplaceForAllPages(
            alertMessage: 'розжиг камина',
          ),
        ),
        navigationBarSmartFireA5_1000(context),
      ],
    );
  }
}
