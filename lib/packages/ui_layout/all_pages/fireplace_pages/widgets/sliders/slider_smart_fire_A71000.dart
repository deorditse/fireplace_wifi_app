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
        return Column(
          children: [
            if (!controllerApp.isCoolingFireplace)
              SizedBox(
                height: MediaQuery.of(context).size.height /
                    ((controllerApp.fireplaceData!.sliderValue.keys.first!) > 3
                        ? 2.4
                        : 3.1),
                width: MediaQuery.of(context).size.width / 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ..._labels.reversed.map(
                              (e) => Text(
                                e.toString(),
                                style: myTextStyleFontRoboto(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
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
  Rx<double> sliderValue = (FireplaceConnectionGetXController
              .instance.fireplaceData!.sliderValue.values.first ??
          1)
      .toDouble()
      .obs;
  late final divisions;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    divisions = (FireplaceConnectionGetXController
            .instance.fireplaceData!.sliderValue.keys.first!) -
        1;

    sliderValue.value = (FireplaceConnectionGetXController
                .instance.fireplaceData!.sliderValue.values.first ??
            1)
        .toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData().copyWith(
        trackHeight: 15,
        thumbShape:
            RoundSliderThumbShape(enabledThumbRadius: 15, elevation: 10),
        overlayShape:
            RoundSliderThumbShape(enabledThumbRadius: 10, elevation: 10),
        activeTickMarkColor: Colors.transparent,
        inactiveTickMarkColor: myTreeColor,
        thumbColor: Color.fromRGBO(113, 109, 109, 1),
        inactiveTrackColor: Color.fromRGBO(189, 189, 189, 1),
        trackShape: GradientRectSliderTrackShape(
          gradient: gradientForSlider,
          darkenInactive: true,
        ),
      ),
      child: Obx(
        () => RotatedBox(
          quarterTurns: 3,
          child: Slider(
            divisions: divisions,
            // label: '${sliderValue.value}',
            min: 1.0,
            max: (FireplaceConnectionGetXController
                    .instance.fireplaceData!.sliderValue.keys.first!)
                .toDouble(),
            value: sliderValue.value,
            onChangeEnd: (double value) {
              print(value);
            },
            onChanged: (double value) {
              sliderValue.value = value;
            },
          ),
        ),
      ),
    );
  }
}
