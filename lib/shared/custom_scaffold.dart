import 'package:fix_ican/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:mh_core/utils/global.dart';

import '../constants/assets_constant.dart';
import '../constants/color_constant.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key,
    this.leading,
    this.leadingIcon,
    this.action,
    this.actionIcon,
    this.title,
    required this.body});

  final Widget? leading;
  final String? leadingIcon;
  final List<Widget>? action;
  final String? actionIcon;
  final Widget? title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.kAppbarColor,
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: leading ??
                Image.asset(
                  leadingIcon ?? AssetsConstant.menu_icon,
                  height: 14,
                ),
          ),
        ),
        title: title ??
            Text.rich(TextSpan(
                text: 'Mustafijur Rahman',
                style: AppTheme.textStyleSemiBoldWhite18,
                children: [
                  TextSpan(
                      text: '\nHome: 52/A, Kalabagan, Dhaka.',
                      style: AppTheme.textStyleSemiBoldWhite12)
                ])),
        actions: action ??
            [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    actionIcon ?? AssetsConstant.bag_icon,
                    height: 24,
                  ),
                ),
              )
            ],
      ),
      backgroundColor: AppColors.kAppbarColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          child: body,
        ),
      ),
    );
  }
}
