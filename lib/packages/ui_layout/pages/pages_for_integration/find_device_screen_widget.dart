import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../style_app/style.dart';

class FindDeviceScreenWidget extends StatelessWidget {
  const FindDeviceScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 2,
      width: MediaQuery.of(context).size.width,
      child: MyContainerAlert(
        child: GetBuilder<FireplaceConnectionGetXController>(
            builder: (controllerApp) {
          if (controllerApp.isLoadingDataIdWifi) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: myColorActivity,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 18.0, left: 8, right: 8, bottom: 8),
                  child: Text(
                    'Подключение к камину ${controllerApp.wifiName}',
                    style: Theme.of(context).textTheme.headline2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            );
          } else {
            if (controllerApp.isFireplaceDetectedInDatabase) {
              return Text('подключено');
            } else {
              return Text(
                'Камин ${controllerApp.wifiName} не распознан',
                style: Theme.of(context).textTheme.headline2,
              );
            }
          }
        }),
      ),
    );
  }
}
