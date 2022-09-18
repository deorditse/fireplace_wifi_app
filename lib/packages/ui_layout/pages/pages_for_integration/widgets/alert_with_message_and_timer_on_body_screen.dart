import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/pages/pages_for_integration/widgets/default_dialog_for_timer.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget timeWorkFireplace(BuildContext context, {bool? isIconTimer}) {
  return MyContainerAlert(
    width: MediaQuery.of(context).size.width * 0.7,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if (isIconTimer == true)
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                defaultDialogIfDayHasNotCome(context: context);
                print('timeWorkFireplace open');
              },
              child: Image.asset(
                'assets/icons/icon_timer.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        Flexible(
          flex: 7,
          child: Column(
            crossAxisAlignment: isIconTimer == true
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  'время работы',
                  style: myTextStyleFontSarpanch(
                    fontSize: 24,
                    textColor: myTwoColor,
                  ),
                ),
              ),
              GetBuilder<FireplaceConnectionGetXController>(
                builder: (controllerApp) => Flexible(
                  child: Text(
                    controllerApp.dataTimeWorkFireplace.toString(),
                    style: myTextStyleFontSarpanch(
                      fontSize: 28,
                      textColor: myTwoColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
