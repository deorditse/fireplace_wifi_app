import 'package:fireplace_wifi_app/packages/ui_layout/pages/all_pages/smartFireA7_1000/body_page_smartFireA7_1000.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/app_bar/myAppBar.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';
import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/all_pages/smartPrime_1000/body_page_smart_prime_1000.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/app_bar/body_block_fireplace/block_fireplace.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/app_bar/body_setting_fireplace/body_setting_page.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/navigation_bar/my_navigation_bar.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/tittle_fireplace_model_name.dart';
import 'package:get/get.dart';

String _titleModel = 'Модель: Smart Fire A7 1000';

class SmartFireA71000Page extends StatefulWidget {
  static const String id = '/smartFireA71000Page';

  const SmartFireA71000Page({Key? key}) : super(key: key);

  @override
  State<SmartFireA71000Page> createState() => _SmartFireA71000PageState();
}

class _SmartFireA71000PageState extends State<SmartFireA71000Page> {
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
                BodyPageSmartFireA71000(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BodyPageSmartFireA71000 extends StatelessWidget {
  BodyPageSmartFireA71000({Key? key}) : super(key: key);

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
                return MainContentBodySmartFireA71000(titleModel: _titleModel);
              }
            }
          }),
        ),
      ),
    );
  }
}
