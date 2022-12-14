import 'package:business_layout/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/fireplace_pages/fireplace_page.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'default_dialog_edit_nameFireplace.dart';

class RowWithNameAndTitleFireplace extends StatelessWidget {
  const RowWithNameAndTitleFireplace({
    Key? key,
    this.isHomelWifi = false,
    required this.titleModel,
    this.customName,
    required this.voidCallback,
  }) : super(key: key);
  final String titleModel;
  final String? customName;
  final VoidCallback voidCallback;
  final bool isHomelWifi;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 2,
          child: TextButton(
            style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero)),
            onPressed: voidCallback,
            child: Text(
              '${titleModel.capitalizeFirst}',
              overflow: TextOverflow.ellipsis,
              style: myTextStyleFontRoboto(),
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
        if (isHomelWifi)
          Expanded(
            // flex: 2,
            child: TextButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.zero)),
              onPressed: () {
                defaultDialogEditNameFireplace(
                  context: context,
                  oldNameFireplace: 'Test name name name',
                );
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
