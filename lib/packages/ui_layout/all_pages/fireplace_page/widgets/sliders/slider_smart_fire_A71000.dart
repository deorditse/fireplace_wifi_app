import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/fireplace_page/widgets/sliders/style/gradient_slider.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliderSmartFireA71000 extends StatelessWidget {
  const SliderSmartFireA71000({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.4,
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
                  ..._labels.map(
                        (e) => Text(
                      e,
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
    );
  }
}

final List<String> _labels = ['7','6','5', '4', '3', '2', '1'];

class _SliderSmartFireA71000 extends StatefulWidget {
  const _SliderSmartFireA71000({Key? key}) : super(key: key);

  @override
  State<_SliderSmartFireA71000> createState() => _SliderSmartFireA71000State();
}

class _SliderSmartFireA71000State extends State<_SliderSmartFireA71000> {
  Rx<double> sliderValue = 1.0.obs;
  final double min = 1.0;
  late final double max;
  late final divisions;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    max = _labels.length.toDouble();
    divisions = _labels.length - 1;
  }

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData().copyWith(
        trackHeight: 15,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
        overlayShape: RoundSliderThumbShape(enabledThumbRadius: 10),
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
            divisions: divisions * 2,
            // label: '${sliderValue.value}',
            min: min,
            max: max,
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
