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
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _rowWithTitle(context: context),
                if (!controllerApp.isFireplaceDetectedInDatabase)

                  ///первый экран
                  _searchConnectedFireplaces(context: context)
                else if (controllerApp.isFireplaceDetectedInDatabase)

                  ///если камин подключен напрямую
                  RowWithNameAndTitleFireplace(
                    titleModel: controllerApp.titleModel,
                  )
                else if (controllerApp
                            .mapWithWifiNameHomeNetworkAndNameFromListWifiName !=
                        null &&
                    controllerApp
                        .mapWithWifiNameHomeNetworkAndNameFromListWifiName!
                        .isNotEmpty)

                  ///если камин подключен через точку доступа в сети wifi
                  _listMapWithWifiNameHomeNetworkAndNameFromListWifiName(
                      context: context)
                else
                  Text(
                    'Камин с именем ${controllerApp.wifiName} не распознан',
                    style: Theme.of(context).textTheme.headline2,
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _searchConnectedFireplaces({required BuildContext context}) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FittedBox(
            child: CircularProgressIndicator(
              color: myColorActivity,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Flexible(
            child: Text(
              'Поиск подключенных каминов',
              style: myTextStyleFontRoboto(),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _listMapWithWifiNameHomeNetworkAndNameFromListWifiName(
      {required BuildContext context}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<FireplaceConnectionGetXController>(
          builder: (controllerApp) => ListView.builder(
            shrinkWrap: true,
            primary: false,
            padding: EdgeInsets.zero,
            itemCount: controllerApp
                .mapWithWifiNameHomeNetworkAndNameFromListWifiName!.length,
            itemBuilder: (context, index) {
              // final fireplace = controllerApp
              //     .mapWithWifiNameHomeNetworkAndNameFromListWifiName![index];
              return RowWithNameAndTitleFireplace(
                titleModel: controllerApp.titleModel,
                customName: null,
              );
            },
          ),
        ),
      ),
    );
  }

  _rowWithTitle({required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Модель:',
          style: myTextStyleFontRoboto(),
          textAlign: TextAlign.center,
        ),
        Text(
          'Название',
          style: myTextStyleFontRoboto(),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
