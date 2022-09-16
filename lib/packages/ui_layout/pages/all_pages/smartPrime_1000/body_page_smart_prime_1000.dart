import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/alert_with_message_and_timer_on_body_screen.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/navigation_bar/my_navigation_bar.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/tittle_fireplace_model_name.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainContentBodySmartPrime1000 extends StatelessWidget {
  MainContentBodySmartPrime1000({Key? key, required this.titleModel})
      : super(key: key);
  String titleModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        myTitleModel(titleModel: titleModel),
        Expanded(
          child: ButtonPlayStopPauseFireplaceSmartPrime1000(),
        ),
        myNavigationBar(context),
      ],
    );
  }
}

class ButtonPlayStopPauseFireplaceSmartPrime1000 extends StatelessWidget {
  const ButtonPlayStopPauseFireplaceSmartPrime1000({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FireplaceConnectionGetXController>(
      builder: (controllerApp) {
        if (controllerApp.isCoolingFireplace &&
            !controllerApp.fuelSystemError) {
//если камин в режиме охлаждения
          return MyContainerAlert(
            message: 'охлаждение камина',
          );
        } else if (controllerApp.fuelSystemError) {
//если ОШИБКА
          return MyContainerAlert(
            borderColor: myColorActivity,
            message: 'ОШИБКА: неисправность\nтопливной системы!!!',
          );
        } else {
          //если камин не запущен и хотим запустить
          return _StartBodyScreenFireplace(
            alertMessage: 'уровень пламени NORM',
          );
        }
      },
    );
  }
}

class _StartBodyScreenFireplace extends StatelessWidget {
  _StartBodyScreenFireplace({Key? key, required this.alertMessage})
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
            height: 40,
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
                  (controllerApp.isPlayFireplace == false &&
                          !controllerApp.fuelSystemError)
                      ? 'assets/button_fireplace/play.png'
                      : 'assets/button_fireplace/stop.png',
                  fit: BoxFit.none,
                  scale: 2.4,
                ),
              ),
            ),
          ),

          if ((!controllerApp.isPlayFireplace &&
              !controllerApp.fuelSystemError))
            Flexible(child: _ColumnButton()),

          // PlayFireplaceBodyScreenSmartPrime1000(),
        ],
      ),
    );
  }
}

class _ColumnButton extends StatelessWidget {
  _ColumnButton({Key? key}) : super(key: key);

  Rx<bool> _diactivateButton = true.obs;
  Color _colorTextButtonBlack = Color.fromRGBO(25, 25, 25, 1);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          child: GestureDetector(
            onTap: () {
              _diactivateButton.value = !_diactivateButton.value;
            },
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: MediaQuery.of(context).size.width / 8,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(
                    'assets/button_fireplace/clear_button.png',
                    fit: BoxFit.none,
                    scale: 2.7,
                  ),
                  Obx(
                    () => Positioned(
                      top: MediaQuery.of(context).size.width / 10,
                      child: Text(
                        'NORM',
                        style: myTextStyleFontRoboto(
                          fontSize: 12,
                          textColor: _diactivateButton.value
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
// FireplaceConnectionGetXController.instance.stopFireplace();
              _diactivateButton.value = !_diactivateButton.value;
            },
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: MediaQuery.of(context).size.width / 8,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(
                    'assets/button_fireplace/clear_button.png',
                    fit: BoxFit.none,
                    scale: 2.7,
                  ),
                  Obx(
                    () => Positioned(
                      top: MediaQuery.of(context).size.width / 10,
                      child: Text(
                        'ECO',
                        style: myTextStyleFontRoboto(
                          fontSize: 12,
                          textColor: _diactivateButton.value
                              ? _colorTextButtonBlack
                              : myColorActivity,
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
