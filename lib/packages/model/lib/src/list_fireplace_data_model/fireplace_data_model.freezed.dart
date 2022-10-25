// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fireplace_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FireplaceDataModel {
//значение температуры
  double? get temperature =>
      throw _privateConstructorUsedError; //значение уровня топлива
  double? get percentOil =>
      throw _privateConstructorUsedError; //значение влажности
  double? get wet => throw _privateConstructorUsedError; //значение CO2
  double? get CO2value => throw _privateConstructorUsedError; //серийный номер
  String? get serialNumber => throw _privateConstructorUsedError; //Дс code
  String? get dcCode => throw _privateConstructorUsedError; //дата производства
  String? get dateOfManufacture =>
      throw _privateConstructorUsedError; //звук нажатия кнопок
  bool? get isSwitchClickSound =>
      throw _privateConstructorUsedError; //Звуковой эффект потрескивание дров
  double? get sliderValueCracklingSoundEffect =>
      throw _privateConstructorUsedError; //Голосовые подсказки
  double? get sliderValueVoicePrompts =>
      throw _privateConstructorUsedError; //если ошибка топливной системы
  bool? get isFuelSystemError =>
      throw _privateConstructorUsedError; //охлаждение камина начато?
  bool? get isCoolingFireplace =>
      throw _privateConstructorUsedError; //кнопка блокирования экрана нажата?
  bool? get isBlocButton =>
      throw _privateConstructorUsedError; //заданный пользователем пароль
  int? get passwordBlock => throw _privateConstructorUsedError; //камин запущен?
  bool? get isPlayFireplace =>
      throw _privateConstructorUsedError; //общее время работы камина
  String? get dataTimeWorkFireplace =>
      throw _privateConstructorUsedError; //есть таймер и включен или нет
  bool? get isOptionTimer => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FireplaceDataModelCopyWith<FireplaceDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FireplaceDataModelCopyWith<$Res> {
  factory $FireplaceDataModelCopyWith(
          FireplaceDataModel value, $Res Function(FireplaceDataModel) then) =
      _$FireplaceDataModelCopyWithImpl<$Res, FireplaceDataModel>;
  @useResult
  $Res call(
      {double? temperature,
      double? percentOil,
      double? wet,
      double? CO2value,
      String? serialNumber,
      String? dcCode,
      String? dateOfManufacture,
      bool? isSwitchClickSound,
      double? sliderValueCracklingSoundEffect,
      double? sliderValueVoicePrompts,
      bool? isFuelSystemError,
      bool? isCoolingFireplace,
      bool? isBlocButton,
      int? passwordBlock,
      bool? isPlayFireplace,
      String? dataTimeWorkFireplace,
      bool? isOptionTimer});
}

/// @nodoc
class _$FireplaceDataModelCopyWithImpl<$Res, $Val extends FireplaceDataModel>
    implements $FireplaceDataModelCopyWith<$Res> {
  _$FireplaceDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperature = freezed,
    Object? percentOil = freezed,
    Object? wet = freezed,
    Object? CO2value = freezed,
    Object? serialNumber = freezed,
    Object? dcCode = freezed,
    Object? dateOfManufacture = freezed,
    Object? isSwitchClickSound = freezed,
    Object? sliderValueCracklingSoundEffect = freezed,
    Object? sliderValueVoicePrompts = freezed,
    Object? isFuelSystemError = freezed,
    Object? isCoolingFireplace = freezed,
    Object? isBlocButton = freezed,
    Object? passwordBlock = freezed,
    Object? isPlayFireplace = freezed,
    Object? dataTimeWorkFireplace = freezed,
    Object? isOptionTimer = freezed,
  }) {
    return _then(_value.copyWith(
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      percentOil: freezed == percentOil
          ? _value.percentOil
          : percentOil // ignore: cast_nullable_to_non_nullable
              as double?,
      wet: freezed == wet
          ? _value.wet
          : wet // ignore: cast_nullable_to_non_nullable
              as double?,
      CO2value: freezed == CO2value
          ? _value.CO2value
          : CO2value // ignore: cast_nullable_to_non_nullable
              as double?,
      serialNumber: freezed == serialNumber
          ? _value.serialNumber
          : serialNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      dcCode: freezed == dcCode
          ? _value.dcCode
          : dcCode // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfManufacture: freezed == dateOfManufacture
          ? _value.dateOfManufacture
          : dateOfManufacture // ignore: cast_nullable_to_non_nullable
              as String?,
      isSwitchClickSound: freezed == isSwitchClickSound
          ? _value.isSwitchClickSound
          : isSwitchClickSound // ignore: cast_nullable_to_non_nullable
              as bool?,
      sliderValueCracklingSoundEffect: freezed ==
              sliderValueCracklingSoundEffect
          ? _value.sliderValueCracklingSoundEffect
          : sliderValueCracklingSoundEffect // ignore: cast_nullable_to_non_nullable
              as double?,
      sliderValueVoicePrompts: freezed == sliderValueVoicePrompts
          ? _value.sliderValueVoicePrompts
          : sliderValueVoicePrompts // ignore: cast_nullable_to_non_nullable
              as double?,
      isFuelSystemError: freezed == isFuelSystemError
          ? _value.isFuelSystemError
          : isFuelSystemError // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCoolingFireplace: freezed == isCoolingFireplace
          ? _value.isCoolingFireplace
          : isCoolingFireplace // ignore: cast_nullable_to_non_nullable
              as bool?,
      isBlocButton: freezed == isBlocButton
          ? _value.isBlocButton
          : isBlocButton // ignore: cast_nullable_to_non_nullable
              as bool?,
      passwordBlock: freezed == passwordBlock
          ? _value.passwordBlock
          : passwordBlock // ignore: cast_nullable_to_non_nullable
              as int?,
      isPlayFireplace: freezed == isPlayFireplace
          ? _value.isPlayFireplace
          : isPlayFireplace // ignore: cast_nullable_to_non_nullable
              as bool?,
      dataTimeWorkFireplace: freezed == dataTimeWorkFireplace
          ? _value.dataTimeWorkFireplace
          : dataTimeWorkFireplace // ignore: cast_nullable_to_non_nullable
              as String?,
      isOptionTimer: freezed == isOptionTimer
          ? _value.isOptionTimer
          : isOptionTimer // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FireplaceDataModelCopyWith<$Res>
    implements $FireplaceDataModelCopyWith<$Res> {
  factory _$$_FireplaceDataModelCopyWith(_$_FireplaceDataModel value,
          $Res Function(_$_FireplaceDataModel) then) =
      __$$_FireplaceDataModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? temperature,
      double? percentOil,
      double? wet,
      double? CO2value,
      String? serialNumber,
      String? dcCode,
      String? dateOfManufacture,
      bool? isSwitchClickSound,
      double? sliderValueCracklingSoundEffect,
      double? sliderValueVoicePrompts,
      bool? isFuelSystemError,
      bool? isCoolingFireplace,
      bool? isBlocButton,
      int? passwordBlock,
      bool? isPlayFireplace,
      String? dataTimeWorkFireplace,
      bool? isOptionTimer});
}

/// @nodoc
class __$$_FireplaceDataModelCopyWithImpl<$Res>
    extends _$FireplaceDataModelCopyWithImpl<$Res, _$_FireplaceDataModel>
    implements _$$_FireplaceDataModelCopyWith<$Res> {
  __$$_FireplaceDataModelCopyWithImpl(
      _$_FireplaceDataModel _value, $Res Function(_$_FireplaceDataModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperature = freezed,
    Object? percentOil = freezed,
    Object? wet = freezed,
    Object? CO2value = freezed,
    Object? serialNumber = freezed,
    Object? dcCode = freezed,
    Object? dateOfManufacture = freezed,
    Object? isSwitchClickSound = freezed,
    Object? sliderValueCracklingSoundEffect = freezed,
    Object? sliderValueVoicePrompts = freezed,
    Object? isFuelSystemError = freezed,
    Object? isCoolingFireplace = freezed,
    Object? isBlocButton = freezed,
    Object? passwordBlock = freezed,
    Object? isPlayFireplace = freezed,
    Object? dataTimeWorkFireplace = freezed,
    Object? isOptionTimer = freezed,
  }) {
    return _then(_$_FireplaceDataModel(
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      percentOil: freezed == percentOil
          ? _value.percentOil
          : percentOil // ignore: cast_nullable_to_non_nullable
              as double?,
      wet: freezed == wet
          ? _value.wet
          : wet // ignore: cast_nullable_to_non_nullable
              as double?,
      CO2value: freezed == CO2value
          ? _value.CO2value
          : CO2value // ignore: cast_nullable_to_non_nullable
              as double?,
      serialNumber: freezed == serialNumber
          ? _value.serialNumber
          : serialNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      dcCode: freezed == dcCode
          ? _value.dcCode
          : dcCode // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfManufacture: freezed == dateOfManufacture
          ? _value.dateOfManufacture
          : dateOfManufacture // ignore: cast_nullable_to_non_nullable
              as String?,
      isSwitchClickSound: freezed == isSwitchClickSound
          ? _value.isSwitchClickSound
          : isSwitchClickSound // ignore: cast_nullable_to_non_nullable
              as bool?,
      sliderValueCracklingSoundEffect: freezed ==
              sliderValueCracklingSoundEffect
          ? _value.sliderValueCracklingSoundEffect
          : sliderValueCracklingSoundEffect // ignore: cast_nullable_to_non_nullable
              as double?,
      sliderValueVoicePrompts: freezed == sliderValueVoicePrompts
          ? _value.sliderValueVoicePrompts
          : sliderValueVoicePrompts // ignore: cast_nullable_to_non_nullable
              as double?,
      isFuelSystemError: freezed == isFuelSystemError
          ? _value.isFuelSystemError
          : isFuelSystemError // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCoolingFireplace: freezed == isCoolingFireplace
          ? _value.isCoolingFireplace
          : isCoolingFireplace // ignore: cast_nullable_to_non_nullable
              as bool?,
      isBlocButton: freezed == isBlocButton
          ? _value.isBlocButton
          : isBlocButton // ignore: cast_nullable_to_non_nullable
              as bool?,
      passwordBlock: freezed == passwordBlock
          ? _value.passwordBlock
          : passwordBlock // ignore: cast_nullable_to_non_nullable
              as int?,
      isPlayFireplace: freezed == isPlayFireplace
          ? _value.isPlayFireplace
          : isPlayFireplace // ignore: cast_nullable_to_non_nullable
              as bool?,
      dataTimeWorkFireplace: freezed == dataTimeWorkFireplace
          ? _value.dataTimeWorkFireplace
          : dataTimeWorkFireplace // ignore: cast_nullable_to_non_nullable
              as String?,
      isOptionTimer: freezed == isOptionTimer
          ? _value.isOptionTimer
          : isOptionTimer // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_FireplaceDataModel implements _FireplaceDataModel {
  _$_FireplaceDataModel(
      {required this.temperature,
      required this.percentOil,
      required this.wet,
      required this.CO2value,
      required this.serialNumber,
      required this.dcCode,
      required this.dateOfManufacture,
      required this.isSwitchClickSound,
      required this.sliderValueCracklingSoundEffect,
      required this.sliderValueVoicePrompts,
      required this.isFuelSystemError,
      required this.isCoolingFireplace,
      required this.isBlocButton,
      required this.passwordBlock,
      required this.isPlayFireplace,
      required this.dataTimeWorkFireplace,
      required this.isOptionTimer});

//значение температуры
  @override
  final double? temperature;
//значение уровня топлива
  @override
  final double? percentOil;
//значение влажности
  @override
  final double? wet;
//значение CO2
  @override
  final double? CO2value;
//серийный номер
  @override
  final String? serialNumber;
//Дс code
  @override
  final String? dcCode;
//дата производства
  @override
  final String? dateOfManufacture;
//звук нажатия кнопок
  @override
  final bool? isSwitchClickSound;
//Звуковой эффект потрескивание дров
  @override
  final double? sliderValueCracklingSoundEffect;
//Голосовые подсказки
  @override
  final double? sliderValueVoicePrompts;
//если ошибка топливной системы
  @override
  final bool? isFuelSystemError;
//охлаждение камина начато?
  @override
  final bool? isCoolingFireplace;
//кнопка блокирования экрана нажата?
  @override
  final bool? isBlocButton;
//заданный пользователем пароль
  @override
  final int? passwordBlock;
//камин запущен?
  @override
  final bool? isPlayFireplace;
//общее время работы камина
  @override
  final String? dataTimeWorkFireplace;
//есть таймер и включен или нет
  @override
  final bool? isOptionTimer;

  @override
  String toString() {
    return 'FireplaceDataModel(temperature: $temperature, percentOil: $percentOil, wet: $wet, CO2value: $CO2value, serialNumber: $serialNumber, dcCode: $dcCode, dateOfManufacture: $dateOfManufacture, isSwitchClickSound: $isSwitchClickSound, sliderValueCracklingSoundEffect: $sliderValueCracklingSoundEffect, sliderValueVoicePrompts: $sliderValueVoicePrompts, isFuelSystemError: $isFuelSystemError, isCoolingFireplace: $isCoolingFireplace, isBlocButton: $isBlocButton, passwordBlock: $passwordBlock, isPlayFireplace: $isPlayFireplace, dataTimeWorkFireplace: $dataTimeWorkFireplace, isOptionTimer: $isOptionTimer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FireplaceDataModel &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.percentOil, percentOil) ||
                other.percentOil == percentOil) &&
            (identical(other.wet, wet) || other.wet == wet) &&
            (identical(other.CO2value, CO2value) ||
                other.CO2value == CO2value) &&
            (identical(other.serialNumber, serialNumber) ||
                other.serialNumber == serialNumber) &&
            (identical(other.dcCode, dcCode) || other.dcCode == dcCode) &&
            (identical(other.dateOfManufacture, dateOfManufacture) ||
                other.dateOfManufacture == dateOfManufacture) &&
            (identical(other.isSwitchClickSound, isSwitchClickSound) ||
                other.isSwitchClickSound == isSwitchClickSound) &&
            (identical(other.sliderValueCracklingSoundEffect,
                    sliderValueCracklingSoundEffect) ||
                other.sliderValueCracklingSoundEffect ==
                    sliderValueCracklingSoundEffect) &&
            (identical(
                    other.sliderValueVoicePrompts, sliderValueVoicePrompts) ||
                other.sliderValueVoicePrompts == sliderValueVoicePrompts) &&
            (identical(other.isFuelSystemError, isFuelSystemError) ||
                other.isFuelSystemError == isFuelSystemError) &&
            (identical(other.isCoolingFireplace, isCoolingFireplace) ||
                other.isCoolingFireplace == isCoolingFireplace) &&
            (identical(other.isBlocButton, isBlocButton) ||
                other.isBlocButton == isBlocButton) &&
            (identical(other.passwordBlock, passwordBlock) ||
                other.passwordBlock == passwordBlock) &&
            (identical(other.isPlayFireplace, isPlayFireplace) ||
                other.isPlayFireplace == isPlayFireplace) &&
            (identical(other.dataTimeWorkFireplace, dataTimeWorkFireplace) ||
                other.dataTimeWorkFireplace == dataTimeWorkFireplace) &&
            (identical(other.isOptionTimer, isOptionTimer) ||
                other.isOptionTimer == isOptionTimer));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      temperature,
      percentOil,
      wet,
      CO2value,
      serialNumber,
      dcCode,
      dateOfManufacture,
      isSwitchClickSound,
      sliderValueCracklingSoundEffect,
      sliderValueVoicePrompts,
      isFuelSystemError,
      isCoolingFireplace,
      isBlocButton,
      passwordBlock,
      isPlayFireplace,
      dataTimeWorkFireplace,
      isOptionTimer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FireplaceDataModelCopyWith<_$_FireplaceDataModel> get copyWith =>
      __$$_FireplaceDataModelCopyWithImpl<_$_FireplaceDataModel>(
          this, _$identity);
}

abstract class _FireplaceDataModel implements FireplaceDataModel {
  factory _FireplaceDataModel(
      {required final double? temperature,
      required final double? percentOil,
      required final double? wet,
      required final double? CO2value,
      required final String? serialNumber,
      required final String? dcCode,
      required final String? dateOfManufacture,
      required final bool? isSwitchClickSound,
      required final double? sliderValueCracklingSoundEffect,
      required final double? sliderValueVoicePrompts,
      required final bool? isFuelSystemError,
      required final bool? isCoolingFireplace,
      required final bool? isBlocButton,
      required final int? passwordBlock,
      required final bool? isPlayFireplace,
      required final String? dataTimeWorkFireplace,
      required final bool? isOptionTimer}) = _$_FireplaceDataModel;

  @override //значение температуры
  double? get temperature;
  @override //значение уровня топлива
  double? get percentOil;
  @override //значение влажности
  double? get wet;
  @override //значение CO2
  double? get CO2value;
  @override //серийный номер
  String? get serialNumber;
  @override //Дс code
  String? get dcCode;
  @override //дата производства
  String? get dateOfManufacture;
  @override //звук нажатия кнопок
  bool? get isSwitchClickSound;
  @override //Звуковой эффект потрескивание дров
  double? get sliderValueCracklingSoundEffect;
  @override //Голосовые подсказки
  double? get sliderValueVoicePrompts;
  @override //если ошибка топливной системы
  bool? get isFuelSystemError;
  @override //охлаждение камина начато?
  bool? get isCoolingFireplace;
  @override //кнопка блокирования экрана нажата?
  bool? get isBlocButton;
  @override //заданный пользователем пароль
  int? get passwordBlock;
  @override //камин запущен?
  bool? get isPlayFireplace;
  @override //общее время работы камина
  String? get dataTimeWorkFireplace;
  @override //есть таймер и включен или нет
  bool? get isOptionTimer;
  @override
  @JsonKey(ignore: true)
  _$$_FireplaceDataModelCopyWith<_$_FireplaceDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}
