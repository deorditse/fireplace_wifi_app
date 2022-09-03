import 'package:fire_ble_app/packages/business_layout/lib/business_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

Widget mySettingAppBar({context}) {
  FireplaceConnectionGetXController _controllerFireplace =
      FireplaceConnectionGetXController.instance;
  return Container(
    height: MediaQuery.of(context).size.height / 10,
    child: Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: Obx(
            () => GestureDetector(
              onTap: () {
                _controllerFireplace.isSettingButton.value = false;
                _controllerFireplace.isBlocButton.value = true;
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0, right: 8),
                child: Image.asset(
                  _controllerFireplace.isBlocButton.value
                      ? 'assets/icons/blocs_2.png'
                      : 'assets/icons/blocs.png',
                  fit: BoxFit.contain,
                  // width: 50,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Image.asset(
            'assets/icons/header_logo.png',
            width: MediaQuery.of(context).size.width / 4,
            fit: BoxFit.contain,
          ),
        ),
        Expanded(
          flex: 1,
          child: Obx(
            () => GestureDetector(
              onTap: () {
                if (!_controllerFireplace.isBlocButton.value) {
                  _controllerFireplace.isSettingButton.value =
                      !_controllerFireplace.isSettingButton.value;
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0, left: 8),
                child: Image.asset(
                  _controllerFireplace.isSettingButton.value
                      ? 'assets/icons/setting_2.png'
                      : 'assets/icons/setting.png',
                  fit: BoxFit.contain,
                  // width: 50,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
