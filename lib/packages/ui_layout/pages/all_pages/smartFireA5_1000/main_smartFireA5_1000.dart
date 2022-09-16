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

String _titleModel = 'Модель: Smart Fire A5 1000';

class SmartFireA51000Page extends StatefulWidget {
  static const String id = '/smartFireA51000Page';

  const SmartFireA51000Page({Key? key}) : super(key: key);

  @override
  State<SmartFireA51000Page> createState() => _SmartFireA51000PageState();
}

class _SmartFireA51000PageState extends State<SmartFireA51000Page> {
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
                BodyContentSmartFireA51000Page(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BodyContentSmartFireA51000Page extends StatelessWidget {
  BodyContentSmartFireA51000Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Obx(
            () {
              if (FireplaceConnectionGetXController
                  .instance.isBlocButton.value) {
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
                  return BodyPageSmartPrime1000Page(titleModel: _titleModel);
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
