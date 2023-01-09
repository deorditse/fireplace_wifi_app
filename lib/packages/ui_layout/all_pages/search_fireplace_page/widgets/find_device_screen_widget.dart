import 'package:business_layout/business_layout.dart';
import 'package:models/models.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/fireplace_pages/fireplace_page.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/fireplace_pages/widgets/container_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
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
                if (controllerApp.isFireplaceDetectedInDatabase == null)
                  _searchConnectedFireplaces(context: context)
                else

                  ///первый экран
                  controllerApp.isFireplaceDetectedInDatabase!
                      ? Expanded(
                          child: Column(
                            children: [
                              ///если камин подключен через точку доступа (save in local storage) в сети wifi
                              if (controllerApp.homeLocalNetworksData?.values !=
                                      null &&
                                  controllerApp
                                      .homeLocalNetworksData!.isNotEmpty)
                                Expanded(
                                  child:
                                      _listMapWithWifiNameHomeNetworkAndNameFromListWifiName(
                                    context: context,
                                  ),
                                )
                              else

                                ///если камин подключен напрямую
                                RowWithNameAndTitleFireplace(
                                  titleModel: controllerApp.titleModel,
                                  voidCallback: () {
                                    Get.toNamed(
                                      FireplacePage.id,
                                      preventDuplicates: false,
                                    );

                                    print(
                                        "${controllerApp.homeLocalNetworksData?.values.toList()}");
                                  },
                                ),
                            ],
                          ),
                        )
                      : Container(
                          child: Text(
                            "Камины не найдены, посмотрите интсрукцию подключения",
                            style: myTextStyleFontRoboto(),
                          ),
                        )
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GetBuilder<FireplaceConnectionGetXController>(
        builder: (controllerApp) {
          Box<HomeNetworkModel> boxHomeNetworkModel =
              controllerApp.homeLocalNetworksData!;
          return ListView.builder(
            shrinkWrap: true,
            primary: false,
            padding: EdgeInsets.zero,
            itemCount: boxHomeNetworkModel.values.length,
            itemBuilder: (context, index) {
              // final fireplace = controllerApp
              //     .mapWithWifiNameHomeNetworkAndNameFromListWifiName![index];
              return RowWithNameAndTitleFireplace(
                titleModel: controllerApp.titleModel,
                customName: null,
                isHomelWifi: true,
                voidCallback: () {
                  String fireplaceDataNameFromListListWifiName = controllerApp
                      .homeLocalNetworksData!.values
                      .toList()[index]
                      .nameFromListListWifiName
                      .toString();
                  print(fireplaceDataNameFromListListWifiName);

                  controllerApp.searchFireplaceInListWithIdWifi(
                    wifiName: fireplaceDataNameFromListListWifiName,
                  );
                },
              );
            },
          );
        },
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
