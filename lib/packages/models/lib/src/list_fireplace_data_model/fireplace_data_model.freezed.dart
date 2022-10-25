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
  double get temperature =>
      throw _privateConstructorUsedError; //значение температуры
  set temperature(double value) =>
      throw _privateConstructorUsedError; //значение уровня топлива
  double get percentOil =>
      throw _privateConstructorUsedError; //значение уровня топлива
  set percentOil(double value) =>
      throw _privateConstructorUsedError; //значение влажности
  double get wet => throw _privateConstructorUsedError; //значение влажности
  set wet(double value) => throw _privateConstructorUsedError; //значение CO2
  double? get CO2value => throw _privateConstructorUsedError; //значение CO2
  set CO2value(double? value) =>
      throw _privateConstructorUsedError; //серийный номер
  String get serialNumber =>
      throw _privateConstructorUsedError; //серийный номер
  set serialNumber(String value) =>
      throw _privateConstructorUsedError; //Дс code
  String get dcCode => throw _privateConstructorUsedError; //Дс code
  set dcCode(String value) =>
      throw _privateConstructorUsedError; //дата производства
  String get dateOfManufacture =>
      throw _privateConstructorUsedError; //дата производства
  set dateOfManufacture(String value) =>
      throw _privateConstructorUsedError; //звук нажатия кнопок
  bool get isSwitchClickSound =>
      throw _privateConstructorUsedError; //звук нажатия кнопок
  set isSwitchClickSound(bool value) =>
      throw _privateConstructorUsedError; //Звуковой эффект потрескивание дров
  double? get sliderValueCracklingSoundEffect =>
      throw _privateConstructorUsedError; //Звуковой эффект потрескивание дров
  set sliderValueCracklingSoundEffect(double? value) =>
      throw _privateConstructorUsedError; //Голосовые подсказки
  double? get sliderValueVoicePrompts =>
      throw _privateConstructorUsedError; //Голосовые подсказки
  set sliderValueVoicePrompts(double? value) =>
      throw _privateConstructorUsedError; //если ошибка топливной системы
  bool get isFuelSystemError =>
      throw _privateConstructorUsedError; //если ошибка топливной системы
  set isFuelSystemError(bool value) =>
      throw _privateConstructorUsedError; //охлаждение камина начато?
  bool get isCoolingFireplace =>
      throw _privateConstructorUsedError; //охлаждение камина начато?
  set isCoolingFireplace(bool value) =>
      throw _privateConstructorUsedError; //кнопка блокирования экрана нажата?
  bool get isBlocButton =>
      throw _privateConstructorUsedError; //кнопка блокирования экрана нажата?
  set isBlocButton(bool value) =>
      throw _privateConstructorUsedError; //заданный пользователем пароль
  int get passwordBlock =>
      throw _privateConstructorUsedError; //заданный пользователем пароль
  set passwordBlock(int value) =>
      throw _privateConstructorUsedError; //пароль по умолчанию
//камин запущен?
  bool get isPlayFireplace =>
      throw _privateConstructorUsedError; //пароль по умолчанию
//камин запущен?
  set isPlayFireplace(bool value) =>
      throw _privateConstructorUsedError; //общее время работы камина
  String? get dataTimeWorkFireplace =>
      throw _privateConstructorUsedError; //общее время работы камина
  set dataTimeWorkFireplace(String? value) =>
      throw _privateConstructorUsedError; //есть таймер и включен или нет
  bool get isOptionTimer =>
      throw _privateConstructorUsedError; //есть таймер и включен или нет
  set isOptionTimer(bool value) => throw _privateConstructorUsedError;

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
      {double temperature,
      double percentOil,
      double wet,
      double? CO2value,
      String serialNumber,
      String dcCode,
      String dateOfManufacture,
      bool isSwitchClickSound,
      double? sliderValueCracklingSoundEffect,
      double? sliderValueVoicePrompts,
      bool isFuelSystemError,
      bool isCoolingFireplace,
      bool isBlocButton,
      int passwordBlock,
      bool isPlayFireplace,
      String? dataTimeWorkFireplace,
      bool isOptionTimer});
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
    Object? temperature = null,
    Object? percentOil = null,
    Object? wet = null,
    Object? CO2value = freezed,
    Object? serialNumber = null,
    Object? dcCode = null,
    Object? dateOfManufacture = null,
    Object? isSwitchClickSound = null,
    Object? sliderValueCracklingSoundEffect = freezed,
    Object? sliderValueVoicePrompts = freezed,
    Object? isFuelSystemError = null,
    Object? isCoolingFireplace = null,
    Object? isBlocButton = null,
    Object? passwordBlock = null,
    Object? isPlayFireplace = null,
    Object? dataTimeWorkFireplace = freezed,
    Object? isOptionTimer = null,
  }) {
    return _then(_value.copyWith(
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      percentOil: null == percentOil
          ? _value.percentOil
          : percentOil // ignore: cast_nullable_to_non_nullable
              as double,
      wet: null == wet
          ? _value.wet
          : wet // ignore: cast_nullable_to_non_nullable
              as double,
      CO2value: freezed == CO2value
          ? _value.CO2value
          : CO2value // ignore: cast_nullable_to_non_nullable
              as double?,
      serialNumber: null == serialNumber
          ? _value.serialNumber
          : serialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      dcCode: null == dcCode
          ? _value.dcCode
          : dcCode // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfManufacture: null == dateOfManufacture
          ? _value.dateOfManufacture
          : dateOfManufacture // ignore: cast_nullable_to_non_nullable
              as String,
      isSwitchClickSound: null == isSwitchClickSound
          ? _value.isSwitchClickSound
          : isSwitchClickSound // ignore: cast_nullable_to_non_nullable
              as bool,
      sliderValueCracklingSoundEffect: freezed ==
              sliderValueCracklingSoundEffect
          ? _value.sliderValueCracklingSoundEffect
          : sliderValueCracklingSoundEffect // ignore: cast_nullable_to_non_nullable
              as double?,
      sliderValueVoicePrompts: freezed == sliderValueVoicePrompts
          ? _value.sliderValueVoicePrompts
          : sliderValueVoicePrompts // ignore: cast_nullable_to_non_nullable
              as double?,
      isFuelSystemError: null == isFuelSystemError
          ? _value.isFuelSystemError
          : isFuelSystemError // ignore: cast_nullable_to_non_nullable
              as bool,
      isCoolingFireplace: null == isCoolingFireplace
          ? _value.isCoolingFireplace
          : isCoolingFireplace // ignore: cast_nullable_to_non_nullable
              as bool,
      isBlocButton: null == isBlocButton
          ? _value.isBlocButton
          : isBlocButton // ignore: cast_nullable_to_non_nullable
              as bool,
      passwordBlock: null == passwordBlock
          ? _value.passwordBlock
          : passwordBlock // ignore: cast_nullable_to_non_nullable
              as int,
      isPlayFireplace: null == isPlayFireplace
          ? _value.isPlayFireplace
          : isPlayFireplace // ignore: cast_nullable_to_non_nullable
              as bool,
      dataTimeWorkFireplace: freezed == dataTimeWorkFireplace
          ? _value.dataTimeWorkFireplace
          : dataTimeWorkFireplace // ignore: cast_nullable_to_non_nullable
              as String?,
      isOptionTimer: null == isOptionTimer
          ? _value.isOptionTimer
          : isOptionTimer // ignore: cast_nullable_to_non_nullable
              as bool,
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
      {double temperature,
      double percentOil,
      double wet,
      double? CO2value,
      String serialNumber,
      String dcCode,
      String dateOfManufacture,
      bool isSwitchClickSound,
      double? sliderValueCracklingSoundEffect,
      double? sliderValueVoicePrompts,
      bool isFuelSystemError,
      bool isCoolingFireplace,
      bool isBlocButton,
      int passwordBlock,
      bool isPlayFireplace,
      String? dataTimeWorkFireplace,
      bool isOptionTimer});
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
    Object? temperature = null,
    Object? percentOil = null,
    Object? wet = null,
    Object? CO2value = freezed,
    Object? serialNumber = null,
    Object? dcCode = null,
    Object? dateOfManufacture = null,
    Object? isSwitchClickSound = null,
    Object? sliderValueCracklingSoundEffect = freezed,
    Object? sliderValueVoicePrompts = freezed,
    Object? isFuelSystemError = null,
    Object? isCoolingFireplace = null,
    Object? isBlocButton = null,
    Object? passwordBlock = null,
    Object? isPlayFireplace = null,
    Object? dataTimeWorkFireplace = freezed,
    Object? isOptionTimer = null,
  }) {
    return _then(_$_FireplaceDataModel(
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      percentOil: null == percentOil
          ? _value.percentOil
          : percentOil // ignore: cast_nullable_to_non_nullable
              as double,
      wet: null == wet
          ? _value.wet
          : wet // ignore: cast_nullable_to_non_nullable
              as double,
      CO2value: freezed == CO2value
          ? _value.CO2value
          : CO2value // ignore: cast_nullable_to_non_nullable
              as double?,
      serialNumber: null == serialNumber
          ? _value.serialNumber
          : serialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      dcCode: null == dcCode
          ? _value.dcCode
          : dcCode // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfManufacture: null == dateOfManufacture
          ? _value.dateOfManufacture
          : dateOfManufacture // ignore: cast_nullable_to_non_nullable
              as String,
      isSwitchClickSound: null == isSwitchClickSound
          ? _value.isSwitchClickSound
          : isSwitchClickSound // ignore: cast_nullable_to_non_nullable
              as bool,
      sliderValueCracklingSoundEffect: freezed ==
              sliderValueCracklingSoundEffect
          ? _value.sliderValueCracklingSoundEffect
          : sliderValueCracklingSoundEffect // ignore: cast_nullable_to_non_nullable
              as double?,
      sliderValueVoicePrompts: freezed == sliderValueVoicePrompts
          ? _value.sliderValueVoicePrompts
          : sliderValueVoicePrompts // ignore: cast_nullable_to_non_nullable
              as double?,
      isFuelSystemError: null == isFuelSystemError
          ? _value.isFuelSystemError
          : isFuelSystemError // ignore: cast_nullable_to_non_nullable
              as bool,
      isCoolingFireplace: null == isCoolingFireplace
          ? _value.isCoolingFireplace
          : isCoolingFireplace // ignore: cast_nullable_to_non_nullable
              as bool,
      isBlocButton: null == isBlocButton
          ? _value.isBlocButton
          : isBlocButton // ignore: cast_nullable_to_non_nullable
              as bool,
      passwordBlock: null == passwordBlock
          ? _value.passwordBlock
          : passwordBlock // ignore: cast_nullable_to_non_nullable
              as int,
      isPlayFireplace: null == isPlayFireplace
          ? _value.isPlayFireplace
          : isPlayFireplace // ignore: cast_nullable_to_non_nullable
              as bool,
      dataTimeWorkFireplace: freezed == dataTimeWorkFireplace
          ? _value.dataTimeWorkFireplace
          : dataTimeWorkFireplace // ignore: cast_nullable_to_non_nullable
              as String?,
      isOptionTimer: null == isOptionTimer
          ? _value.isOptionTimer
          : isOptionTimer // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FireplaceDataModel implements _FireplaceDataModel {
  _$_FireplaceDataModel(
      {required this.temperature,
      required this.percentOil,
      required this.wet,
      this.CO2value,
      required this.serialNumber,
      required this.dcCode,
      required this.dateOfManufacture,
      this.isSwitchClickSound = false,
      this.sliderValueCracklingSoundEffect,
      this.sliderValueVoicePrompts,
      this.isFuelSystemError = false,
      this.isCoolingFireplace = false,
      this.isBlocButton = false,
      this.passwordBlock = 5539,
      this.isPlayFireplace = false,
      this.dataTimeWorkFireplace,
      this.isOptionTimer = false});

//значение температуры
  @override
  double temperature;
//значение уровня топлива
  @override
  double percentOil;
//значение влажности
  @override
  double wet;
//значение CO2
  @override
  double? CO2value;
//серийный номер
  @override
  String serialNumber;
//Дс code
  @override
  String dcCode;
//дата производства
  @override
  String dateOfManufacture;
//звук нажатия кнопок
  @override
  @JsonKey()
  bool isSwitchClickSound;
//Звуковой эффект потрескивание дров
  @override
  double? sliderValueCracklingSoundEffect;
//Голосовые подсказки
  @override
  double? sliderValueVoicePrompts;
//если ошибка топливной системы
  @override
  @JsonKey()
  bool isFuelSystemError;
//охлаждение камина начато?
  @override
  @JsonKey()
  bool isCoolingFireplace;
//кнопка блокирования экрана нажата?
  @override
  @JsonKey()
  bool isBlocButton;
//заданный пользователем пароль
  @override
  @JsonKey()
  int passwordBlock;
//пароль по умолчанию
//камин запущен?
  @override
  @JsonKey()
  bool isPlayFireplace;
//общее время работы камина
  @override
  String? dataTimeWorkFireplace;
//есть таймер и включен или нет
  @override
  @JsonKey()
  bool isOptionTimer;

  @override
  String toString() {
    return 'FireplaceDataModel(temperature: $temperature, percentOil: $percentOil, wet: $wet, CO2value: $CO2value, serialNumber: $serialNumber, dcCode: $dcCode, dateOfManufacture: $dateOfManufacture, isSwitchClickSound: $isSwitchClickSound, sliderValueCracklingSoundEffect: $sliderValueCracklingSoundEffect, sliderValueVoicePrompts: $sliderValueVoicePrompts, isFuelSystemError: $isFuelSystemError, isCoolingFireplace: $isCoolingFireplace, isBlocButton: $isBlocButton, passwordBlock: $passwordBlock, isPlayFireplace: $isPlayFireplace, dataTimeWorkFireplace: $dataTimeWorkFireplace, isOptionTimer: $isOptionTimer)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FireplaceDataModelCopyWith<_$_FireplaceDataModel> get copyWith =>
      __$$_FireplaceDataModelCopyWithImpl<_$_FireplaceDataModel>(
          this, _$identity);
}

abstract class _FireplaceDataModel implements FireplaceDataModel {
  factory _FireplaceDataModel(
      {required double temperature,
      required double percentOil,
      required double wet,
      double? CO2value,
      required String serialNumber,
      required String dcCode,
      required String dateOfManufacture,
      bool isSwitchClickSound,
      double? sliderValueCracklingSoundEffect,
      double? sliderValueVoicePrompts,
      bool isFuelSystemError,
      bool isCoolingFireplace,
      bool isBlocButton,
      int passwordBlock,
      bool isPlayFireplace,
      String? dataTimeWorkFireplace,
      bool isOptionTimer}) = _$_FireplaceDataModel;

  @override //значение температуры
  double get temperature; //значение температуры
  set temperature(double value);
  @override //значение уровня топлива
  double get percentOil; //значение уровня топлива
  set percentOil(double value);
  @override //значение влажности
  double get wet; //значение влажности
  set wet(double value);
  @override //значение CO2
  double? get CO2value; //значение CO2
  set CO2value(double? value);
  @override //серийный номер
  String get serialNumber; //серийный номер
  set serialNumber(String value);
  @override //Дс code
  String get dcCode; //Дс code
  set dcCode(String value);
  @override //дата производства
  String get dateOfManufacture; //дата производства
  set dateOfManufacture(String value);
  @override //звук нажатия кнопок
  bool get isSwitchClickSound; //звук нажатия кнопок
  set isSwitchClickSound(bool value);
  @override //Звуковой эффект потрескивание дров
  double?
      get sliderValueCracklingSoundEffect; //Звуковой эффект потрескивание дров
  set sliderValueCracklingSoundEffect(double? value);
  @override //Голосовые подсказки
  double? get sliderValueVoicePrompts; //Голосовые подсказки
  set sliderValueVoicePrompts(double? value);
  @override //если ошибка топливной системы
  bool get isFuelSystemError; //если ошибка топливной системы
  set isFuelSystemError(bool value);
  @override //охлаждение камина начато?
  bool get isCoolingFireplace; //охлаждение камина начато?
  set isCoolingFireplace(bool value);
  @override //кнопка блокирования экрана нажата?
  bool get isBlocButton; //кнопка блокирования экрана нажата?
  set isBlocButton(bool value);
  @override //заданный пользователем пароль
  int get passwordBlock; //заданный пользователем пароль
  set passwordBlock(int value);
  @override //пароль по умолчанию
//камин запущен?
  bool get isPlayFireplace; //пароль по умолчанию
//камин запущен?
  set isPlayFireplace(bool value);
  @override //общее время работы камина
  String? get dataTimeWorkFireplace; //общее время работы камина
  set dataTimeWorkFireplace(String? value);
  @override //есть таймер и включен или нет
  bool get isOptionTimer; //есть таймер и включен или нет
  set isOptionTimer(bool value);
  @override
  @JsonKey(ignore: true)
  _$$_FireplaceDataModelCopyWith<_$_FireplaceDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}
