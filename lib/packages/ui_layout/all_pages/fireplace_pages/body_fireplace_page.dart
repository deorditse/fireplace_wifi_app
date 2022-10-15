import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
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
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: myTitleModel(),
            ),
            const Expanded(
              child: MainBodyStateFireplace(),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: bottomRowWithParameters(context),
        ),
        // если опция слайдера включена isOptionSliderFireplace
        if (FireplaceConnectionGetXController.instance.isOptionSliderFireplace)
          Positioned(right: 0, bottom: 70, child: SliderSmartFireA71000()),
      ],
    );
  }
}
