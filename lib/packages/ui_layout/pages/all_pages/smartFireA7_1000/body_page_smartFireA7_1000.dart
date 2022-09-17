import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/all_pages/smartFireA7_1000/widgets/navigation_bar_smartFireA7_1000.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/all_pages/smartFireA7_1000/widgets/slider_smart_fire_A71000.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/button_play_pause_fireplace_sceleton_for_all_page.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/tittle_fireplace_model_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainContentBodySmartFireA71000 extends StatelessWidget {
  MainContentBodySmartFireA71000({Key? key, required this.titleModel})
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
                alertMessage: 'розжиг камина',
                isIconTimer: true,
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: navigationBarsmartFireA7_1000(context),
        ),

        //Слайдер (убераю его с экрана, когда идет охдажение камина)
        GetBuilder<FireplaceConnectionGetXController>(
          builder: (controllerApp) {
            return !controllerApp.isCoolingFireplace
                ? Positioned(
                    right: 0,
                    bottom: 70,
                    child: sliderSmartFireA71000(),
                  )
                : Container();
          },
        ),
      ],
    );
  }
}
