import 'package:get/get.dart';

//каждый раз при изменении запускать кодогенерацию
//для запуска кодогенерации flutter packages pub run build_runner build --delete-conflicting-outputs
//чтобы зарегистрировать как фабрику для GetIt и обращаться к сервис локатору через  MainSimpleStateManagement

class MyGetXControllerSmartFireA31000 extends GetxController {
  MyGetXControllerSmartFireA31000 instance = Get.find();
//отдельный функционал для этой модели
//после тестов вынести на слой бизнес логики
}
