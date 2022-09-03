// import 'package:flutter/material.dart';
//
// ///Theme Material Light__________________________________________________________________________________________________________________________________________
// ThemeData _themeLight = ThemeData.light();
// ThemeData themeLight = _themeLight.copyWith(
//   //будут использоватьчя базовые темы и перезаписаны только те части которые нам необходимы
//   appBarTheme: AppBarTheme(
//     toolbarHeight: 40,
//     color: Colors.green,
//   ),
//
//   primaryColor: Colors.green,
//   textTheme: _textLight(
//       _themeLight.textTheme), //_themeLight.textTheme - что будем перезаписывать
// );
//
// TextTheme _textLight(TextTheme baseTextThemeLight) {
//   //также берем за основу базовую тему baseTextTheme
//   return baseTextThemeLight.copyWith(
//     headline1: baseTextThemeLight.headline1?.copyWith(
//       color: Colors.white,
//     ),
//     bodyText1: baseTextThemeLight.bodyText1?.copyWith(
//       color: Colors.green,
//     ),
//     bodyText2: baseTextThemeLight.bodyText2?.copyWith(
//       color: Colors.black, //для дефолтного текста
//     ),
//   );
// }
