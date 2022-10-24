import 'package:fireplace_wifi_app/packages/ui_layout/all_pages/fireplace_pages/body_fireplace_page.dart';
import 'package:fireplace_wifi_app/packages/ui_layout/style_app/style.dart';
import 'package:flutter/material.dart';
import 'package:fireplace_wifi_app/packages/business_layout/lib/business_layout.dart';
import 'package:get/get.dart';
import 'pages/block_page/block_page.dart';
import 'pages/setting_page/setting_page.dart';
import 'widgets/app_bar/app_bar_fireplace.dart';
import 'widgets/bottom_row_with_parameters/bottom_row_with_parameters.dart';
import 'widgets/tittle_fireplace_model_name.dart';
import 'package:dio/dio.dart';

class FireplacePage extends StatefulWidget {
  static const String id = '/fireplacePage';

  const FireplacePage({Key? key}) : super(key: key);

  @override
  State<FireplacePage> createState() => _FireplacePageState();
}

class _FireplacePageState extends State<FireplacePage> {
  String errorMessage = '';
  bool hasError = false;
  bool isLoading = false;
  List<dynamic> dataList = [];
  Dio _dio = Dio();

  @override
  void initState() {
    super.initState();
    getDataDio();
  }

  void getDataDio() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await _dio
          .get('https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301');
      var data = response.data;
      print(
          '_______________________test get data dio from server __________ : ${data}');
      dataList = data;
      // .map<String>((hotel) => HotelPreview.fromJson(hotel))
      // .toList();
      // print('test get data dio from server __________ : ${dataList.toString()}');
    } on DioError catch (error) {
      setState(() {
        errorMessage =
            "Контент временно недоступен \nstatus ${error.response?.statusCode!}";
        print('${error.message}');
        hasError = true;
        isLoading = false;
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    /// обернуть чтобы не было перехода назад
    // WillPopScope(
    //       onWillPop: () async => true,
    return Container(
      //чтобы сделать фон в градиент
      decoration: myDecorationBackground,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        //чтобы клава не сдвигала контент
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                appBarFireplace(context: context),
                BodyPageSmartFireA71000(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BodyPageSmartFireA71000 extends StatelessWidget {
  BodyPageSmartFireA71000({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: GetBuilder<FireplaceConnectionGetXController>(
            builder: (controllerApp) {
              if (controllerApp.isBlocButton) {
                //если камин заблокирован
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    myTitleModel(),
                    Expanded(
                      child: Center(
                        child: BodyBlockFireplace(),
                      ),
                    ),
                    bottomRowWithParameters(context),
                  ],
                );
              } else {
                if (controllerApp.isSettingButton) {
                  //если нажата кнопка настройки
                  return const BodySettingPage();
                } else {
                  //основной контент
                  return BodyFireplacePage();
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
