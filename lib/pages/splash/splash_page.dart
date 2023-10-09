import 'package:fix_ican/pages/splash/language_selection_page.dart';
import 'package:fix_ican/pages/splash/splash_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Get.toNamed(LanguageSelectionScreen.routeName);
    });
    return Scaffold(
      body: SplashWidget(),
    );
  }
}
