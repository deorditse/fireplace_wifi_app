import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/alert_with_message_and_timer_on_body_screen.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartBodyScreenFireplaceSmartPrime1000 extends StatelessWidget {
  StartBodyScreenFireplaceSmartPrime1000(
      {Key? key, required this.alertMessage})
      : super(key: key);
  String alertMessage;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FireplaceConnectionGetXController>(
      builder: (controllerApp) => Column(
        children: [
          MyContainerAlert(
            child: Text(
              //камин готов к работе
              controllerApp.alertMessage,
              style: myTextStyleFontRoboto(
                fontSize: 24,
                textColor: myTwoColor,
              ),
            ),
          ),
          SizedBox(height: mySizedHeigtBetweenAlert),
          timeWorkFireplace(context),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              onTap: () {
                //playAndStopFireplace
                controllerApp.changeButtonPlayStopFireplace(
                    message: alertMessage);
              },
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: MediaQuery.of(context).size.width / 6,
                child: Image.asset(
                  (!controllerApp.isPlayFireplace &&
                      !controllerApp.fuelSystemError)
                      ? 'assets/button_fireplace/play.png'
                      : 'assets/button_fireplace/stop.png',
                  fit: BoxFit.none,
                  scale: 2,
                ),
              ),
            ),
          ),
          if ((controllerApp.isPlayFireplace && !controllerApp.fuelSystemError))
            Flexible(child: _ColumnButton()),
        ],
      ),
    );
  }
}

class _ColumnButton extends StatelessWidget {
  _ColumnButton({Key? key}) : super(key: key);

  Rx<bool> _buttonNorm = true.obs;
  Rx<bool> _buttonEco = false.obs;

  Color _colorTextButtonBlack = Color.fromRGBO(25, 25, 25, 1);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          child: GestureDetector(
            onTap: () {
              if (!_buttonNorm.value) {
                _buttonNorm.value = !_buttonNorm.value;
              }
              _buttonEco.value = false;
            },
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: MediaQuery.of(context).size.width / 6,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(
                    'assets/button_fireplace/clear_button.png',
                    fit: BoxFit.none,
                    scale: 2,
                  ),
                  Obx(
                        () => Positioned(
                      top: MediaQuery.of(context).size.width / 10,
                      child: Text(
                        'NORM',
                        style: myTextStyleFontRoboto(
                          fontSize: 12,
                          textColor: _buttonNorm.value
                              ? myColorActivity
                              : _colorTextButtonBlack,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Flexible(
          child: GestureDetector(
            onTap: () {
              if (!_buttonEco.value) {
                _buttonEco.value = !_buttonEco.value;
              }
              _buttonNorm.value = false;
            },
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: MediaQuery.of(context).size.width / 6,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(
                    'assets/button_fireplace/clear_button.png',
                    fit: BoxFit.none,
                    scale: 2,
                  ),
                  Obx(
                        () => Positioned(
                      top: MediaQuery.of(context).size.width / 10,
                      child: Text(
                        'ECO',
                        style: myTextStyleFontRoboto(
                          fontSize: 12,
                          textColor: _buttonEco.value
                              ? myColorActivity
                              : _colorTextButtonBlack,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}