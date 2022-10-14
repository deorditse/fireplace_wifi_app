import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/fireplace_page/widgets/app_bar/app_bar_fireplace.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/fireplace_page/widgets/app_bar/body_block_fireplace/block_fireplace.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/fireplace_page/widgets/app_bar/body_setting_fireplace/body_setting_page.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/fireplace_page/widgets/bottom_row_with_parameters/my_navigation_bar.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/fireplace_page/widgets/tittle_fireplace_model_name.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/all_pages/smartFireA3_1000/body_page_smartFireA3_1000.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                appBarFireplace(context: context),
                BodyPageSmartFireA31000(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BodyPageSmartFireA31000 extends StatelessWidget {
  BodyPageSmartFireA31000({Key? key}) : super(key: key);

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
                    myTitleModel(),
                    Expanded(
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
                  return MainContentBodySmartFireA31000(
                      titleModel: _titleModel);
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
