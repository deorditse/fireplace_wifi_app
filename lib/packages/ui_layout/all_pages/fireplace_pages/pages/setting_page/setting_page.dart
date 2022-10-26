import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/fireplace_pages/pages/setting_page/widgets/service_center_contacts.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/search_fireplace_page/search_fireplace_page.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/widgets_for_all_pages/rowWithDomain.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'widgets/about_device.dart';
import 'widgets/set_volume.dart';

class BodySettingPage extends StatelessWidget {
  static const String id = '/bodySettingPage';

  const BodySettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: mySizedHeightBetweenAlert),
          _toTheListOfFireplaces(),
          myDivider(),
          SizedBox(height: mySizedHeightBetweenAlert),
          AboutDeviceWidget(),
          SizedBox(height: mySizedHeightBetweenAlert),
          myDivider(),
          SizedBox(height: mySizedHeightBetweenAlert),

          ///подключение опций тут
          SetVolumeWidget(),
          SizedBox(height: mySizedHeightBetweenAlert),
          myDivider(),
          SizedBox(height: mySizedHeightBetweenAlert),
          _instructionUser(),
          SizedBox(height: mySizedHeightBetweenAlert),
          myDivider(),
          SizedBox(height: mySizedHeightBetweenAlert),
          ServiceCenterContacts(),
          SizedBox(height: mySizedHeightBetweenAlert),
          myDivider(),
          Expanded(
            child: SizedBox(),
          ),
          SizedBox(height: mySizedHeightBetweenAlert),
          rowWithDomain(context: context),
        ],
      ),
    );
  }

  Widget _toTheListOfFireplaces() {
    return TextButton(
      onPressed: () {
        Get.offNamed(SearchFireplacePage.id);
      },
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.end,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'К списку каминов',
            style: myTextStyleFontRoboto(
              fontSize: 16,
              // textColor: myColorActivity,
            ),
          ),
          SizedBox(width: 14),
          SvgPicture.asset(
            'assets/icons/closeFireplace.svg',
            semanticsLabel: 'icon_bottom',
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }

  _instructionUser() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Инструкция пользователя:',
          style: myTextStyleFontRoboto(),
        ),
        SizedBox(height: mySizedHeightBetweenAlert / 2),
        Text(
          'Ссылка на инструкцию',
          style: myTextStyleFontRoboto(textColor: myTwoColor),
        ),
      ],
    );
  }

  myDivider() {
    return Divider(
      color: myTwoColor,
      height: 2,
      thickness: 1,
    );
  }
}
