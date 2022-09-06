import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/app_bar/myAppBar.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';

class SmartFireA31000Page extends StatefulWidget {
  static const String id = '/smartFireA31000Page';

  const SmartFireA31000Page({Key? key}) : super(key: key);

  @override
  State<SmartFireA31000Page> createState() => _SmartFireA31000PageState();
}

class _SmartFireA31000PageState extends State<SmartFireA31000Page> {
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
                const Text('smartFireA31000Page'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
