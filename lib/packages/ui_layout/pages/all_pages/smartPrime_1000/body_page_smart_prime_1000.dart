import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/all_pages/smartPrime_1000/widgets/body_screen_with_three_button_smartPrime1000.dart';
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
          return StartBodyScreenFireplaceSmartPrime1000(
            alertMessage: 'уровень пламени NORM',
          );
        }
      },
    );
  }
}
