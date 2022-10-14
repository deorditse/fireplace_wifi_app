import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/fireplace_page/widgets/sliders/style/gradient_slider.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliderSmartFireA31000 extends StatelessWidget {
  const SliderSmartFireA31000({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3.5,
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
            child: _SiderSmartFireA31000(),
          ),
        ],
      ),
    );
  }
}

final List<String> _labels = ['3', '2', '1'];

class _SiderSmartFireA31000 extends StatefulWidget {
  const _SiderSmartFireA31000({Key? key}) : super(key: key);

  @override
  State<_SiderSmartFireA31000> createState() => _SiderSmartFireA31000State();
}

class _SiderSmartFireA31000State extends State<_SiderSmartFireA31000> {
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
