import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';

myTitleModel({required String titleModel}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Text(
      titleModel,
      style: myTextStyleFontRoboto(fontSize: 14),
    ),
  );
}
