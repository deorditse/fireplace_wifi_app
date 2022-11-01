import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/fireplace_pages/widgets/sliders/style/gradient_slider.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliderSmartFireA71000 extends StatelessWidget {
  const SliderSmartFireA71000({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FireplaceConnectionGetXController>(
      builder: (controllerApp) {
        final List<int> _labels = List.generate(
            controllerApp.fireplaceData!.sliderValue.keys.first!,
            (index) => index.toInt() + 1);
        //Слайдер (убераю его с экрана, когда идет охдажение камина)

        double heightSlider = MediaQuery.of(context).size.height /
            ((controllerApp.fireplaceData!.sliderValue.keys.first!) > 3
                ? 2.2
                : 3);
        return Column(
          children: [
            if (!controllerApp.isCoolingFireplace)
              SizedBox(
                height: heightSlider,
                width: MediaQuery.of(context).size.width / 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 15,
                            bottom: (heightSlider /
                                        controllerApp.fireplaceData!.sliderValue
                                            .keys.first!)
                                    .toDouble() -
                                3),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ..._labels.reversed.map(
                                (e) => Text(
                                  e.toString(),
                                  style: myTextStyleFontRoboto(fontSize: 22, textColor: myTwoColor),
                                ),
                              ),
                            ]),
                      ),
                    ),
                    Expanded(
                      child: _SliderSmartFireA71000(),
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}

class _SliderSmartFireA71000 extends StatefulWidget {
  const _SliderSmartFireA71000({
    Key? key,
  }) : super(key: key);

  @override
  State<_SliderSmartFireA71000> createState() => _SliderSmartFireA71000State();
}

class _SliderSmartFireA71000State extends State<_SliderSmartFireA71000> {
  Rx<double> sliderValue =
      (FireplaceConnectionGetXController.instance.valuePowerFireplace).obs;

  final double maxValue = (FireplaceConnectionGetXController
          .instance.fireplaceData!.sliderValue.keys.first!)
      .toDouble();

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData().copyWith(
        trackHeight: 15,
        thumbShape: RoundSliderThumbShape(
          enabledThumbRadius: 20,
          pressedElevation: 20,
        ),
        overlayShape:
            RoundSliderThumbShape(enabledThumbRadius: 10, elevation: 10),
        activeTickMarkColor: Colors.transparent,
        inactiveTickMarkColor:  Colors.grey,
        thumbColor: myTreeColor,
        //Color.fromRGBO(113, 109, 109, 1),
        inactiveTrackColor: myTreeColor,
        // Color.fromRGBO(189, 189, 189, 1),
        trackShape: GradientRectSliderTrackShape(
          gradient: gradientForSlider,
          darkenInactive: true,
        ),
      ),
      child: Obx(
        () => RotatedBox(
          quarterTurns: 3,
          child: Slider(
            divisions: maxValue.toInt(),
            // label: '${sliderValue.value}',
            min: 0.0,
            max: maxValue,
            value: sliderValue.value,
            onChangeEnd: (double value) {
              if (value >= 1) {
                FireplaceConnectionGetXController.instance
                    .changePowerSliderFireplace(newValuePowerFireplace: value);
              } else {
                FireplaceConnectionGetXController.instance
                    .changePowerSliderFireplace(newValuePowerFireplace: 1);
              }
            },
            onChanged: (double value) {
              if (value >= 1) {
                sliderValue.value = value;
              } else {
                sliderValue.value = 1;
              }
            },
          ),
        ),
      ),
    );
  }
}
