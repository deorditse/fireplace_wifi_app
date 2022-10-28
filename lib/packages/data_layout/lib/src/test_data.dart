import 'dart:math';

import 'package:models/models.dart';

List<FireplaceDataModel> get listFireplaceDataModel => [
      ///___________________________________smartPrime_1000___________

      FireplaceDataModel(
        ///Модель
        model: 'smartPrime_1000',

        ///Размер
        size: null,

        ///Статус блокировки
        //кнопка блокирования экрана нажата?
        isBlocButton: false,

        ///Пароль
        passwordBlock: 5539,

        ///Температура
        temperature: Random().nextInt(100).toDouble(),

        ///Влажность
        wet: Random().nextInt(50).toDouble(),

        ///Уровень CO2
        CO2value: null,

        ///Статус состояния камина, ошибки
        statusFireplaceAndErrors: {null: null},

        /// Статус кнопки запуска/остановки
        isPlayFireplace: false,

        ///Количество режимов,  номер режима
        //значение мощности камина / максимальное значение
        sliderValue: {2: 1},

        ///Уровень топлива;
        percentOil: Random().nextInt(100).toDouble(),

        /// S/N - серийный номер
        serialNumber: '1234567${Random().nextInt(1000)}',

        //Дс code
        dcCode: 'null',

        ///Дата производства
        dateOfManufacture: '21.01.1997',

        ///Статус озвучивания нажатий кнопок;
        //звук нажатия кнопок
        isSwitchClickSound: false,

        ///Статус потрескивание дров, уровень громкости
        //Звуковой эффект потрескивание дров
        sliderValueCracklingSoundEffect: null,

        ///Статус голосовые подсказки, уровень громкости;
        //Голосовые подсказки
        sliderValueVoicePrompts: null,
        //если ошибка топливной системы
        isFuelSystemError: false,
        //охлаждение камина начато?
        isCoolingFireplace: false,

        ///Ссылка на инструкцию по эксплуатации
        linkToUserManual: 'test link',

        ///Адрес почты сервисного центра;
        serviceCenterEmailAddress: 'info@abc-fireplace.com',

        ///Ссылка на телефон сервисного центра;
        phoneNumberServiceCenter: '+7 999 98-98-001',

        ///Ссылка на сайт;
        linkOnSite: '',

        ///Статус таймера на отключение, значение таймера на отключение;
        optionTimerStatusAndValue: {null: null},
// //общее время работы камина
//         dataTimeWorkFireplace: '',
//есть таймер и включен или нет
      ),

      ///___________________________________smartFireA7_1000_______________________
      FireplaceDataModel(
        ///Модель
        model: 'smartFireA7_1000',

        ///Размер
        size: null,

        ///Статус блокировки
        //кнопка блокирования экрана нажата?
        isBlocButton: false,

        ///Пароль
        passwordBlock: 5539,

        ///Температура
        temperature: Random().nextInt(60).toDouble(),

        ///Влажность
        wet: Random().nextInt(15).toDouble(),

        ///Уровень CO2
        CO2value: Random().nextInt(50).toDouble(),

        ///Статус состояния камина, ошибки
        statusFireplaceAndErrors: {null: null},

        /// Статус кнопки запуска/остановки
        isPlayFireplace: true,

        ///Количество режимов,  номер режима
        //значение мощности камина / максимальное значение
        sliderValue: {7: 3},

        ///Уровень топлива;
        percentOil: Random().nextInt(100).toDouble(),

        /// S/N - серийный номер
        serialNumber: '1234567${Random().nextInt(1000)}',

        //Дс code
        dcCode: 'null',

        ///Дата производства
        dateOfManufacture: '11.01.2022',

        ///Статус озвучивания нажатий кнопок;

        //звук нажатия кнопок
        isSwitchClickSound: true,

        ///Статус потрескивание дров, уровень громкости
        //Звуковой эффект потрескивание дров
        sliderValueCracklingSoundEffect: 3,

        ///Статус голосовые подсказки, уровень громкости;
        //Голосовые подсказки
        sliderValueVoicePrompts: 2,
        //если ошибка топливной системы
        isFuelSystemError: false,
        //охлаждение камина начато?
        isCoolingFireplace: false,

        ///Ссылка на инструкцию по эксплуатации
        linkToUserManual: 'test link',

        ///Адрес почты сервисного центра;
        serviceCenterEmailAddress: 'info@abc-fireplace.com',

        ///Ссылка на телефон сервисного центра;
        phoneNumberServiceCenter: '+7 999 98-98-001',

        ///Ссылка на сайт;
        linkOnSite: '',

        ///Статус таймера на отключение, значение таймера на отключение;
        optionTimerStatusAndValue: {null: '123456'},
// //общее время работы камина
//         dataTimeWorkFireplace: '',
//есть таймер и включен или нет
      ),

      ///___________________________________smartFireA5_1000_______________________

      FireplaceDataModel(
        ///Модель
        model: 'smartFireA5_1000',

        ///Размер
        size: null,

        ///Статус блокировки
        //кнопка блокирования экрана нажата?
        isBlocButton: true,

        ///Пароль
        passwordBlock: 5539,

        ///Температура
        temperature: Random().nextInt(100).toDouble(),

        ///Влажность
        wet: Random().nextInt(50).toDouble(),

        ///Уровень CO2
        CO2value: null,

        ///Статус состояния камина, ошибки
        statusFireplaceAndErrors: {null: null},

        /// Статус кнопки запуска/остановки
        isPlayFireplace: false,

        ///Количество режимов,  номер режима
        //значение мощности камина / максимальное значение
        sliderValue: {5: 2},

        ///Уровень топлива;
        percentOil: Random().nextInt(100).toDouble(),

        /// S/N - серийный номер
        serialNumber: '1234567${Random().nextInt(1000)}',

        //Дс code
        dcCode: 'null',

        ///Дата производства
        dateOfManufacture: '12.05.2022',

        ///Статус озвучивания нажатий кнопок;
        //звук нажатия кнопок
        isSwitchClickSound: true,

        ///Статус потрескивание дров, уровень громкости
        //Звуковой эффект потрескивание дров
        sliderValueCracklingSoundEffect: 4,

        ///Статус голосовые подсказки, уровень громкости;
        //Голосовые подсказки
        sliderValueVoicePrompts: null,
        //если ошибка топливной системы
        isFuelSystemError: false,
        //охлаждение камина начато?
        isCoolingFireplace: false,

        ///Ссылка на инструкцию по эксплуатации
        linkToUserManual: 'test link',

        ///Адрес почты сервисного центра;
        serviceCenterEmailAddress: 'info@abc-fireplace.com',

        ///Ссылка на телефон сервисного центра;
        phoneNumberServiceCenter: '+7 999 98-98-001',

        ///Ссылка на сайт;
        linkOnSite: '',

        ///Статус таймера на отключение, значение таймера на отключение;
        optionTimerStatusAndValue: {null: 'true'},
// //общее время работы камина
//         dataTimeWorkFireplace: '',
//есть таймер и включен или нет
      ),

      ///___________________________________smartFireA3_1000_______________________

      FireplaceDataModel(
        ///Модель
        model: 'smartFireA3_1000',

        ///Размер
        size: null,

        ///Статус блокировки
        //кнопка блокирования экрана нажата?
        isBlocButton: false,

        ///Пароль
        passwordBlock: 5539,

        ///Температура
        temperature: Random().nextInt(100).toDouble(),

        ///Влажность
        wet: Random().nextInt(50).toDouble(),

        ///Уровень CO2
        CO2value: null,

        ///Статус состояния камина, ошибки
        statusFireplaceAndErrors: {null: null},

        /// Статус кнопки запуска/остановки
        isPlayFireplace: false,

        ///Количество режимов,  номер режима
        //значение мощности камина / максимальное значение
        sliderValue: {3: 2},

        ///Уровень топлива;
        percentOil: Random().nextInt(100).toDouble(),

        /// S/N - серийный номер
        serialNumber: '1234567${Random().nextInt(1000)}',

        //Дс code
        dcCode: 'null',

        ///Дата производства
        dateOfManufacture: '10.08.2022',

        ///Статус озвучивания нажатий кнопок;
        //звук нажатия кнопок
        isSwitchClickSound: true,

        ///Статус потрескивание дров, уровень громкости
        //Звуковой эффект потрескивание дров
        sliderValueCracklingSoundEffect: 4,

        ///Статус голосовые подсказки, уровень громкости;
        //Голосовые подсказки
        sliderValueVoicePrompts: null,
        //если ошибка топливной системы
        isFuelSystemError: false,
        //охлаждение камина начато?
        isCoolingFireplace: false,

        ///Ссылка на инструкцию по эксплуатации
        linkToUserManual: 'test link',

        ///Адрес почты сервисного центра;
        serviceCenterEmailAddress: 'info@abc-fireplace.com',

        ///Ссылка на телефон сервисного центра;
        phoneNumberServiceCenter: '+7 999 98-98-001',

        ///Ссылка на сайт;
        linkOnSite: '',

        ///Статус таймера на отключение, значение таймера на отключение;
        optionTimerStatusAndValue: {null: null},
// //общее время работы камина
//         dataTimeWorkFireplace: '',
//есть таймер и включен или нет
      ),
    ];
