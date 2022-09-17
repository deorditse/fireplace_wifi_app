import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/alert_with_message_and_timer_on_body_screen.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BlockFireplace extends StatelessWidget {
  const BlockFireplace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Column(
          children: [
            _blockFirePlace(context),
            SizedBox(height: mySizedHeigtBetweenAlert),
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
      child: Text('камин заблокирован',
          style: myTextStyleFontRoboto(
            fontSize: 24,
            textColor: myColorActivity,
          )),
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
              child: Image.asset(
                'assets/icons/mainBlock.png',
                fit: BoxFit.cover,
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
      if (password == textController.passwordBlock.toString()) {
        FireplaceConnectionGetXController.instance.isBlocButton.value = false;
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
