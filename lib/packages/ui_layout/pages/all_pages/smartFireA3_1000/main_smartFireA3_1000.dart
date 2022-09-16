import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/all_pages/smartFireA3_1000/body_page_smart_fireA3_1000.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/app_bar/body_block_fireplace/block_fireplace.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/app_bar/body_setting_fireplace/body_setting_page.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/app_bar/myAppBar.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/navigation_bar/my_navigation_bar.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages_for_integration/widgets/tittle_fireplace_model_name.dart';

String _titleModel = 'Модель: Smart Fire A3 1000';

class SmartFireA31000Page extends StatefulWidget {
  static const String id = '/smartFireA31000Page';

  const SmartFireA31000Page({Key? key}) : super(key: key);

  @override
  State<SmartFireA31000Page> createState() => _SmartFireA31000PageState();
}

class _SmartFireA31000PageState extends State<SmartFireA31000Page> {
  @override
  void initState() {
    super.initState();
    // инициирую получение данных именно для этой модели
    // пока что просто буду удалять старые
    print('initState _SmartFireA31000PageState');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate _SmartFireA31000PageState');
    //промежуточное сохранение в память параметров настроек
  }

  @override
  Widget build(BuildContext context) {
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
                const BodyContentSmartFireA31000Page(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BodyContentSmartFireA31000Page extends StatelessWidget {
  const BodyContentSmartFireA31000Page({Key? key}) : super(key: key);

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
                return Column(
                  //если камин заблокирован
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
                  //основной контент body
                  return BodyPageSmartFireA31000Page(titleModel: _titleModel);
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
