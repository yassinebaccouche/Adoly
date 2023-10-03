import 'package:get/get.dart';
import 'package:adol/screens/Quiz/controller/quiz_controller.dart';

class BilndingsApp implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuizController());
  }
}
