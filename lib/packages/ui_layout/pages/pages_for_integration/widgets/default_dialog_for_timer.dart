import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

defaultDialogIfDayHasNotCome({required context}) {
  return Get.defaultDialog(
    titlePadding: EdgeInsets.zero,
    contentPadding: EdgeInsets.zero,
    backgroundColor: Colors.transparent,
    content: Container(
      decoration:
          myDefaultDialogBackground(context: context, colorBorder: myTwoColor),
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Image.asset(
                          'assets/icons/icon_timer.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Image.asset(
                        'assets/icons/icon_up.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () => Get.close(0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: FittedBox(
                            child: Image.asset(
                              'assets/icons/close.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GetBuilder<FireplaceConnectionGetXController>(
              builder: (controllerApp) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    controllerApp.dataTimer.toString(),
                    textAlign: TextAlign.center,
                    style: myTextStyleFontSarpanch(
                      fontSize: 36,
                      textColor: myTwoColor,
                    ),
                  ),
                );
              },
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(
                          const Color.fromRGBO(255, 0, 0, 1).withOpacity(0.1),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {},
                      child: FittedBox(
                        child: Text(
                          'Сброс.',
                          textAlign: TextAlign.left,
                          style: myTextStyleFontSarpanch(
                            fontSize: 24,
                            textColor: const Color.fromRGBO(255, 0, 0, 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: RotatedBox(
                      quarterTurns: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Image.asset(
                          'assets/icons/icon_up.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent)),
                      onPressed: () {},
                      child: FittedBox(
                        child: Text(
                          'Установ.',
                          textAlign: TextAlign.right,
                          style: myTextStyleFontSarpanch(
                            fontSize: 24,
                            textColor: const Color.fromRGBO(0, 255, 71, 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    title: "",
  );
}
