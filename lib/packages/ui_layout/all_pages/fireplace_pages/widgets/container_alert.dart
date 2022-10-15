import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';

class MyContainerAlert extends StatelessWidget {
  MyContainerAlert({
    Key? key,
    this.borderColor,
    this.message,
    this.height,
    this.width,
    this.child,
  }) : super(key: key);
  double? height;
  double? width;
  Color? borderColor;
  String? message;
  Widget? child;

  @override
  Widget build(BuildContext context) {
    Color _mainColor = borderColor ?? myTwoColor;
    return _MyContainerAlert(
      height: height,
      width: width,
      borderColor: _mainColor,
      child: (message != null)
          ? Text(
        message!,
        style: myTextStyleFontRoboto(
          fontSize: 24,
          textColor: _mainColor,
        ),
        textAlign: TextAlign.center,
      )
          : child!,
    );
  }
}

class _MyContainerAlert extends StatelessWidget {
  _MyContainerAlert({
    Key? key,
    required this.child,
    this.borderColor,
    this.height,
    this.width,
  }) : super(key: key);

  Widget child;
  Color? borderColor;
  double? height;
  double? width;
  String? message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: height ?? MediaQuery.of(context).size.height / 10,
          width: width ?? MediaQuery.of(context).size.width,
          decoration: myBoxDecorationBorder(
              context: context,
              colorBorder: borderColor ?? myTwoColor), // myTwoColor),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
