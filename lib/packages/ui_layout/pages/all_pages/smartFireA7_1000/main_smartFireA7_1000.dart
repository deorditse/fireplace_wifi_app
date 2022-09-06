import 'package:fireplace_wifi_app/packages/ui_layout/pages/all_pages/smartPrime_1000/main_smartPrime_1000.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/app_bar/myAppBar.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';

class SmartFireA71000Page extends StatefulWidget {
  static const String id = '/smartFireA71000Page';

  const SmartFireA71000Page({Key? key}) : super(key: key);

  @override
  State<SmartFireA71000Page> createState() => _SmartFireA71000PageState();
}

class _SmartFireA71000PageState extends State<SmartFireA71000Page> {
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
                Text('smartFireA71000Page'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TestFire extends SmartPrime1000Page{
  TestFire({super.key});
}