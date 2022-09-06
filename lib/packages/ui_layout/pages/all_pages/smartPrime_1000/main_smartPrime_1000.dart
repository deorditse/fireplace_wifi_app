import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/app_bar/body_block_fireplace/block_fireplace.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/app_bar/body_setting_fireplace/body_setting_page.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/app_bar/myAppBar.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/navigation_bar/my_navigation_bar.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/time_work_fiireplace.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/tittle_fireplace_model_name.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

String _titleModel = 'Модель: Smart Prime 1000';

class SmartPrime1000Page extends StatefulWidget {
  static const String id = '/smartPrime1000Page';

  SmartPrime1000Page({
    Key? key,
  }) : super(key: key);

  @override
  State<SmartPrime1000Page> createState() => _SmartPrime1000PageState();
}

class _SmartPrime1000PageState extends State<SmartPrime1000Page> {
  @override
  Widget build(BuildContext context) {
    /// обернуть чтобы не было перехода назад
    // WillPopScope(
    //       onWillPop: () async => true,
    return Container(
      decoration: myDecorationBackground,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        //чтобы клава не сдвигала контент
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                mySettingAppBar(context: context),
                BodyContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BodyContent extends StatelessWidget {
  const BodyContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Obx(() {
            if (FireplaceConnectionGetXController.instance.isBlocButton.value) {
              //если камин заблокирован
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  myTitleModel(titleModel: _titleModel),
                  const Expanded(
                    child: Center(
                      child: BlockFireplace(),
                    ),
                  ),
                  myNavigationBar(context),
                ],
              );
            } else {
              if (FireplaceConnectionGetXController
                  .instance.isSettingButton.value) {
                //если нажата кнопка настройки
                return const BodySettingPage();
              } else {
                //основной контент
                return MainContent1000Page();
              }
            }
          }),
        ),
      ),
    );
  }
}

class MainContent1000Page extends StatelessWidget {
  const MainContent1000Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        myTitleModel(titleModel: _titleModel),
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: ButtonPlayStopPauseFireplace(),
              ),
            ],
          ),
        ),
        myNavigationBar(context),
      ],
    );
  }
}

class ButtonPlayStopPauseFireplace extends StatelessWidget {
  const ButtonPlayStopPauseFireplace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FireplaceConnectionGetXController>(
      builder: (controllerApp) {
        if (controllerApp.isPlayFireplace == false &&
            !controllerApp.fuelSystemError) {
          //если камин не запущен
          return const NoIsPlayFireplaceBodyScreen();
        } else if (controllerApp.isCoolingFireplace &&
            !controllerApp.fuelSystemError) {
          //если камин в режиме охлаждения
          return Announcement(
            message: 'охлаждение камина',
          );
        } else if (controllerApp.fuelSystemError) {
          //если ОШИБКА
          return Announcement(
            message: 'ОШИБКА: неисправность\nтопливной системы!!!',
            borderColor: myColorActivity,
          );
        } else {
          //если камин запущен
          return const PlayFireplaceBodyScreen();
        }
      },
    );
  }
}

alertAndTimerOnBodyScreen(context, {required String textAlert}) {
  return Column(
    children: [
      MyContainerAlert(
        child: Text(
          textAlert,
          style: myTextStyleFontRoboto(
            fontSize: 24,
            textColor: myTwoColor,
          ),
        ),
      ),
      SizedBox(height: 10),
      timeWorkFireplace(context),
    ],
  );
}

class NoIsPlayFireplaceBodyScreen extends StatelessWidget {
  const NoIsPlayFireplaceBodyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        alertAndTimerOnBodyScreen(context, textAlert: 'камин готов к работе'),
        Align(
          alignment: Alignment.topCenter,
          child: GestureDetector(
            onTap: () {
              //playFireplace
              FireplaceConnectionGetXController.instance.playFireplace();
            },
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: MediaQuery.of(context).size.width / 4,
              child: Image.asset(
                'assets/button_fireplace/play.png',
                fit: BoxFit.cover,
                // scale: 2.7,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class FuelSystemError extends StatelessWidget {
  const FuelSystemError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
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
        alertAndTimerOnBodyScreen(context, textAlert: 'уровень пламени NORM'),
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

class Announcement extends StatelessWidget {
  Announcement({Key? key, this.borderColor, required this.message})
      : super(key: key);
  Color? borderColor;
  String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        MyContainerAlert(
          colorBorder: borderColor ?? Theme.of(context).primaryColor,
          child: Text(
            message,
            style: myTextStyleFontRoboto(
              fontSize: 24,
              textColor: borderColor ?? myTwoColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
