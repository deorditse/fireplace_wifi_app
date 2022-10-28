import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/fireplace_pages/fireplace_page.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/fireplace_pages/widgets/container_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../style_app/style.dart';
import 'row_with_name_and_title_fireplace.dart';

class FindDeviceScreenWidget extends StatelessWidget {
  const FindDeviceScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: MyContainerAlert(
        height: MediaQuery.of(context).size.height / 3.5,
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
                    'Подключение к камину ${controllerApp.titleModel}',
                    style: Theme.of(context).textTheme.headline2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            );
          } else {
            if (controllerApp.isFireplaceDetectedInDatabase) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    _rowWithTitle(context: context),
                    SizedBox(height: mySizedHeightBetweenAlert),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        padding: EdgeInsets.zero,
                        itemCount: 15,
                        itemBuilder: (context, index) {
                          return TextButton(
                            style: ButtonStyle(
                                padding:
                                    MaterialStateProperty.all(EdgeInsets.zero)),
                            child: RowWithNameAndTitleFireplace(),
                            onPressed: () {
                              Get.toNamed(FireplacePage.id,
                                  preventDuplicates: false);
                            },
                          );
                        },
                      ),
                    ),
                  ],
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

  _rowWithTitle({required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Модель:',
          style: Theme.of(context).textTheme.headline2,
          textAlign: TextAlign.center,
        ),
        Text(
          'Название',
          style: Theme.of(context).textTheme.headline2,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
