import 'package:fireplace_wifi_app/packages/ui_layout/pages/all_pages/smartFireA3_1000/widgets/slider_smart_fire_A31000.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/button_play_pause_fireplace_sceleton_for_all_page.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/navigation_bar/my_navigation_bar.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/tittle_fireplace_model_name.dart';
import 'package:flutter/material.dart';

class MainContentBodySmartFireA31000 extends StatelessWidget {
  MainContentBodySmartFireA31000({Key? key, required this.titleModel})
      : super(key: key);
  String titleModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: myTitleModel(titleModel: titleModel),
            ),
            Expanded(
              child: ButtonPlayStopPauseFireplaceForAllPages(
                alertMessage: 'разогрев системы',
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: myNavigationBar(context),
        ),
        Positioned(
          right: 0,
          bottom: MediaQuery.of(context).size.height / 5,
          child: sliderSmartFireA31000(),
        ),
      ],
    );
  }
}
