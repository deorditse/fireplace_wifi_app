import 'package:fire_ble_app/packages/ui_layout/pages/pages_for_integration/style_page.dart';
import 'package:flutter/material.dart';

scanBleSwitchFalse({required context}) {
  return Container(
    decoration: decorationListBle(),
    // height: MediaQuery.of(context).size.width / 2,
    child: Center(
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.toggle_on_outlined,
            size: MediaQuery.of(context).size.width / 5,
            color: Colors.white54,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Активируйте сканирование устройств',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ],
      ),
    ),
  );
}
