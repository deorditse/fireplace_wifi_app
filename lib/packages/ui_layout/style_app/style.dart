import 'package:flutter/material.dart';

Color myColorActivity = Color.fromRGBO(253, 98, 0, 1);
Color myTwoColor = Color.fromRGBO(196, 196, 196, 1);
Color myTreeColor = Color.fromRGBO(176, 172, 165, 1);
double mySizedHeigtBetweenAlert = 10;

TextStyle myTextStyleFontSarpanch({double? fontSize, Color? textColor}) =>
    TextStyle(
      color: textColor ?? Colors.white,
      fontFamily: 'Sarpanch',
      fontSize: fontSize ?? 16,
    );

TextStyle myTextStyleFontRoboto({double? fontSize, Color? textColor}) =>
    TextStyle(
      color: textColor ?? Colors.white,
      fontFamily: 'Roboto',
      fontSize: fontSize ?? 16,
    );

BoxDecoration get myDecorationBackground => const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.centerRight,
        stops: [0.0, 0.4, 1.0],
        colors: [
          Color.fromRGBO(78, 77, 77, 1),
          Color.fromRGBO(43, 42, 42, 1),
          Color.fromRGBO(9, 7, 7, 1),
        ],
        tileMode: TileMode.clamp,
      ),
    );

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
          decoration: _myBoxDecorationBorder(
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

  BoxDecoration _myBoxDecorationBorder({Color? colorBorder, context}) {
    return BoxDecoration(
      border: Border.all(
        color: colorBorder ?? Theme.of(context).primaryColor,
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
