import 'package:fix_ican/pages/home/home_page.dart';
import 'package:fix_ican/pages/profile/profile_page.dart';
import 'package:fix_ican/pages/services/service_page.dart';
import 'package:fix_ican/pages/settings/setting_page.dart';
import 'package:fix_ican/shared/custom_sized_box.dart';
import 'package:fix_ican/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/button/custom_button.dart';

import '../constants/assets_constant.dart';
import '../constants/color_constant.dart';
import 'enums.dart';

class CustomScaffold extends StatefulWidget {
  const CustomScaffold({super.key, this.leading, this.leadingIcon, this.action, this.actionIcon, this.title, this.body, this.bottom, this.appBar, this.floatButton});

  final Widget? leading;
  final String? leadingIcon;
  final List<Widget>? action;
  final String? actionIcon;
  final Widget? title;
  final AppBar? appBar;
  final Widget? body;
  final Widget? bottom;
  final Widget? floatButton;

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  bool isContainerVisible = false;
  double containerWidth = 0.0;
  NavigationType _navigationType = NavigationType.home;

  void toggleContainerVisibility() {
    setState(() {
      isContainerVisible = !isContainerVisible;
      if (isContainerVisible) {
      } else {
        containerWidth = 0.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar ??
          AppBar(
            elevation: 0,
            backgroundColor: AppColors.kAppbarColor,
            leading: widget.leading ??
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      widget.leadingIcon ?? AssetsConstant.menu_icon,
                      height: 14,
                    ),
                  ),
                ),
            title: widget.title ??
                Text.rich(_navigationType == NavigationType.service
                    ? const TextSpan(
                        text: 'My Services',
                        style: AppTheme.textStyleSemiBoldWhite18,
                      )
                    : _navigationType == NavigationType.settings
                        ? const TextSpan(
                            text: 'Settings',
                            style: AppTheme.textStyleSemiBoldWhite18,
                          )
                        : _navigationType == NavigationType.profile
                            ? const TextSpan(
                                text: 'My Profile',
                                style: AppTheme.textStyleSemiBoldWhite18,
                              )
                            : const TextSpan(
                                text: 'Mustafijur Rahman',
                                style: AppTheme.textStyleSemiBoldWhite18,
                                children: [TextSpan(text: '\nHome: 52/A, Kalabagan, Dhaka.', style: AppTheme.textStyleSemiBoldWhite12)])),
            actions: widget.action ??
                [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        widget.actionIcon ?? AssetsConstant.bag_icon,
                        height: 24,
                      ),
                    ),
                  )
                ],
          ),
      backgroundColor: AppColors.kAppbarColor,
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: MediaQuery.of(context).size.height - (kToolbarHeight + 30),
            clipBehavior: Clip.none,
            decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            child: SingleChildScrollView(
              child: widget.body,
            ),
          ),
          widget.bottom ?? const SizedBox.shrink(),
        ],
      ),
      floatingActionButton: widget.floatButton ??
          Container(
            child: _navigationType == NavigationType.service
                ? GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CenterDialogWidget(
                            stacked: false,
                            padding: const EdgeInsets.only(top: 16),
                            title: const Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('2 Running Services', style: AppTheme.textStyleSemiBoldBlack14),
                                CustomSizedBox.space12H,
                                Divider(
                                  thickness: 2,
                                  color: Color(0xffF1B2BF),
                                ),
                              ],
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const ServiceHeadingWidget(),
                                const Divider(
                                  thickness: 0.5,
                                  color: Color(0xffF1B2BF),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Maid Info',
                                    style: AppTheme.textStyleSemiBoldFadeBlack14,
                                  ),
                                ),
                                CustomSizedBox.space16H,
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: FittedBox(
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                          child: Image.asset(
                                            AssetsConstant.dummy_service,
                                            height: 64,
                                            width: 64,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        CustomSizedBox.space12W,
                                        const Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Shahida Parvin',
                                              style: AppTheme.textStyleSemiBoldBlack18,
                                            ),
                                            CustomSizedBox.space4H,
                                            Text(
                                              'User Id: CAE43456',
                                              style: AppTheme.textStyleSemiBoldBlack12,
                                            ),
                                            CustomSizedBox.space4H,
                                            Text(
                                              'Has been assigned for your service.',
                                              style: AppTheme.textStyleMediumFadeBlack12,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                CustomSizedBox.space16H,
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Location Info',
                                      style: AppTheme.textStyleSemiBoldFadeBlack14,
                                    )),
                                CustomSizedBox.space12H,
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(90),
                                        color: AppColors.kAppbarColor,
                                      ),
                                      padding: const EdgeInsets.all(6),
                                      child: const Icon(
                                        Icons.location_pin,
                                        color: Colors.white,
                                      ),
                                    ),
                                    CustomSizedBox.space8W,
                                    Text(
                                      '52/A, Kalabagan, Dhanmondi-32',
                                      style: AppTheme.textStyleSemiBoldFadeBlack14,
                                    ),
                                  ],
                                ),
                                CustomButton(onPressed: () {}, marginVertical: 24, marginHorizontal: 0, borderRadiusAll: 22, label: 'Scan Maid ID'),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 44),
                      height: 48,
                      width: 48,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: AppColors.kPrimaryColor,
                          borderRadius: BorderRadius.circular(90),
                          boxShadow: [BoxShadow(blurRadius: 8, color: Colors.black.withOpacity(.2))],
                          border: Border.all(width: 3, color: Colors.white)),
                      child: Image.asset(
                        AssetsConstant.scan_icon,
                        height: 15,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
    );
  }
}
