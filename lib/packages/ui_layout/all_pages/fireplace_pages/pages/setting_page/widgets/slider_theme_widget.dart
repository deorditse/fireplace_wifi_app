import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/fireplace_pages/widgets/sliders/style/gradient_slider.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/widgets_for_all_pages/rowWithDomain.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MySliderTheme extends StatelessWidget {
  const MySliderTheme({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: const SliderThemeData().copyWith(
        trackHeight: 5,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 14),
        overlayShape: RoundSliderThumbShape(enabledThumbRadius: 5),
        activeTickMarkColor: Colors.transparent,
        inactiveTickMarkColor: Colors.black,
        activeTrackColor: myColorActivity,
        thumbColor: myTreeColor,
        inactiveTrackColor: Color.fromRGBO(189, 189, 189, 1),
        // GradientRectSliderTrackShape(
        //   gradient: Color.fromRGBO(189, 189, 189, 1),
        //   darkenInactive: true,
        // ),
      ),
      child: child,
    );
  }
}
