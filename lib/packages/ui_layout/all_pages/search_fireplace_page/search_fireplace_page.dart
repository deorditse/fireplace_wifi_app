import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/fireplace_pages/fireplace_page.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../widgets_for_all_pages/rowWithDomain.dart';
import 'widgets/find_device_screen_widget.dart';

class SearchFireplacePage extends StatelessWidget {
  static const String id = '/searchFireplacePage';

  SearchFireplacePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: myDecorationBackground,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    Expanded(
                      child: SvgPicture.asset(
                        'assets/icons/header_logo.svg',
                        semanticsLabel: 'header_logo',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Список доступных каминов:',
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  height: 20,
                ),
                FindDeviceScreenWidget(),

                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 40,
                ),

                ///delete after testing
                Text(
                  'TEST TEST имитация получения WIFI NAME, для теста номера от 1 до 4',
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 120.0,
                  ),
                  child: _myTextField(),
                ),
                ElevatedButton(
                    onPressed: () {
                      print(FireplaceConnectionGetXController
                          .instance.fireplaceData);
                    },
                    child: Text('test')),

                Expanded(child: SizedBox()),
                rowWithDomain(context: context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

///delete after testing
TextField _myTextField() {
  final textController = TextEditingController();
  return TextField(
    controller: textController,
    onSubmitted: (wifiName) {
      FireplaceConnectionGetXController.instance
          .searchFireplaceInListWithIdWifi(
        wifiName: wifiName,
      );
      try {
        FireplaceConnectionGetXController.instance.isFireplaceDetectedInDatabase
            ? Get.toNamed(FireplacePage.id, preventDuplicates: false)
            : null;
      } catch (error) {
        print(error);
      }
    },
    textAlign: TextAlign.center,
    style: myTextStyleFontRoboto(textColor: myColorActivity, fontSize: 24),
    decoration: InputDecoration(
      focusColor: myColorActivity,
      hoverColor: myColorActivity,
      filled: true,
      fillColor: myTwoColor,
      border: UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
    ),
    keyboardType: TextInputType.visiblePassword,
    inputFormatters: <TextInputFormatter>[
      FilteringTextInputFormatter.singleLineFormatter,
    ],
    cursorColor: myColorActivity,
  );
}
