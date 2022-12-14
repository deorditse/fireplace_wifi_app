import 'package:business_layout/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/fireplace_pages/widgets/container_alert.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'start_body_screen.dart';

class MainBodyStateFireplace extends StatelessWidget {
  const MainBodyStateFireplace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FireplaceConnectionGetXController>(
      builder: (controllerApp) {
        String alertMessage = controllerApp.alertMessage;

        if (controllerApp.isFuelSystemError) {
//если ОШИБКА камина
          //прописать логику ошибки
          return MyContainerAlert(
            borderColor: myColorActivity,
            message: 'ОШИБКА: неисправность\nтопливной системы!!!',
          );
        } else {
//если камин не запущен и хотим запустить
          return StartBodyScreenFireplace();
        }
      },
    );
  }
}
