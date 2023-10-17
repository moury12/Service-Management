import 'package:fix_ican/pages/home/home_page.dart';
import 'package:fix_ican/pages/services/service_page.dart';
import 'package:fix_ican/shared/custom_sized_box.dart';
import 'package:fix_ican/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/button/custom_button.dart';

import '../constants/assets_constant.dart';
import '../constants/color_constant.dart';
import 'enums.dart';

class CustomScaffold extends StatefulWidget {
  static const String routeName = '/custom';

  const CustomScaffold(
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
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  bool isContainerVisible = false;
  double containerWidth = 0.0;
  NavigationType _navigationType = NavigationType.home;
  Widget? _body;

  @override
  void initState() {
    _body = widget.body ?? HomeScreen();
    super.initState();
  }

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
                    ? TextSpan(
                        text: 'My Services',
                        style: AppTheme.textStyleSemiBoldWhite18,
                      )
                    : TextSpan(
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
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: MediaQuery.of(context).size.height - (kToolbarHeight + 30),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            child: SingleChildScrollView(
              child: _body,
            ),
          ),
          widget.bottom ??
              Positioned(
                bottom: 0,
                child: SizedBox(
                  height: 56,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
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
                                      padding:
                                          _navigationType == NavigationType.home
                                              ? const EdgeInsets.all(8)
                                              : EdgeInsets.all(6.0),
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 8),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      duration:
                                          const Duration(milliseconds: 800),
                                      child: InkWell(
                                          onTap: () {
                                            _navigationType =
                                                NavigationType.home;
                                            _body = HomeScreen();
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
                                      (_navigationType == NavigationType.service
                                          ? (MediaQuery.of(context).size.width *
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
                                          : EdgeInsets.all(6.0),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 8),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      duration:
                                          const Duration(milliseconds: 800),
                                      child: InkWell(
                                          onTap: () {
                                            _navigationType =
                                                NavigationType.service;
                                            _body = ServicesScreen();

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
                                  right: (MediaQuery.of(context).size.width *
                                          .2) -
                                      (_navigationType ==
                                              NavigationType.settings
                                          ? (MediaQuery.of(context).size.width *
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
                                      duration:
                                          const Duration(milliseconds: 800),
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
                                                height: 15,
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
                                          : EdgeInsets.all(6.0),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 8),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      duration:
                                          const Duration(milliseconds: 800),
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
                          left: (MediaQuery.of(context).size.width / 2) - 31,
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
      floatingActionButton: widget.floatButton ??
          Container(
            child: _navigationType == NavigationType.service
                ? GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CenterDialogWidget(
                            padding: EdgeInsets.only(top: 16),
                            title: Column(
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
                                ServiceHeadingWidget(),
                                Divider(
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
                      margin: EdgeInsets.only(bottom: 44),
                      height: 48,
                      width: 48,
                      padding: EdgeInsets.all(12),
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
                : SizedBox.shrink(),
          ),
    );
  }
}
