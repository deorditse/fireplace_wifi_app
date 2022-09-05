import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/find_device_screen_widget.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/rowWithDomain.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ConnectionToTheFireplacePage extends StatefulWidget {
  static const String id = '/connectionToTheFireplacePage';

  ConnectionToTheFireplacePage({Key? key}) : super(key: key);

  @override
  State<ConnectionToTheFireplacePage> createState() =>
      _ConnectionToTheFireplacePageState();
}

class _ConnectionToTheFireplacePageState
    extends State<ConnectionToTheFireplacePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: myDecorationBackground,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    Expanded(
                      child: Image.asset(
                        'assets/icons/header_logo.png',
                        fit: BoxFit.cover,
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
                  'Подключение к камину:',
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  height: 40,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  // mainAxisSize: MainAxisSize.min,

                  children: [
                    Text(
                      '1. Установите камин согласно инструкции пользователя.',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '2. Подключение к камину',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '3. Включите сканирование доступных устройств.',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '4. Выберите ваше устройство.',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 40,
                ),

                ///delete
                Text(
                  'имитация получения SSID, для теста номера от 1 до 4',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 120.0,
                  ),
                  child: _myTextField(),
                ),
                SizedBox(
                  height: 20,
                ),

                ///
                FindDeviceScreenWidget(),
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

TextField _myTextField() {
  final textController = TextEditingController();
  return TextField(
    controller: textController,
    onSubmitted: (SsidWifi) {
      FireplaceConnectionGetXController.instance
          .searchFireplaceInlistWithIdWifi(wifiBSSID: SsidWifi);
      String? namePage = FireplaceConnectionGetXController.instance.namePage;
      namePage != null ? Get.toNamed(namePage, preventDuplicates: false) : null;
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
    // obscureText: false,

    //
    // keyboardType: TextInputType.number,
    // inputFormatters: <TextInputFormatter>[
    //   FilteringTextInputFormatter.singleLineFormatter,
    // ],
    // obscureText: true,
    // obscuringCharacter: '*',

    cursorColor: myColorActivity,
  );
}
