import 'package:fix_ican/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:mh_core/utils/global.dart';

import '../constants/assets_constant.dart';
import '../constants/color_constant.dart';

class CustomScaffold extends StatefulWidget {
  const CustomScaffold(
      {super.key,
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
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  bool isContainerVisible = false;
  double containerWidth = 0.0;

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.kAppbarColor,
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: widget.leading ??
                Image.asset(
                  widget.leadingIcon ?? AssetsConstant.menu_icon,
                  height: 14,
                ),
          ),
        ),
        title: widget.title ??
            Text.rich(TextSpan(
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
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20))),
                      child: widget.body,
                    ),
                  ),
                  // SizedBox(
                  //   height: 80,
                  // ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: 80,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  // AnimatedContainer(
                  //   duration: Duration(milliseconds: 500),
                  //   width: isContainerVisible
                  //       ? MediaQuery.of(context).size.width * .9
                  //       : 0,
                  //   margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  //   height: isContainerVisible ? 50.0 : 20,
                  //   decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(33),
                  //       boxShadow: [
                  //         BoxShadow(
                  //             blurRadius: 10,
                  //             color: Colors.black.withOpacity(.16))
                  //       ]),
                  //   child: isContainerVisible
                  //       ? Row(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             Icon(Icons.circle),
                  //             GestureDetector(
                  //               child: Image.asset(
                  //                 AssetsConstant.middlebottomIcon2,
                  //                 height: 52,
                  //               ),
                  //               onTap: () {
                  //                 isContainerVisible = false;
                  //                 setState(() {});
                  //               },
                  //             ),
                  //           ],
                  //         )
                  //       : null,
                  // ),
                  AnimatedPositioned(
                      left: isContainerVisible
                          ? 0
                          : MediaQuery.of(context).size.width / 2,
                      right: isContainerVisible
                          ? 0
                          : MediaQuery.of(context).size.width / 2,
                      top: isContainerVisible ? 0 : 40,
                      bottom: isContainerVisible ? 0 : 40,
                      child: Container(
                        color: Colors.red,
                      ),
                      duration: Duration(milliseconds: 500)),
                  Positioned(
                      left: (MediaQuery.of(context).size.width / 2) - 31,
                      child: !isContainerVisible
                          ? GestureDetector(
                              onTap: () {
                                setState(() {
                                  isContainerVisible = true;
                                });
                              },
                              child: Image.asset(
                                AssetsConstant.middlebottomIcon,
                                height: 62,
                              ),
                            )
                          : SizedBox.shrink()),
                  AnimatedPositioned(
                      top: 0,
                      left: isContainerVisible
                          ? MediaQuery.of(context).size.width / 3
                          : MediaQuery.of(context).size.width / 2,
                      child: Container(
                        color: Colors.red,
                        height: 20,
                        width: 20,
                      ),
                      duration: Duration(milliseconds: 500)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
