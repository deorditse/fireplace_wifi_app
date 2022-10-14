import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';

myTitleModel() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Text(
      FireplaceConnectionGetXController.instance.titleModel,
      style: myTextStyleFontRoboto(fontSize: 14),
    ),
  );
}
