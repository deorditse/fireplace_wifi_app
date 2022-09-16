import 'package:flutter/material.dart';

Color myColorActivity = Color.fromRGBO(253, 98, 0, 1);
Color myTwoColor = Color.fromRGBO(196, 196, 196, 1);
Color myTreeColor = Color.fromRGBO(176, 172, 165, 1);

class MyContainerAlert extends StatelessWidget {
  MyContainerAlert(
      {Key? key,
      required this.child,
      this.colorBorder,
      this.height,
      this.width})
      : super(key: key);

  Widget child;
  Color? colorBorder;
  double? height;
  double? width;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: height ?? MediaQuery.of(context).size.height / 10,
          width: width ?? MediaQuery.of(context).size.width,
          decoration:
              _myBoxDecorationBorder(context: context, colorBorder: colorBorder),
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
