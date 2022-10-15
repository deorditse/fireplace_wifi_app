import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/fireplace_pages/fireplace_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../style_app/style.dart';

class FindDeviceScreenWidget extends StatelessWidget {
  const FindDeviceScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: MediaQuery.of(context).size.width / 2.5,
      width: MediaQuery.of(context).size.width,
      child: MyContainerAlert(
        child: GetBuilder<FireplaceConnectionGetXController>(
            builder: (controllerApp) {
          if (controllerApp.isLoadingDataIdWifi) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FittedBox(
                  child: CircularProgressIndicator(
                    color: myColorActivity,
                  ),
                ),
                Flexible(
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
              return GestureDetector(
                onTap: () {
                  try {
                    Get.toNamed(FireplacePage.id,
                        preventDuplicates: false);
                  } catch (error) {
                    print(error);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${controllerApp.wifiName}',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headline2,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: FittedBox(
                          child: Text(
                            'подключено',
                            style:
                                Theme.of(context).textTheme.headline2!.copyWith(
                                      color: myColorActivity,
                                    ),
                          ),
                        ),
                      ),
                      FittedBox(
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: myColorActivity,
                        ),
                      ),
                    ],
                  ),
                ),
              );
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
