import 'package:fix_ican/pages/home/home_page.dart';
import 'package:fix_ican/pages/services/service_page.dart';
import 'package:fix_ican/shared/custom_sized_box.dart';
import 'package:fix_ican/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/assets_constant.dart';
import '../constants/color_constant.dart';
import 'enums.dart';

class CustomScaffold extends StatefulWidget {
  static const String routeName = '/custom';

  const CustomScaffold({super.key,
    this.leading,
    this.leadingIcon,
    this.action,
    this.actionIcon,
    this.title,
    this.body,
    this.bottom,
    this.appBar});

  final Widget? leading;
  final String? leadingIcon;
  final List<Widget>? action;
  final String? actionIcon;
  final Widget? title;
  final AppBar? appBar;
  final Widget? body;
  final Widget? bottom;

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  bool isContainerVisible = false;
  double containerWidth = 0.0;
  NavigationType _navigationType = NavigationType.home;
  Widget? _body;

  // set body(Widget? newBody) {
  //   _body = newBody;
  //   // _updateCurrentBody();
  // // }

  // void _updateCurrentBody() {
  //   switch (_navigationType) {
  //     case NavigationType.home:
  //       _currentBody = HomeScreen(); // Replace with your home screen widget.
  //       break;
  //     case NavigationType.service:
  //       _currentBody =
  //           ServicesScreen(); // Replace with your service screen widget.
  //       break;
  //     // Add cases for other navigation types.
  //     default:
  //       _currentBody =
  //           Container(); // Default to an empty container or your choice.
  //       break;
  //   }
  // }
  // void _updateCurrentBody() {
  //   _currentBody = _body ??
  //       Container(); // Use _body value if it's set, otherwise use a default value.
  // }

  void toggleContainerVisibility() {
    setState(() {
      isContainerVisible = !isContainerVisible;
      if (isContainerVisible) {} else {
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
                const Text.rich(TextSpan(
                    text: 'Mustafijur Rahman',
                    style: AppTheme.textStyleSemiBoldWhite18,
                    children: [
                      TextSpan(
                          text: '\nHome: 52/A, Kalabagan, Dhaka.',
                          style: AppTheme.textStyleSemiBoldWhite12)
                    ])),
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
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height,

                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                      child: widget.body),
                ),
                // SizedBox(
                //   height: 80,
                // ),
              ],
            ),
          ),
          widget.bottom ??
              Positioned(
                bottom: 0,
                child: SizedBox(
                  height: 56,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                          left: isContainerVisible
                              ? 0
                              : MediaQuery
                              .of(context)
                              .size
                              .width / 2,
                          right: isContainerVisible
                              ? 0
                              : MediaQuery
                              .of(context)
                              .size
                              .width / 2,
                          top: isContainerVisible ? 0 : 40,
                          bottom: isContainerVisible ? 0 : 40,
                          duration: const Duration(milliseconds: 500),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            height: isContainerVisible ? 0 : 56,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 6),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(33),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10,
                                      color: Colors.black.withOpacity(.16))
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AnimatedContainer(
                                    decoration: BoxDecoration(
                                        color: _navigationType ==
                                            NavigationType.home
                                            ? AppColors.kPrimaryColor
                                            : null,
                                        borderRadius: BorderRadius.circular(33),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 10,
                                              color: _navigationType ==
                                                  NavigationType.home
                                                  ? Colors.black
                                                  .withOpacity(.16)
                                                  : Colors.transparent)
                                        ]),
                                    padding:
                                    _navigationType == NavigationType.home
                                        ? const EdgeInsets.all(8)
                                        : EdgeInsets.all(6.0),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 8),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    duration: const Duration(milliseconds: 800),
                                    child: InkWell(
                                        onTap: () {
                                          _navigationType = NavigationType.home;
                                          // _currentBody = HomeScreen();
                                          setState(() {});
                                        },
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              AssetsConstant.home_icon,
                                              color: _navigationType ==
                                                  NavigationType.home
                                                  ? Colors.white
                                                  : null,
                                            ),
                                            CustomSizedBox.space4W,
                                            _navigationType ==
                                                NavigationType.home
                                                ? const Text(
                                              'Home',
                                              style: AppTheme
                                                  .textStyleMediumWhite10,
                                            )
                                                : const SizedBox.shrink()
                                          ],
                                        ))),
                                AnimatedContainer(
                                    decoration: BoxDecoration(
                                        color: _navigationType ==
                                            NavigationType.service
                                            ? AppColors.kPrimaryColor
                                            : null,
                                        borderRadius: BorderRadius.circular(33),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 10,
                                            color: _navigationType ==
                                                NavigationType.service
                                                ? Colors.black.withOpacity(.16)
                                                : Colors.transparent,
                                          )
                                        ]),
                                    padding: _navigationType ==
                                        NavigationType.service
                                        ? const EdgeInsets.all(8)
                                        : EdgeInsets.all(6.0),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 8),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    duration: const Duration(milliseconds: 800),
                                    child: InkWell(
                                        onTap: () {
                                          _navigationType =
                                              NavigationType.service;
                                          Get.toNamed(ServicesScreen.routeName);
                                          setState(() {});
                                        },
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              AssetsConstant.service_icon,
                                              color: _navigationType ==
                                                  NavigationType.service
                                                  ? Colors.white
                                                  : null,
                                            ),
                                            CustomSizedBox.space4W,
                                            _navigationType ==
                                                NavigationType.service
                                                ? const Text(
                                              'Service',
                                              style: AppTheme
                                                  .textStyleMediumWhite10,
                                            )
                                                : const SizedBox.shrink()
                                          ],
                                        ))),
                                SizedBox(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width / 9,
                                ),
                                AnimatedContainer(
                                    decoration: BoxDecoration(
                                        color: _navigationType ==
                                            NavigationType.settings
                                            ? AppColors.kPrimaryColor
                                            : null,
                                        borderRadius: BorderRadius.circular(33),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 10,
                                              color: _navigationType ==
                                                  NavigationType.settings
                                                  ? Colors.black
                                                  .withOpacity(.16)
                                                  : Colors.transparent)
                                        ]),
                                    padding: _navigationType ==
                                        NavigationType.settings
                                        ? const EdgeInsets.all(8)
                                        : EdgeInsets.all(6.0),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 8),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    duration: const Duration(milliseconds: 800),
                                    child: InkWell(
                                        onTap: () {
                                          _navigationType =
                                              NavigationType.settings;
                                          setState(() {});
                                        },
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              AssetsConstant.settings_icon,
                                              color: _navigationType ==
                                                  NavigationType.settings
                                                  ? Colors.white
                                                  : null,
                                            ),
                                            CustomSizedBox.space4W,
                                            _navigationType ==
                                                NavigationType.settings
                                                ? const Text(
                                              'Setting',
                                              style: AppTheme
                                                  .textStyleMediumWhite10,
                                            )
                                                : const SizedBox.shrink()
                                          ],
                                        ))),
                                AnimatedContainer(
                                    decoration: BoxDecoration(
                                        color: _navigationType ==
                                            NavigationType.profile
                                            ? AppColors.kPrimaryColor
                                            : null,
                                        borderRadius: BorderRadius.circular(33),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 10,
                                            color: _navigationType ==
                                                NavigationType.profile
                                                ? Colors.black.withOpacity(.16)
                                                : Colors.transparent,
                                          )
                                        ]),
                                    padding: _navigationType ==
                                        NavigationType.profile
                                        ? const EdgeInsets.all(8)
                                        : EdgeInsets.all(6.0),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 8),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    duration: const Duration(milliseconds: 800),
                                    child: InkWell(
                                        onTap: () {
                                          _navigationType =
                                              NavigationType.profile;
                                          setState(() {});
                                        },
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              AssetsConstant.account_icon,
                                              color: _navigationType ==
                                                  NavigationType.profile
                                                  ? Colors.white
                                                  : null,
                                            ),
                                            CustomSizedBox.space4W,
                                            _navigationType ==
                                                NavigationType.profile
                                                ? const Text(
                                              'Profile',
                                              style: AppTheme
                                                  .textStyleMediumWhite10,
                                            )
                                                : const SizedBox.shrink()
                                          ],
                                        ))),
                              ],
                            ),
                          )),
                      Positioned(
                          left: (MediaQuery
                              .of(context)
                              .size
                              .width / 2) - 31,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isContainerVisible = !isContainerVisible;
                              });
                            },
                            // child: AnimatedIcon(icon: AnimatedIcons.arrow_menu,progress: ),
                            child: Image.asset(
                              !isContainerVisible
                                  ? AssetsConstant.middlebottomIcon
                                  : AssetsConstant.middlebottomIcon2,
                              height: 62,
                            ),
                          )),
                    ],
                  ),
                ),
              )
        ],
      ),
    );
  }
}
