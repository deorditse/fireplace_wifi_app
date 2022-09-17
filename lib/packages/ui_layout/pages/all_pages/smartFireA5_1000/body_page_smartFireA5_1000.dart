import 'package:fireplace_wifi_app/packages/ui_layout/pages/all_pages/smartFireA5_1000/widgets/navigation_bar_smartFireA5_1000.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/all_pages/smartFireA5_1000/widgets/slider_smart_fire_A51000.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/button_play_pause_fireplace_sceleton_for_all_page.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/tittle_fireplace_model_name.dart';
import 'package:flutter/material.dart';

class MainContentBodySmartFireA51000 extends StatelessWidget {
  MainContentBodySmartFireA51000({Key? key, required this.titleModel})
      : super(key: key);
  String titleModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: myTitleModel(titleModel: titleModel),
            ),
            Expanded(
              child: ButtonPlayStopPauseFireplaceForAllPages(
                alertMessage: 'розжиг камина',
              ),
            ),
          ],
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: navigationBarSmartFireA5_1000(context)),
        Positioned(
          right: 0,
          bottom: 70,
          child: sliderSmartFireA51000(),
        ),
      ],
    );
  }
}
