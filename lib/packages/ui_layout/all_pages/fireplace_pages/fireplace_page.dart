import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/fireplace_pages/body_fireplace_page.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';
import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:get/get.dart';
import 'pages/block_page/block_page.dart';
import 'pages/setting_page/setting_page.dart';
import 'widgets/app_bar/app_bar_fireplace.dart';
import 'widgets/bottom_row_with_parameters/bottom_row_with_parameters.dart';
import 'widgets/tittle_fireplace_model_name.dart';

class FireplacePage extends StatefulWidget {
  static const String id = '/fireplacePage';

  const FireplacePage({Key? key}) : super(key: key);

  @override
  State<FireplacePage> createState() => _FireplacePageState();
}

class _FireplacePageState extends State<FireplacePage> {
  @override
  Widget build(BuildContext context) {
    /// обернуть чтобы не было перехода назад
    // WillPopScope(
    //       onWillPop: () async => true,
    return Container(
      //чтобы сделать фон в градиент
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
                  myTitleModel(),
                  Expanded(
                    child: Center(
                      child: BodyBlockFireplace(),
                    ),
                  ),
                  bottomRowWithParameters(context),
                ],
              );
            } else {
              if (FireplaceConnectionGetXController
                  .instance.isSettingButton.value) {
                //если нажата кнопка настройки
                return const BodySettingPage();
              } else {
                //основной контент
                return BodyFireplacePage();
              }
            }
          }),
        ),
      ),
    );
  }
}
