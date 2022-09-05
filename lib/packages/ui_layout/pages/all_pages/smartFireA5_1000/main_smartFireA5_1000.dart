import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/app_bar/myAppBar.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';

class SmartFireA51000Page extends StatefulWidget {
  static const String id = '/smartFireA51000Page';

  const SmartFireA51000Page({Key? key}) : super(key: key);

  @override
  State<SmartFireA51000Page> createState() => _SmartFireA51000PageState();
}

class _SmartFireA51000PageState extends State<SmartFireA51000Page> {
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
                Text('smartFireA51000Page'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}