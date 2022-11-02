import 'package:business_layout/business_layout.dart';
// import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
//
// class ButtonsIfFireplaceSmartPrime1000 extends StatelessWidget {
//   const ButtonsIfFireplaceSmartPrime1000({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<FireplaceConnectionGetXController>(
//       builder: (controllerApp) => Expanded(
//         child: Column(
//           children: [
//             Align(
//               alignment: Alignment.topCenter,
//               child: GestureDetector(
//                 onTap: () {
//                   //playAndStopFireplace
//                   controllerApp.changeButtonPlayStopFireplace();
//                 },
//                 child: AnimatedContainer(
//                   duration: const Duration(seconds: 1),
//                   curve: Curves.fastOutSlowIn,
//                   child: CircleAvatar(
//                     backgroundColor: Colors.transparent,
//                     radius: (!controllerApp.isPlayFireplace &&
//                             !controllerApp.isFuelSystemError)
//                         ? MediaQuery.of(context).size.width / 5
//                         : MediaQuery.of(context).size.width / 6,
//                     child: SvgPicture.asset(
//                       (!controllerApp.isPlayFireplace &&
//                               !controllerApp.isFuelSystemError)
//                           ? 'assets/button_fireplace/play.svg'
//                           : 'assets/button_fireplace/stop.svg',
//                       fit: BoxFit.none,
//                       semanticsLabel: 'icon_bottom',
//                       // fit: BoxFit.contain,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             if ((controllerApp.isPlayFireplace &&
//                 !controllerApp.isFuelSystemError))
//               _ColumnButton(),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class _ColumnButton extends StatefulWidget {
//   _ColumnButton({Key? key}) : super(key: key);
//
//   @override
//   State<_ColumnButton> createState() => _ColumnButtonState();
// }
//
// class _ColumnButtonState extends State<_ColumnButton> {
//   final Rx<bool> _buttonNorm = true.obs;
//
//   final Rx<bool> _buttonEco = false.obs;
//
//   final Color _colorTextButtonBlack = Color.fromRGBO(25, 25, 25, 1);
//
//   @override
//   Widget build(BuildContext context) {
//     return Flexible(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Flexible(
//             child: GestureDetector(
//               onTap: () {
//                 if (!_buttonNorm.value) {
//                   _buttonNorm.value = !_buttonNorm.value;
//
//                   FireplaceConnectionGetXController.instance
//                       .setNormModeForSmartA1000();
//                 }
//                 _buttonEco.value = false;
//               },
//               child: CircleAvatar(
//                 backgroundColor: Colors.transparent,
//                 radius: MediaQuery.of(context).size.width / 8,
//                 child: Stack(
//                   alignment: Alignment.topCenter,
//                   children: [
//                     SvgPicture.asset(
//                       'assets/button_fireplace/clear_button.svg',
//                       semanticsLabel: 'icon_bottom',
//                       fit: BoxFit.none,
//                     ),
//                     Obx(
//                       () => Positioned(
//                         top: MediaQuery.of(context).size.width / 10,
//                         child: Text(
//                           'NORM',
//                           style: myTextStyleFontRoboto(
//                             fontSize: 12,
//                             textColor: _buttonNorm.value
//                                 ? myColorActivity
//                                 : _colorTextButtonBlack,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Flexible(
//             child: GestureDetector(
//               onTap: () {
//                 if (!_buttonEco.value) {
//                   _buttonEco.value = !_buttonEco.value;
//
//                   FireplaceConnectionGetXController.instance
//                       .setEcoModeForSmartA1000();
//                 }
//                 _buttonNorm.value = false;
//               },
//               child: CircleAvatar(
//                 backgroundColor: Colors.transparent,
//                 radius: MediaQuery.of(context).size.width / 8,
//                 child: Stack(
//                   alignment: Alignment.topCenter,
//                   children: [
//                     SvgPicture.asset(
//                       'assets/button_fireplace/clear_button.svg',
//                       semanticsLabel: 'icon_bottom',
//                       fit: BoxFit.none,
//                     ),
//                     Obx(
//                       () => Positioned(
//                         top: MediaQuery.of(context).size.width / 10,
//                         child: Text(
//                           'ECO',
//                           style: myTextStyleFontRoboto(
//                             fontSize: 12,
//                             textColor: _buttonEco.value
//                                 ? myColorActivity
//                                 : _colorTextButtonBlack,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
