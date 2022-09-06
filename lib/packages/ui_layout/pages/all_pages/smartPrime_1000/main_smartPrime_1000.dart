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
        if (controllerApp.isPlayFireplace == false) {
          return noIsPlayFireplaceBodyScreen(context);
        } else {
          return playFireplaceBodyScreen(context);
        }
      },
    );
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
        SizedBox(
          height: 10,
        ),
        timeWorkFireplace(context),
      ],
    );
  }

  Column noIsPlayFireplaceBodyScreen(context) {
    return Column(
      children: [
        alertAndTimerOnBodyScreen(context, textAlert: 'камин готов к работе'),
        Align(
          alignment: Alignment.topCenter,
          child: GestureDetector(
            onTap: () {
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

  Column playFireplaceBodyScreen(context) {
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
                  FireplaceConnectionGetXController.instance.stopFireplace();
                },
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: MediaQuery.of(context).size.width / 8,
                  child: Image.asset(
                    'assets/button_fireplace/norm.png',
                    fit: BoxFit.none,
                    scale: 2.7,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  FireplaceConnectionGetXController.instance.stopFireplace();
                },
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: MediaQuery.of(context).size.width / 8,
                  child: Image.asset(
                    'assets/button_fireplace/eco.png',
                    fit: BoxFit.none,
                    scale: 2.7,
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
