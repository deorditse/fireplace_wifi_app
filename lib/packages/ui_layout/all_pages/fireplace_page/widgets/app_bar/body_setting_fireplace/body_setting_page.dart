import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/widgets_for_all_pages/rowWithDomain.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BodySettingPage extends StatelessWidget {
  const BodySettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: _closeFirepca(),
          ),
          Flexible(
            flex: 2,
            child: _aboutDevice(),
          ),
          myDivider(),
          Flexible(
            child: _setVolume(),
          ),
          myDivider(),
          Flexible(
            child: _instructionUser(),
          ),
          myDivider(),
          Flexible(
            child: _serviceCenter(),
          ),
          myDivider(),
          Expanded(
            child: SizedBox(),
          ),
          rowWithDomain(context: context),
        ],
      ),
    );
  }

  _closeFirepca() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/icons/closeFireplace.svg',
          semanticsLabel: 'icon_bottom',
          fit: BoxFit.contain,
        ),
        SizedBox(
          width: 14,
        ),
        Expanded(
          child: Text(
            'Отключение от камина',
            style: myTextStyleFontRoboto(
              fontSize: 16,
              textColor: myColorActivity,
            ),
          ),
        ),
      ],
    );
  }

  _aboutDevice() {
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
        Text.rich(
          TextSpan(
            style: myTextStyleFontRoboto(fontSize: 14),
            children: [
              TextSpan(
                text: 'Страна производства: ',
                style: myTextStyleFontRoboto(textColor: myTwoColor),
              ),
              TextSpan(
                text: 'Россия',
                style: myTextStyleFontRoboto(),
              ),
            ],
          ),
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
                text: 'Smart Fire A3 1000',
                style: myTextStyleFontRoboto(),
              ),
            ],
          ),
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
                text: '000000',
                style: myTextStyleFontRoboto(),
              ),
            ],
          ),
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
                text: 'ЕАЭС N RU Д-CN.РА03.В.93459/22',
                style: myTextStyleFontRoboto(),
              ),
            ],
          ),
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
                text: '21.08.2022 г.',
                style: myTextStyleFontRoboto(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _setVolume() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Настройки звука:',
          style: myTextStyleFontRoboto(
            fontSize: 16,
            // textColor: myColorActivity,
          ),
        ),
        Row(
          children: [
            GetBuilder<FireplaceConnectionGetXController>(
                builder: (controllerApp) => Switch(
                    value: controllerApp.isButtonClickSound,
                    onChanged: (value) {
                      controllerApp.changeSwitchButtonClickSound();
                    })),
            Text(
              'Звук нажатия кнопок',
              style: myTextStyleFontRoboto(textColor: myTwoColor),
            ),
          ],
        ),
      ],
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

  _serviceCenter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Контакты сервисного центра:',
          style: myTextStyleFontRoboto(),
        ),
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
