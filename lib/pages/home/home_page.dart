import 'package:fix_ican/constants/assets_constant.dart';
import 'package:fix_ican/constants/color_constant.dart';
import 'package:fix_ican/theme/theme_data.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.kAppbarColor,
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              AssetsConstant.menu_icon,
              height: 14,
            ),
          ),
        ),
        title: Text.rich(TextSpan(
            text: 'Mustafijur Rahman',
            style: AppTheme.textStyleSemiBoldWhite18,
            children: [
              TextSpan(
                  text: 'Home: 52/A, Kalabagan, Dhaka.',
                  style: AppTheme.textStyleSemiBoldWhite12)
            ])),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                AssetsConstant.bag_icon,
                height: 24,
              ),
            ),
          )
        ],
      ),
    );
  }
}
