import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/alert_with_message_and_timer_on_body_screen.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/if_the_fireplace_is_NOT_running_body.dart';
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
        if (controllerApp.isPlayFireplace == false &&
            !controllerApp.fuelSystemError) {
//если камин не запущен
          return  IfTheFireplaceIsNotRunningBody();
        } else if (controllerApp.isCoolingFireplace &&
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
//если камин запущен
          return const PlayFireplaceBodyScreen();
        }
      },
    );
  }
}

class PlayFireplaceBodyScreen extends StatelessWidget {
  const PlayFireplaceBodyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Rx<bool> _diactivateButton = true.obs;
    Color _colorTextButtonBlack = Color.fromRGBO(25, 25, 25, 1);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        MyContainerAlert(
          child: Text(
            'уровень пламени NORM',
            style: myTextStyleFontRoboto(
              fontSize: 24,
              textColor: myTwoColor,
            ),
          ),
        ),
        const SizedBox(height: 10),
        timeWorkFireplace(context),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
//stopFireplace
                  FireplaceConnectionGetXController.instance.stopFireplace();
                },
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: MediaQuery.of(context).size.width / 8,
                  child: Image.asset(
                    'assets/button_fireplace/stop.png',
                    fit: BoxFit.none,
                    scale: 2.7,
                  ),
                ),
              ),
              GestureDetector(
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
              GestureDetector(
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
            ],
          ),
        ),
      ],
    );
  }
}
