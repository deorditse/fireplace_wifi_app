import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ServiceCenterContacts extends StatelessWidget {
  const ServiceCenterContacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Контакты сервисного центра:',
          style: myTextStyleFontRoboto(),
        ),
        SizedBox(height: mySizedHeightBetweenAlert),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/icons/mail.svg',
              semanticsLabel: 'header_logo',
              fit: BoxFit.contain,
            ),
            SizedBox(width: 10),
            Text(
              'info@abc-fireplace.com',
              style: myTextStyleFontRoboto(),
            ),
          ],
        ),
        SizedBox(height: mySizedHeightBetweenAlert/2),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/icons/phone.svg',
              semanticsLabel: 'icon_bottom',
              fit: BoxFit.contain,
            ),
            SizedBox(width: 10),
            Text(
              '+7 999 98-98-001',
              style: myTextStyleFontRoboto(),
            ),
          ],
        ),
      ],
    );
  }
}
