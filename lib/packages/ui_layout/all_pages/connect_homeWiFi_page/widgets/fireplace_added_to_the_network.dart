import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/fireplace_pages/fireplace_page.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/fireplace_pages/widgets/container_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../style_app/style.dart';

class FireplaceAddedToTheNetwork extends StatelessWidget {
  const FireplaceAddedToTheNetwork({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: MyContainerAlert(
        height: MediaQuery.of(context).size.height / 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Камин добавлен в сеть,\n\nвыйдите из приложения,\n\nподключителсь к домашней сети\n\nи зайдите в приложение заново.',
            style: myTextStyleFontRoboto(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
