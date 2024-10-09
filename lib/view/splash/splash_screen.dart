import 'dart:async';
import 'package:final_exam/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/notes_model.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NotesModel initialNote = NotesModel(id: 1, note: "This is your first note!");
    Timer(const Duration(seconds: 5), () {
      Get.to(HomeScreen(notes: initialNote));
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
