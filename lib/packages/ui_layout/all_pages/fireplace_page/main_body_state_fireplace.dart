import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'start_body_screen.dart';

class MainBodyStateFireplace extends StatelessWidget {
  const MainBodyStateFireplace(
      {Key? key, required this.alertMessage, this.isIconTimer})
      : super(key: key);
  final String alertMessage;
  final bool? isIconTimer;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FireplaceConnectionGetXController>(
      builder: (controllerApp) {
        if (controllerApp.isCoolingFireplace &&
            !controllerApp.isFuelSystemError) {
//если камин в режиме охлаждения - можно конечно просто менять сообщение на экране
          return MyContainerAlert(
            message: 'охлаждение камина',
          );
        } else if (controllerApp.isFuelSystemError) {
//если ОШИБКА
          //прописать логику ошибки
          return MyContainerAlert(
            borderColor: myColorActivity,
            message: 'ОШИБКА: неисправность\nтопливной системы!!!',
          );
        } else {
          //если камин не запущен и хотим запустить
          return StartBodyScreenFireplace(
            alertMessage: alertMessage,
          );
        }
      },
    );
  }
}
