import 'package:business_layout/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

class AboutDeviceWidget extends StatelessWidget {
  const AboutDeviceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FireplaceDataModel? controllerApp =
        FireplaceConnectionGetXController.instance.fireplaceData;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Об устройстве:',
          style: myTextStyleFontRoboto(
            fontSize: 16,
            // textColor: myColorActivity,
          ),
        ),
        SizedBox(
          height: mySizedHeightBetweenAlert,
        ),
        Text.rich(
          TextSpan(
            style: myTextStyleFontRoboto(fontSize: 14),
            children: [
              TextSpan(
                text: 'Страна производства:',
                style: myTextStyleFontRoboto(textColor: myTwoColor),
              ),
              TextSpan(
                text: 'Россия', //не меняется для всех каминов
                style: myTextStyleFontRoboto(),
              ),
            ],
          ),
        ),
        SizedBox(
          height: mySizedHeightBetweenAlert / 2,
        ),
        Text.rich(
          TextSpan(
            style: TextStyle(fontSize: 16),
            children: [
              TextSpan(
                text: 'Модель: ',
                style: myTextStyleFontRoboto(textColor: myTwoColor),
              ),
              TextSpan(
                text: FireplaceConnectionGetXController.instance.titleModel,
                style: myTextStyleFontRoboto(),
              ),
            ],
          ),
        ),
        SizedBox(
          height: mySizedHeightBetweenAlert / 2,
        ),
        Text.rich(
          TextSpan(
            style: TextStyle(fontSize: 16),
            children: [
              TextSpan(
                text: 'Серийный номер: ',
                style: myTextStyleFontRoboto(textColor: myTwoColor),
              ),
              TextSpan(
                text: controllerApp?.serialNumber ?? '...',
                style: myTextStyleFontRoboto(),
              ),
            ],
          ),
        ),
        SizedBox(
          height: mySizedHeightBetweenAlert / 2,
        ),
        Text.rich(
          TextSpan(
            style: TextStyle(fontSize: 16),
            children: [
              TextSpan(
                text: 'ДC: ',
                style: myTextStyleFontRoboto(textColor: myTwoColor),
              ),
              TextSpan(
                text: controllerApp?.dcCode ?? '...',
                style: myTextStyleFontRoboto(),
              ),
            ],
          ),
        ),
        SizedBox(
          height: mySizedHeightBetweenAlert / 2,
        ),
        Text.rich(
          TextSpan(
            style: TextStyle(fontSize: 16),
            children: [
              TextSpan(
                text: 'Дата производства: ',
                style: myTextStyleFontRoboto(textColor: myTwoColor),
              ),
              TextSpan(
                text: controllerApp?.dateOfManufacture ?? '...',
                style: myTextStyleFontRoboto(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
