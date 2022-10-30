import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/search_fireplace_page/widgets/default_dialog_remove_fireplace.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/text_field_style.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/widgets_for_all_pages/my_default_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

defaultDialogEditNameFireplace(
    {required BuildContext context, required String oldNameFireplace}) {
  myDefaultDialog(
    context: context,
    // height: Get.height / 4,
    bodyWidget:
        DefaultDialogEditNameFireplace(oldNameFireplace: oldNameFireplace),
  );
}

class DefaultDialogEditNameFireplace extends StatelessWidget {
  const DefaultDialogEditNameFireplace(
      {Key? key, required this.oldNameFireplace})
      : super(key: key);
  final String oldNameFireplace;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: FittedBox(
                child: Text(
                  'Редактирование камина',
                  style: myTextStyleFontRoboto(fontSize: 22),
                ),
              ),
            ),
            SizedBox(width: mySizedHeightBetweenAlert),
            GestureDetector(
              onTap: () => Get.close(0),
              child: SizedBox(
                height: 15,
                width: 15,
                child: Image.asset(
                  'assets/icons/close.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: mySizedHeightBetweenAlert * 2),
        _TextFieldsEditNameFireplace(oldNameFireplace: oldNameFireplace),
      ],
    );
  }
}

class _TextFieldsEditNameFireplace extends StatefulWidget {
  const _TextFieldsEditNameFireplace(
      {super.key, required this.oldNameFireplace});

  final String oldNameFireplace;

  @override
  State<_TextFieldsEditNameFireplace> createState() =>
      _TextFieldsEditNameFireplaceState();
}

class _TextFieldsEditNameFireplaceState
    extends State<_TextFieldsEditNameFireplace> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isSuccess = false;

  late final _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.oldNameFireplace);
  }

  void _handleSubmit() async {
    setState(() {
      _isSuccess = false;
    });
    if (_formKey.currentState!.validate()) {
      //сначала проверим прохождение валидации
      setState(() {
        _isSuccess = true;
      });
      Future.delayed(Duration(seconds: 1)).then((value) => Get.back());
      // EmailAuthController.instance.register(
      //     _emailController.text.trim(), _passwordController.text.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Имя:',
                        style: myTextStyleFontRoboto(),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(width: mySizedHeightBetweenAlert),
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          cursorColor: myColorActivity,
                          controller: _nameController,
                          key: Key('fieldWiFiName'),
                          //for testing
                          decoration: myStyleTextField(
                            context,
                            labelText: 'Имя камина',
                            hintText: 'Ввод имени',
                          ),
                          validator: (value) {
                            if (value == '') return 'Введите имя камина';
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: mySizedHeightBetweenAlert),
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
                ],
              ),
            ),
          ),
          if (_isSuccess)
            Column(
              children: [
                SizedBox(),
                Center(
                  child: Text(
                    'данные обновлены!',
                    style: myTextStyleFontRoboto(
                      textColor: myTreeColor,
                    ),
                  ),
                ),
              ],
            ),
          TextButton(
            onPressed: () {
              defaultDialogRemoveFireplace(
                context: context,
                oldNameFireplace: widget.oldNameFireplace,
              );
            },
            child: Text(
              'Удалить камин',
              style: myTextStyleFontRoboto(textColor: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
