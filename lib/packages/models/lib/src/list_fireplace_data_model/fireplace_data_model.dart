import 'package:freezed_annotation/freezed_annotation.dart';

// // part 'fireplace_data_model.g.dart';

part 'fireplace_data_model.freezed.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

//Модель; Размер; Статус блокировки; Пароль; Температура; Влажность;
// Уровень CO2; Статус состояния камина, ошибки; Статус кнопки запуска/остановки;Количество режимов,  номер режима;
// Уровень топлива; S/N; Дата производства; Статус потрескивание дров, уровень громкости; Статус голосовые подсказки, уровень громкости; Видимость регулятора уровня пламени; Статус озвучивания нажатий кнопок; Ссылка на инструкцию по эксплуатации; Адрес почты сервисного центра; Ссылка на телефон сервисного центра; Ссылка на сайт; Статус таймера на отключение, значение таймера на отключение; Счет времени работы камина.

@unfreezed
class FireplaceDataModel with _$FireplaceDataModel {
  factory FireplaceDataModel({
    ///Модель
    String? model,

    ///Размер
    double? size,

    ///Статус блокировки
    //кнопка блокирования экрана нажата?
    @Default(false) bool isBlocButton,

    ///Пароль
    //заданный пользователем пароль
    @Default(5539) int passwordBlock, //пароль по умолчанию

    ///Температура
    double? temperature,

    ///Влажность
    double? wet,

    ///Уровень CO2
    double? CO2value,

    ///Статус состояния камина, ошибки
    required Map<bool?, String?> statusFireplaceAndErrors,

    /// Статус кнопки запуска/остановки
    //камин запущен?
    @Default(false) bool isPlayFireplace,

    ///Количество режимов,  номер режима
    // максимальное значение / значение мощности камина
    required Map<int?, int?> sliderValue,

    ///Уровень топлива;
    double? percentOil,

    /// S/N - серийный номер
    //серийный номер
    String? serialNumber,

    ///Дата производства
    String? dateOfManufacture,

    ///Статус потрескивание дров, уровень громкости
    //Звуковой эффект потрескивание дров
    double? sliderValueCracklingSoundEffect,

    ///Статус голосовые подсказки, уровень громкости;
    //Голосовые подсказки
    double? sliderValueVoicePrompts,

    ///Статус озвучивания нажатий кнопок;
    @Default(false) bool isSwitchClickSound,

    ///Ссылка на инструкцию по эксплуатации
    String? linkToUserManual,

    ///Адрес почты сервисного центра;
    String? serviceCenterEmailAddress,

    ///Ссылка на телефон сервисного центра;
    String? phoneNumberServiceCenter,

    ///Ссылка на сайт;
    String? linkOnSite,

    ///Статус таймера на отключение, значение таймера на отключение;
    required Map<bool?, String?> optionTimerStatusAndValue,

    ///Счет времени работы камина.

    //Дс code
    String? dcCode,

    //если ошибка топливной системы
    @Default(false) bool isFuelSystemError,

    //охлаждение камина начато?
    @Default(false) bool isCoolingFireplace,

    //общее время работы камина
    String? dataTimeWorkFireplace,

    // //есть таймер и включен или нет
    // @Default(false) bool isOptionTimer,
  }) = _FireplaceDataModel;
}
