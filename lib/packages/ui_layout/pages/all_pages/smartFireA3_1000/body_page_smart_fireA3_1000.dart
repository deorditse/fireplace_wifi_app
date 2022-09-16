import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/alert_with_message_and_timer_on_body_screen.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/navigation_bar/my_navigation_bar.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/tittle_fireplace_model_name.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyPageSmartFireA31000Page extends StatelessWidget {
  BodyPageSmartFireA31000Page({Key? key, required this.titleModel})
      : super(key: key);
  String titleModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //модель камина
        myTitleModel(titleModel: titleModel),
        //всплывающие окна и кнопка start stop
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Container(),
              ),
            ],
          ),
        ),
        myNavigationBar(context),
      ],
    );
  }
}
