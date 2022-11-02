import 'package:business_layout/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/fireplace_pages/widgets/container_alert.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/fireplace_pages/widgets/timer_work_fireplace.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BodyBlockFireplace extends StatelessWidget {
  static const String id = '/bodyBlockFireplace';

  BodyBlockFireplace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Column(
          children: [
            _blockFirePlace(context),
            SizedBox(height: mySizedHeightBetweenAlert),
            timeWorkFireplace(context),
            SizedBox(height: 20),
            Expanded(child: _textField(context)),
          ],
        ),
      ),
    );
  }

  Widget _blockFirePlace(context) {
    return MyContainerAlert(
      borderColor: myColorActivity,
      child: Text(
        'камин заблокирован',
        style: myTextStyleFontRoboto(fontSize: 24, textColor: myColorActivity),
      ),
    );
  }
}

Widget _textField(context) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          'введите пароль',
          style: myTextStyleFontRoboto(
            fontSize: 24,
            textColor: myTwoColor,
          ),
        ),
      ),
      Expanded(
        child: Column(
          children: [
            SizedBox(
              // height: 40,
              width: MediaQuery.of(context).size.width / 2.5,
              child: _myTextField(),
            ),
            SizedBox(
              height: 20,
            ),
            Flexible(
              child: SvgPicture.asset(
                'assets/icons/mainBlock.svg',
                semanticsLabel: 'icon_bottom',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

TextField _myTextField() {
  final textController = FireplaceConnectionGetXController.instance;
  return TextField(
    maxLength: 4,
    controller: textController.textFieldPassword,
    onChanged: (password) {
      if (password == textController.fireplaceData!.passwordBlock.toString()) {
        FireplaceConnectionGetXController.instance
            .changeIsBlocButton(newIsBlocButton: false);
        textController.textFieldPassword.clear();
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
    // keyboardType: TextInputType.number,
    keyboardType: TextInputType.visiblePassword,
    inputFormatters: <TextInputFormatter>[
      FilteringTextInputFormatter.singleLineFormatter,
    ],
    obscureText: true,

    //
    // keyboardType: TextInputType.number,
    // inputFormatters: <TextInputFormatter>[
    //   FilteringTextInputFormatter.singleLineFormatter,
    // ],
    // obscureText: true,
    obscuringCharacter: '*',

    cursorColor: myColorActivity,
  );
}
