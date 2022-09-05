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
    return Scaffold(
      body: Container(
        decoration: myDecorationBackground,
        child: Text('smartFireA71000Page'),
      ),
    );
  }
}
