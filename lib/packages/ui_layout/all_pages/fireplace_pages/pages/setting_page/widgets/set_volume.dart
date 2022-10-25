import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/fireplace_pages/widgets/sliders/style/gradient_slider.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/widgets_for_all_pages/rowWithDomain.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

import 'slider_theme_widget.dart';

class SetVolumeWidget extends StatelessWidget {
  const SetVolumeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Настройки звука:',
          style: myTextStyleFontRoboto(
            fontSize: 16,
            // textColor: myColorActivity,
          ),
        ),
        SizedBox(height: mySizedHeightBetweenAlert),

        ///подключение опций
        //эта опция есть во всех каминах по умолчанию
        _optionButtonClickSound(),
        //опция Зв. эффект потрескивание дров
        if (FireplaceConnectionGetXController
                .instance.fireplaceData?.sliderValueCracklingSoundEffect !=
            null)
          Padding(
            padding: EdgeInsets.only(top: mySizedHeightBetweenAlert),
            child: _optionSoundFirewoodCrackleEffect(),
          ),
        //опция Голосовые подсказки
        if (FireplaceConnectionGetXController
                .instance.fireplaceData?.sliderValueVoicePrompts !=
            null)
          Padding(
            padding: EdgeInsets.only(top: mySizedHeightBetweenAlert),
            child: _optionVoicePrompts(),
          ),
      ],
    );
  }

  _optionButtonClickSound() {
    return Row(
      children: [
        GetBuilder<FireplaceConnectionGetXController>(
          builder: (controllerApp) {
            return FlutterSwitch(
              activeTextFontWeight: FontWeight.w500,
              inactiveTextFontWeight: FontWeight.w500,
              activeText: 'off',
              inactiveText: 'on',
              value: controllerApp.fireplaceData?.isSwitchClickSound ?? false,
              activeColor: Colors.black,
              toggleColor: Color.fromRGBO(113, 109, 109, 1),
              inactiveColor: Colors.black,
              borderRadius: 10.0,
              padding: 3,
              showOnOff: true,
              onToggle: (val) {
                controllerApp.changeSwitchButtonClickSound();
              },
            );
          },
        ),
        SizedBox(width: mySizedHeightBetweenAlert),
        Text(
          'Звук нажатия кнопок',
          style: myTextStyleFontRoboto(textColor: myTwoColor),
        ),
      ],
    );
  }

  _optionSoundFirewoodCrackleEffect() {
    Rx<double> _sliderValue = 1.0.obs;

    return GetBuilder<FireplaceConnectionGetXController>(
      builder: (controllerApp) => Column(
        children: [
          Row(
            children: [
              FlutterSwitch(
                activeTextFontWeight: FontWeight.w500,
                inactiveTextFontWeight: FontWeight.w500,
                activeText: 'off',
                inactiveText: 'on',
                value: controllerApp.isSwitchCracklingSoundEffect,
                activeColor: Colors.black,
                toggleColor: Color.fromRGBO(113, 109, 109, 1),
                inactiveColor: Colors.black,
                borderRadius: 10.0,
                padding: 3,
                showOnOff: true,
                onToggle: (val) {
                  controllerApp.changeSwitchCracklingSoundEffect();
                },
              ),
              SizedBox(width: mySizedHeightBetweenAlert),
              FittedBox(
                child: Text(
                  'Зв. эффект потрескивание дров',
                  style: myTextStyleFontRoboto(textColor: myTwoColor),
                ),
              ),
            ],
          ),
          if (controllerApp.isSwitchCracklingSoundEffect)
            Padding(
              padding: EdgeInsets.only(top: mySizedHeightBetweenAlert / 2),
              child: MySliderTheme(
                child: Obx(
                  () => Slider(
                    divisions: 10,
                    label: '${_sliderValue.value}',
                    min: 0.0,
                    max: 10,
                    value: _sliderValue.value,
                    onChangeEnd: (double value) {
                      print(value);
                    },
                    onChanged: (double value) {
                      _sliderValue.value = value;
                    },
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  _optionVoicePrompts() {
    Rx<double> _sliderValue = 1.0.obs;

    return GetBuilder<FireplaceConnectionGetXController>(
      builder: (controllerApp) => Column(
        children: [
          Row(
            children: [
              FlutterSwitch(
                activeTextFontWeight: FontWeight.w500,
                inactiveTextFontWeight: FontWeight.w500,
                activeText: 'off',
                inactiveText: 'on',
                value: controllerApp.isSwitchVoicePrompts,
                activeColor: Colors.black,
                toggleColor: Color.fromRGBO(113, 109, 109, 1),
                inactiveColor: Colors.black,
                borderRadius: 10.0,
                padding: 3,
                showOnOff: true,
                onToggle: (val) {
                  controllerApp.changeSwitchVoicePrompts();
                },
              ),
              SizedBox(width: mySizedHeightBetweenAlert),
              Text(
                'Голосовые подсказки',
                style: myTextStyleFontRoboto(textColor: myTwoColor),
              ),
            ],
          ),
          if (controllerApp.isSwitchVoicePrompts)
            Padding(
              padding: EdgeInsets.only(top: mySizedHeightBetweenAlert / 2),
              child: MySliderTheme(
                child: Obx(
                  () => Slider(
                    divisions: 10,
                    label: '${_sliderValue.value}',
                    min: 0.0,
                    max: 10,
                    value: _sliderValue.value,
                    onChangeEnd: (double value) {
                      print(value);
                    },
                    onChanged: (double value) {
                      _sliderValue.value = value;
                    },
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
