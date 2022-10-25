// import 'package:freezed_annotation/freezed_annotation.dart';
//
// // part 'fireplace_data_model.g.dart';
// part 'fireplace_data_model.freezed.dart';
//
// // flutter pub run build_runner build --delete-conflicting-outputs
//
// @unfreezed
// class FireplaceDataModel with _$FireplaceDataModel {
//   factory FireplaceDataModel({
//     //значение температуры
//     required double temperature,
//
//     //значение уровня топлива
//     required double percentOil,
//
//     //значение влажности
//     required double wet,
//
//     //значение CO2
//     double? CO2value,
//
//     //серийный номер
//     required String serialNumber,
//
//     //Дс code
//     required String dcCode,
//
//     //дата производства
//     required String dateOfManufacture,
//
//     //звук нажатия кнопок
//     @Default(false) bool isSwitchClickSound,
//
//     //Звуковой эффект потрескивание дров
//     double? sliderValueCracklingSoundEffect,
//
//     //Голосовые подсказки
//     double? sliderValueVoicePrompts,
//
//     //если ошибка топливной системы
//     @Default(false) bool isFuelSystemError,
//
//     //охлаждение камина начато?
//     @Default(false) bool isCoolingFireplace,
//
//     //кнопка блокирования экрана нажата?
//     @Default(false) bool isBlocButton,
//
//     //заданный пользователем пароль
//     @Default(5539) int? passwordBlock,
//
//     //камин запущен?
//     @Default(false) bool isPlayFireplace,
//
//     //общее время работы камина
//     String? dataTimeWorkFireplace,
//
//     //есть таймер и включен или нет
//     @Default(false) bool isOptionTimer,
//   }) = _FireplaceDataModel;
// }
