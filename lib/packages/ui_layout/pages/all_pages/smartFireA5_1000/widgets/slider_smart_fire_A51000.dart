
import 'package:flutter/material.dart';
import 'package:get/get.dart';



sliderSmartFireA51000() {
  Rx<double> sliderValue = 1.0.obs;

  //добавить это значение на слой бизнес логики

  return Container(
    color: Colors.red,
    height: 280,
    width: 30,
    child: RotatedBox(
      quarterTurns: -1,
      child: Obx(
            () => Slider(
          max: 50.0,
          min: 1.0,
          value: sliderValue.value,
          onChanged: (value) {
            sliderValue.value = value;
          },
        ),
      ),
    ),
  );
}