import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

defaultDialogIfDayHasNotCome({required context}) {
  return Get.defaultDialog(
    titlePadding: EdgeInsets.zero,
    contentPadding: EdgeInsets.zero,
    backgroundColor: Colors.transparent,
    content: DefaultDialogIfDayHasNotCome(),
    title: "",
  );
}

class DefaultDialogIfDayHasNotCome extends StatefulWidget {
  const DefaultDialogIfDayHasNotCome({Key? key}) : super(key: key);

  @override
  State<DefaultDialogIfDayHasNotCome> createState() =>
      _DefaultDialogIfDayHasNotComeState();
}

class _DefaultDialogIfDayHasNotComeState
    extends State<DefaultDialogIfDayHasNotCome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          myDefaultDialogBackground(context: context, colorBorder: myTwoColor),
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: GetBuilder<FireplaceConnectionGetXController>(
          builder: (controllerApp) {
            bool isRunning = controllerApp.timerIsRunning;

            return Column(
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
                            child: SvgPicture.asset(
                              'assets/icons/timer.svg',
                              semanticsLabel: 'timer',
                              fit: BoxFit.contain,
                              color: isRunning ? myColorActivity : null,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            if (!isRunning) {
                              int _hour = int.parse(controllerApp.dataTimer[0]);
                              if (_hour < 24) {
                                controllerApp.updateDataTimer(
                                    hour: (_hour + 1).toString());
                              }
                            }
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: SvgPicture.asset(
                              'assets/icons/icon_up.svg',
                              semanticsLabel: 'icon_bottom',
                              fit: BoxFit.contain,
                            ),
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
                              child: Image.asset(
                                'assets/icons/close.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${controllerApp.dataTimer[0]} : ${controllerApp.dataTimer[1]} : ${controllerApp.dataTimer[2]}',
                    textAlign: TextAlign.center,
                    style: myTextStyleFontSarpanch(
                      fontSize: 36,
                      textColor: myTwoColor,
                    ),
                  ),
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
                              const Color.fromRGBO(255, 0, 0, 1)
                                  .withOpacity(0.1),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          onPressed: () {
                            controllerApp.updateDataTimer(
                              hour: '00',
                              minutes: '00',
                              seconds: '00',
                            );
                          },
                          child: Text(
                            isRunning ? '' : 'Сброс.',
                            textAlign: TextAlign.left,
                            style: myTextStyleFontSarpanch(
                              fontSize: 24,
                              textColor: const Color.fromRGBO(255, 0, 0, 1),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: RotatedBox(
                          quarterTurns: 2,
                          child: TextButton(
                            onPressed: () {
                              if (!isRunning) {
                                int _hour =
                                    int.parse(controllerApp.dataTimer[0]);
                                if (_hour > 0) {
                                  controllerApp.updateDataTimer(
                                      hour: (_hour - 1).toString());
                                }
                              }
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: SvgPicture.asset(
                                'assets/icons/icon_up.svg',
                                semanticsLabel: 'icon_bottom',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.transparent)),
                          onPressed: () {
                            isRunning
                                ? controllerApp.dataTimerStop()
                                : controllerApp.dataTimerStart();
                          },
                          child: FittedBox(
                            child: Text(
                              isRunning ? 'Выкл.' : 'Установ.',
                              textAlign: TextAlign.right,
                              style: myTextStyleFontSarpanch(
                                fontSize: 24,
                                textColor: !isRunning
                                    ? const Color.fromRGBO(0, 255, 71, 1)
                                    : myColorActivity, //const Color.fromRGBO(253, 133, 0, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
