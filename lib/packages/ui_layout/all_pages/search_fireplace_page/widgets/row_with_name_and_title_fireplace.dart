import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/fireplace_pages/fireplace_page.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'default_dialog_edit_nameFireplace.dart';

class RowWithNameAndTitleFireplace extends StatelessWidget {
  const RowWithNameAndTitleFireplace({
    Key? key,
    required this.titleModel,
    this.customName,
  }) : super(key: key);
  final String titleModel;
  final String? customName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          // flex: 2,
          child: TextButton(
            style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero)),
            onPressed: () {
              Get.toNamed(FireplacePage.id, preventDuplicates: false);
            },
            child: Text(
              '${titleModel}',
              overflow: TextOverflow.ellipsis,
              style: myTextStyleFontRoboto(),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        SizedBox(width: 4),
        SvgPicture.asset(
          'assets/icons/check.svg',
          semanticsLabel: 'check',
          fit: BoxFit.contain,
          color: myTwoColor,
        ),
        SizedBox(width: 4),
        Expanded(
          // flex: 2,
          child: TextButton(
            style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero)),
            onPressed: () {
              defaultDialogEditNameFireplace(
                  context: context, oldNameFireplace: 'Test name name name');
            },
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(width: 4),
                      Text(
                        'Test name name name',
                        style: myTextStyleFontRoboto(),
                        overflow: TextOverflow.ellipsis,
                      ),
                      // SizedBox(width: 4),
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: myTwoColor,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 4),
                SvgPicture.asset(
                  'assets/icons/marker.svg',
                  semanticsLabel: 'marker',
                  fit: BoxFit.contain,
                  // color: myTwoColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
