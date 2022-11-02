import 'package:business_layout/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_body_state_fireplace.dart';
import 'widgets/bottom_row_with_parameters/bottom_row_with_parameters.dart';
import 'widgets/sliders/slider_smart_fire_A71000.dart';
import 'widgets/tittle_fireplace_model_name.dart';

class BodyFireplacePage extends StatelessWidget {
  BodyFireplacePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FireplaceConnectionGetXController>(
      builder: (controllerApp) => Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: myTitleModel(),
              ),
              controllerApp.fireplaceData != null
                  ? const Expanded(
                      child: MainBodyStateFireplace(),
                    )
                  : Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            color: myColorActivity,
                          ),
                          SizedBox(
                            height: mySizedHeightBetweenAlert,
                          ),
                          Text(
                            'Загрузка данных...',
                            style: myTextStyleFontRoboto(),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
          if (controllerApp.fireplaceData != null)
            Align(
              alignment: Alignment.bottomCenter,
              child: bottomRowWithParameters(context),
            ),

          // если опция слайдера включена OptionSliderFireplace
          if (controllerApp.fireplaceData != null &&
              FireplaceConnectionGetXController
                      .instance.fireplaceData?.sliderValue.keys.first !=
                  null)
            Positioned(right: 0, bottom: 70, child: SliderSmartFireA71000()),
        ],
      ),
    );
  }
}
