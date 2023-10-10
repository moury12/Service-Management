import 'package:fix_ican/constants/color_constant.dart';
import 'package:fix_ican/pages/home/home_page.dart';
import 'package:fix_ican/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mh_core/utils/color/custom_color.dart';

import 'routes/app_routes_page.dart';

void main() {
  CustomColor.setPrimaryColor(AppColors.kPrimaryColor);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fix Ican',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      getPages: AppRoutes.routes(),
      initialRoute: HomeScreen.routeName,
      //initialBinding: AuthBinding(),
    );
    ;
  }
}
