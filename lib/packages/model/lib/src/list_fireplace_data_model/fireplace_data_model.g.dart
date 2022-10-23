// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fireplace_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FireplaceDataModel _$$_FireplaceDataModelFromJson(
        Map<String, dynamic> json) =>
    _$_FireplaceDataModel(
      temperature: json['temperature'] as String?,
      percentOil: json['percentOil'] as String?,
      wet: json['wet'] as String?,
      CO2value: json['CO2value'] as String?,
      serialNumber: json['serialNumber'] as String?,
      dcCode: json['dcCode'] as String?,
      dateOfManufacture: json['dateOfManufacture'] as String?,
      isSwitchClickSound: json['isSwitchClickSound'] as bool?,
      isSwitchCracklingSoundEffect:
          json['isSwitchCracklingSoundEffect'] as bool?,
      sliderValueCracklingSoundEffect:
          json['sliderValueCracklingSoundEffect'] as String?,
      sliderValueVoicePrompts: json['sliderValueVoicePrompts'] as String?,
      isFuelSystemError: json['isFuelSystemError'] as bool?,
      isCoolingFireplace: json['isCoolingFireplace'] as bool?,
    );

Map<String, dynamic> _$$_FireplaceDataModelToJson(
        _$_FireplaceDataModel instance) =>
    <String, dynamic>{
      'temperature': instance.temperature,
      'percentOil': instance.percentOil,
      'wet': instance.wet,
      'CO2value': instance.CO2value,
      'serialNumber': instance.serialNumber,
      'dcCode': instance.dcCode,
      'dateOfManufacture': instance.dateOfManufacture,
      'isSwitchClickSound': instance.isSwitchClickSound,
      'isSwitchCracklingSoundEffect': instance.isSwitchCracklingSoundEffect,
      'sliderValueCracklingSoundEffect':
          instance.sliderValueCracklingSoundEffect,
      'sliderValueVoicePrompts': instance.sliderValueVoicePrompts,
      'isFuelSystemError': instance.isFuelSystemError,
      'isCoolingFireplace': instance.isCoolingFireplace,
    };
