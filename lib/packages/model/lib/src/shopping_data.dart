// import 'package:json_annotation/json_annotation.dart';
//
// part 'shopping_data.g.dart';
//
// // flutter pub run build_runner build --delete-conflicting-outputs
// //реализация c использванием пакета freezed чтобы не переопределять методы вручную, чтобы класы сравнивались не по ссылкам, а по значениям
// //для запуска кодогенерации в текущем пакете flutter pub run build_runner build --delete-conflicting-outputs
// //реализация c использванием пакета freezed чтобы не переопределять методы вручную, чтобы класы сравнивались не по ссылкам, а по значениям #для переопределения методов toString copyWith
//
// // @JsonSerializable
// @JsonSerializable()
// //explicitToJson - чтобы получать конвертацию в json а не Instance этого класса
// class ShoppingData {
//   String? uid = 'нет данных';
//   bool? buy = false;
//   num? price = 0;
//   String? nameProduct = 'нет данных';
//   String? photoPath = 'нет данных';
//   int? quantity = 0;
//
//   ShoppingData({
//     required this.quantity,
//     required this.price,
//     required this.uid,
//     required this.buy,
//     required this.nameProduct,
//     required this.photoPath,
//   });
//
//   factory ShoppingData.fromJson(Map<String, dynamic> json) =>
//       _$ShoppingDataFromJson(json);
//
//   Map<String, dynamic> toJson() => _$ShoppingDataToJson(this);
// }
