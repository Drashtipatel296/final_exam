import 'dart:async';
import 'package:final_exam/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Get.to(HomeScreen());
    },);

    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 150,
            width: 150,
            child: Image.asset('assets/img/splash.png'),),
      ),
    );
  }
}
