import 'package:business_layout/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/fireplace_pages/fireplace_page.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/fireplace_pages/widgets/container_alert.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/text_field_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../style_app/style.dart';

class TextFieldsAddedToTheNetworkWidgets extends StatefulWidget {
  const TextFieldsAddedToTheNetworkWidgets({super.key});

  @override
  State<TextFieldsAddedToTheNetworkWidgets> createState() =>
      _TextFieldsAddedToTheNetworkWidgetsState();
}

class _TextFieldsAddedToTheNetworkWidgetsState
    extends State<TextFieldsAddedToTheNetworkWidgets> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isSuccess = false;

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  void _handleSubmit() async {
    setState(() {
      _isSuccess = false;
    });
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSuccess = true;
      });

      FireplaceConnectionGetXController.instance.addHomeLocalNetworksData(
        customName: _nameController.text,
        nameHomeWifiNetwork: _nameController.text,
        nameFromListListWifiName:
            FireplaceConnectionGetXController.instance.wifiName,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text(
                      'Имя сети:',
                      style: myTextStyleFontRoboto(fontSize: 18),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                SizedBox(width: mySizedHeightBetweenAlert),
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    cursorColor: myColorActivity,
                    controller: _nameController,
                    key: Key('fieldWiFiName'),
                    //for testing
                    decoration: myStyleTextField(
                      context,
                      // labelText: 'Имя...',
                      // hintText: 'Ввод имени',
                    ),
                    validator: (value) {
                      if (value == '') return 'Введите имя WiFi';
                      return null;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: mySizedHeightBetweenAlert * 2),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text(
                      'Пароль:',
                      style: myTextStyleFontRoboto(fontSize: 18),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                SizedBox(width: mySizedHeightBetweenAlert),
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    cursorColor: myColorActivity,
                    controller: _passwordController,
                    key: const Key('fieldPassword'),
                    validator: (value) {
                      if (value == '') return 'Введите пароль';
                      if (value!.split('').length < 8 ||
                          value.split('').length > 20)
                        return 'Некорректный пароль';
                      return null;
                    },
                    decoration: myStyleTextField(
                      context,
                      // labelText: 'пароль',
                      // hintText: '*****',
                      // helperText: 'Поле для поиска заметок',
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    // obscuringCharacter: '*',
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.singleLineFormatter,
                    ],
                    obscureText: true,
                  ),
                ),
              ],
            ),
            SizedBox(height: mySizedHeightBetweenAlert * 2),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Сохранить:',
                    style: myTextStyleFontRoboto(fontSize: 18),
                    textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(width: mySizedHeightBetweenAlert),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      SizedBox(
                        width: Get.width / 6,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(myTwoColor),
                          ),
                          onPressed: _handleSubmit,
                          child: SvgPicture.asset(
                            'assets/icons/check.svg',
                            semanticsLabel: 'check',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (_isSuccess)
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: _fireplaceAddedToTheNetwork(),
              ),
          ],
        ),
      ),
    );
  }

  _fireplaceAddedToTheNetwork() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: MyContainerAlert(
        height: MediaQuery.of(context).size.height / 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Камин добавлен в сеть,\n\nвыйдите из приложения,\n\nподключителсь к домашней сети\n\nи зайдите в приложение заново.',
            style: myTextStyleFontRoboto(
              fontSize: 18,
              textColor: myTwoColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
