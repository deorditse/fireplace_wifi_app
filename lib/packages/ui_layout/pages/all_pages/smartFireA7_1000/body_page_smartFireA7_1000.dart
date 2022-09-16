import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/all_pages/smartPrime_1000/body_page_smart_prime_1000.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/if_the_fireplace_is_NOT_running_body.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/navigation_bar/my_navigation_bar.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/tittle_fireplace_model_name.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainContentBodySmartFireA71000 extends StatelessWidget {
  MainContentBodySmartFireA71000({Key? key, required this.titleModel})
      : super(key: key);
  String titleModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        myTitleModel(titleModel: titleModel),
        Expanded(
          child: ButtonPlayStopPauseFireplaceSmartFireA71000(),
        ),
        myNavigationBar(context, isRowNavigator: true),
      ],
    );
  }
}

class ButtonPlayStopPauseFireplaceSmartFireA71000 extends StatelessWidget {
  const ButtonPlayStopPauseFireplaceSmartFireA71000({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FireplaceConnectionGetXController>(
      builder: (controllerApp) {
        if (controllerApp.isPlayFireplace == false &&
            !controllerApp.fuelSystemError) {
//если камин не запущен
          return IfTheFireplaceIsNotRunningBody(isIconTimer: true);
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
