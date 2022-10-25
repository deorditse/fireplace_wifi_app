import 'package:freezed_annotation/freezed_annotation.dart';

// part 'fireplace_data_model.g.dart';
part 'fireplace_data_model.freezed.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

@freezed
class FireplaceDataModel with _$FireplaceDataModel {
  factory FireplaceDataModel({
    //значение температуры
    required double? temperature,
    //значение уровня топлива
    required double? percentOil,
    //значение влажности
    required double? wet,
    //значение CO2
    required double? CO2value,
    //серийный номер
    required String? serialNumber,
    //Дс code
    required String? dcCode,
    //дата производства
    required String? dateOfManufacture,
    //звук нажатия кнопок
    required bool? isSwitchClickSound,
    //Звуковой эффект потрескивание дров
    required double? sliderValueCracklingSoundEffect,
    //Голосовые подсказки
    required double? sliderValueVoicePrompts,
    //если ошибка топливной системы
    required bool? isFuelSystemError,
    //охлаждение камина начато?
    required bool? isCoolingFireplace,
    //кнопка блокирования экрана нажата?
    required bool? isBlocButton,
    //заданный пользователем пароль
    required int? passwordBlock,
    //камин запущен?
    required bool? isPlayFireplace,
    //общее время работы камина
    required String? dataTimeWorkFireplace,
    //есть таймер и включен или нет
    required bool? isOptionTimer,
  }) = _FireplaceDataModel;

// factory FireplaceDataModel.fromJson(Map<String, dynamic> json) =>
//     _$FireplaceDataModelFromJson(json);
}
