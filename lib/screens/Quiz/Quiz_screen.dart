import 'package:adol/screens/Quiz/screens/quiz_screen/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adol/screens/Quiz/screens/result_screen/result_screen.dart';
import 'package:adol/screens/Quiz/screens/welcome_screen.dart';
import 'package:adol/screens/Quiz/utils/bindings_app.dart';

import 'controller/quiz_controller.dart';

class QuizgameScreen extends StatefulWidget {
  @override
  _QuizgameScreenState createState() => _QuizgameScreenState();
}

class _QuizgameScreenState extends State<QuizgameScreen> {
  final QuizController quizController = Get.put(QuizController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Quiz App',
      home: WelcomeScreen(),
      getPages: [
        GetPage(name: WelcomeScreen.routeName, page: () => WelcomeScreen()),
        GetPage(name: QuizScreen.routeName, page: () => QuizScreen()),
        GetPage(name: ResultScreen.routeName, page: () => ResultScreen()),
      ],
    );
  }
}
