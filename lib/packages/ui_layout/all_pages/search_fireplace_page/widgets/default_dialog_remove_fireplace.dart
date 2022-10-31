import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/widgets_for_all_pages/my_default_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

defaultDialogRemoveFireplace(
    {required BuildContext context, required String oldNameFireplace}) {
  myDefaultDialog(
    height: Get.height / 5.5,
    context: context,
    barrierDismissible: false,
    bodyWidget:
        DefaultDialogRemoveFireplace(oldNameFireplace: oldNameFireplace),
  );
}

class DefaultDialogRemoveFireplace extends StatelessWidget {
  const DefaultDialogRemoveFireplace({Key? key, required this.oldNameFireplace})
      : super(key: key);
  final String oldNameFireplace;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Хотите удалить камин?',
          style: myTextStyleFontRoboto(),
        ),
        Text(
          oldNameFireplace,
          style: myTextStyleFontRoboto(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                'Нет',
                style: myTextStyleFontRoboto(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
                Get.back();
              },
              child: Text(
                'Да',
                style: myTextStyleFontRoboto(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
