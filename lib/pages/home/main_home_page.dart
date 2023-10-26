import 'dart:io';

import 'package:fix_ican/pages/home/home_page.dart';
import 'package:fix_ican/pages/profile/profile_page.dart';
import 'package:fix_ican/pages/services/service_page.dart';
import 'package:fix_ican/pages/settings/setting_page.dart';
import 'package:fix_ican/shared/custom_sized_box.dart';
import 'package:fix_ican/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/button/custom_button.dart';

import '../../constants/assets_constant.dart';
import '../../constants/color_constant.dart';
import '../../shared/enums.dart';

class MainHomeScreen extends StatefulWidget {
  static const String routeName = '/main-home';

  const MainHomeScreen(
      {super.key,
      this.leading,
      this.leadingIcon,
      this.action,
      this.actionIcon,
      this.title,
      this.body,
      this.bottom,
      this.appBar,
      this.floatButton});

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
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  bool isContainerVisible = false;
  double containerWidth = 0.0;
  NavigationType _navigationType = NavigationType.home;
  Widget? _body;

  @override
  void initState() {
    _body = widget.body ?? const HomeScreen();
    super.initState();
  }

  void toggleContainerVisibility() {
    setState(() {
      isContainerVisible = !isContainerVisible;
      if (isContainerVisible) {
      } else {
        containerWidth = 0.0;
      }
    });
  }

  Future<void> openDialog() async {
    switch (await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                  'Are you sure to exit app?',
                  style: AppTheme.textStyleSemiBoldPrimary20,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                    onPressed: () {
                      Navigator.pop(context, 0);
                    },
                    width: MediaQuery.of(context).size.width / 6,
                    labelColor: AppColors.kPrimaryColor,
                    boxShadowColor: Colors.transparent,
                    isBorder: true,
                    borderColor: AppColors.kPrimaryColor,
                    primary: Colors.white,
                    marginVertical: 6,
                    marginHorizontal: 0,
                    borderRadiusAll: 22,
                    label: 'Cancel'),
                CustomButton(
                    onPressed: () {
                      Navigator.pop(context, 1);
                    },
                    width: MediaQuery.of(context).size.width / 6,
                    marginVertical: 6,
                    marginHorizontal: 6,
                    borderRadiusAll: 22,
                    label: 'Exit')
              ],
            )
          ],
        );
      },
    )) {
      case 0:
        break;
      case 1:
        exit(0);
    }
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
                                children: [
                                    TextSpan(
                                        text: '\nHome: 52/A, Kalabagan, Dhaka.',
                                        style:
                                            AppTheme.textStyleSemiBoldWhite12)
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
      body: WillPopScope(
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                child: Container(
                  height: MediaQuery.of(context).size.height -
                      (kToolbarHeight + 30),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  child: SingleChildScrollView(
                    child: ClipRRect(
                        clipBehavior: Clip.none,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                        child: _body),
                  ),
                ),
              ),
              widget.bottom ??
                  Positioned(
                    bottom: 0,
                    child: SizedBox(
                      height: 56,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          AnimatedPositioned(
                              left: isContainerVisible
                                  ? 0
                                  : MediaQuery.of(context).size.width / 2,
                              right: isContainerVisible
                                  ? 0
                                  : MediaQuery.of(context).size.width / 2,
                              top: isContainerVisible ? 0 : 40,
                              bottom: isContainerVisible ? 0 : 40,
                              duration: const Duration(milliseconds: 500),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
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
                                child: Stack(
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      height: 80,
                                      width: MediaQuery.of(context).size.width,
                                    ),
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: AnimatedContainer(
                                          decoration: BoxDecoration(
                                              color: _navigationType ==
                                                      NavigationType.home
                                                  ? AppColors.kPrimaryColor
                                                  : null,
                                              borderRadius:
                                                  BorderRadius.circular(33),
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 10,
                                                    color: _navigationType ==
                                                            NavigationType.home
                                                        ? Colors.black
                                                            .withOpacity(.16)
                                                        : Colors.transparent)
                                              ]),
                                          padding: _navigationType ==
                                                  NavigationType.home
                                              ? const EdgeInsets.all(8)
                                              : const EdgeInsets.all(6.0),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 8),
                                          curve: Curves.fastLinearToSlowEaseIn,
                                          duration:
                                              const Duration(milliseconds: 800),
                                          child: InkWell(
                                              onTap: () {
                                                _navigationType =
                                                    NavigationType.home;
                                                _body = const HomeScreen();
                                                setState(() {});
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Image.asset(
                                                    AssetsConstant.home_icon,
                                                    color: _navigationType ==
                                                            NavigationType.home
                                                        ? Colors.white
                                                        : null,
                                                    height: 15,
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
                                    ),
                                    Positioned(
                                      left: (MediaQuery.of(context).size.width *
                                              .2) -
                                          (_navigationType ==
                                                  NavigationType.service
                                              ? (MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .08)
                                              : 0),
                                      top: 0,
                                      child: AnimatedContainer(
                                          decoration: BoxDecoration(
                                              color: _navigationType ==
                                                      NavigationType.service
                                                  ? AppColors.kPrimaryColor
                                                  : null,
                                              borderRadius:
                                                  BorderRadius.circular(33),
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 10,
                                                  color: _navigationType ==
                                                          NavigationType.service
                                                      ? Colors.black
                                                          .withOpacity(.16)
                                                      : Colors.transparent,
                                                )
                                              ]),
                                          padding: _navigationType ==
                                                  NavigationType.service
                                              ? const EdgeInsets.all(8)
                                              : const EdgeInsets.all(6.0),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 8),
                                          curve: Curves.fastLinearToSlowEaseIn,
                                          duration:
                                              const Duration(milliseconds: 800),
                                          child: InkWell(
                                              onTap: () {
                                                _navigationType =
                                                    NavigationType.service;
                                                _body = const ServicesScreen();

                                                setState(() {});
                                              },
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    AssetsConstant.service_icon,
                                                    color: _navigationType ==
                                                            NavigationType
                                                                .service
                                                        ? Colors.white
                                                        : null,
                                                    height: 15,
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
                                    ),
                                    // SizedBox(
                                    //   width:
                                    //       MediaQuery.of(context).size.width / 9,
                                    // ),
                                    Positioned(
                                      right:
                                          (MediaQuery.of(context).size.width *
                                                  .2) -
                                              (_navigationType ==
                                                      NavigationType.settings
                                                  ? (MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .08)
                                                  : 0),
                                      top: 0,
                                      child: AnimatedContainer(
                                          decoration: BoxDecoration(
                                              color: _navigationType ==
                                                      NavigationType.settings
                                                  ? AppColors.kPrimaryColor
                                                  : null,
                                              borderRadius:
                                                  BorderRadius.circular(33),
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 10,
                                                    color: _navigationType ==
                                                            NavigationType
                                                                .settings
                                                        ? Colors.black
                                                            .withOpacity(.16)
                                                        : Colors.transparent)
                                              ]),
                                          padding: _navigationType ==
                                                  NavigationType.settings
                                              ? const EdgeInsets.all(8)
                                              : const EdgeInsets.all(6.0),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 8),
                                          curve: Curves.fastLinearToSlowEaseIn,
                                          duration:
                                              const Duration(milliseconds: 800),
                                          child: InkWell(
                                              onTap: () {
                                                _navigationType =
                                                    NavigationType.settings;
                                                _body = const SettingScreen();
                                                setState(() {});
                                              },
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    AssetsConstant
                                                        .settings_icon,
                                                    color: _navigationType ==
                                                            NavigationType
                                                                .settings
                                                        ? Colors.white
                                                        : null,
                                                    height: 15,
                                                  ),
                                                  CustomSizedBox.space4W,
                                                  _navigationType ==
                                                          NavigationType
                                                              .settings
                                                      ? const Text(
                                                          'Setting',
                                                          style: AppTheme
                                                              .textStyleMediumWhite10,
                                                        )
                                                      : const SizedBox.shrink()
                                                ],
                                              ))),
                                    ),
                                    Positioned(
                                      right: 0,
                                      top: 0,
                                      child: AnimatedContainer(
                                          decoration: BoxDecoration(
                                              color: _navigationType ==
                                                      NavigationType.profile
                                                  ? AppColors.kPrimaryColor
                                                  : null,
                                              borderRadius:
                                                  BorderRadius.circular(33),
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 10,
                                                  color: _navigationType ==
                                                          NavigationType.profile
                                                      ? Colors.black
                                                          .withOpacity(.16)
                                                      : Colors.transparent,
                                                )
                                              ]),
                                          padding: _navigationType ==
                                                  NavigationType.profile
                                              ? const EdgeInsets.all(8)
                                              : const EdgeInsets.all(6.0),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 8),
                                          curve: Curves.fastLinearToSlowEaseIn,
                                          duration:
                                              const Duration(milliseconds: 800),
                                          child: InkWell(
                                              onTap: () {
                                                _navigationType =
                                                    NavigationType.profile;
                                                _body = const ProfileScreen();
                                                setState(() {});
                                              },
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    AssetsConstant.account_icon,
                                                    color: _navigationType ==
                                                            NavigationType
                                                                .profile
                                                        ? Colors.white
                                                        : null,
                                                    height: 15,
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
                                    ),
                                  ],
                                ),
                              )),
                          Positioned(
                              left:
                                  (MediaQuery.of(context).size.width / 2) - 31,
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
          onWillPop: () {
            if (_navigationType != NavigationType.home) {
              _body = HomeScreen();
              _navigationType = NavigationType.home;
              setState(() {});
            } else {
              openDialog();
            }
            return Future.value(false);
          }),
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
                                Text('2 Running Services',
                                    style: AppTheme.textStyleSemiBoldBlack14),
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
                                    style:
                                        AppTheme.textStyleSemiBoldFadeBlack14,
                                  ),
                                ),
                                CustomSizedBox.space16H,
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: FittedBox(
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.asset(
                                            AssetsConstant.dummy_service,
                                            height: 64,
                                            width: 64,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        CustomSizedBox.space12W,
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Shahida Parvin',
                                              style: AppTheme
                                                  .textStyleSemiBoldBlack18,
                                            ),
                                            CustomSizedBox.space4H,
                                            Text(
                                              'User Id: CAE43456',
                                              style: AppTheme
                                                  .textStyleSemiBoldBlack12,
                                            ),
                                            CustomSizedBox.space4H,
                                            Text(
                                              'Has been assigned for your service.',
                                              style: AppTheme
                                                  .textStyleMediumFadeBlack12,
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
                                      style:
                                          AppTheme.textStyleSemiBoldFadeBlack14,
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
                                      style:
                                          AppTheme.textStyleSemiBoldFadeBlack14,
                                    ),
                                  ],
                                ),
                                CustomButton(
                                    onPressed: () {},
                                    marginVertical: 24,
                                    marginHorizontal: 0,
                                    borderRadiusAll: 22,
                                    label: 'Scan Maid ID'),
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
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 8,
                                color: Colors.black.withOpacity(.2))
                          ],
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
