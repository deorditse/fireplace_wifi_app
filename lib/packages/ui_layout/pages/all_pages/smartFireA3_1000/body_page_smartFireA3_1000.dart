import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/fireplace_page/main_body_state_fireplace.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/fireplace_page/widgets/bottom_row_with_parameters/my_navigation_bar.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/fireplace_page/widgets/tittle_fireplace_model_name.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/all_pages/smartFireA3_1000/widgets/slider_smart_fire_A31000.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              child: myTitleModel(),
            ),
            Expanded(
              child: MainBodyStateFireplace(
                alertMessage: 'разогрев системы',
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: myNavigationBar(context),
        ),

        //Слайдер (убераю его с экрана, когда идет охдажение камина)
        GetBuilder<FireplaceConnectionGetXController>(
          builder: (controllerApp) {
            return !controllerApp.isCoolingFireplace
                ? Positioned(
                    right: 0,
                    bottom: MediaQuery.of(context).size.height / 5,
                    child: SliderSmartFireA31000(),
                  )
                : Container();
          },
        ),
      ],
    );
  }
}
