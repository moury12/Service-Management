import 'package:fix_ican/constants/assets_constant.dart';
import 'package:fix_ican/constants/color_constant.dart';
import 'package:fix_ican/pages/auth/widgets/otpContainer.dart';
import 'package:fix_ican/pages/home/home_page.dart';
import 'package:fix_ican/shared/custom_sized_box.dart';
import 'package:fix_ican/pages/home/main_home_page.dart';
import 'package:fix_ican/theme/theme_data.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/utils/global.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:mh_core/widgets/textfield/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  bool enterNumber = false;
  bool _otpVisible = false;
  late FocusNode text1, text2, text3, text4, text5, text6;

  final TextEditingController firstOtpController = TextEditingController();
  final TextEditingController secondOtpController = TextEditingController();
  final TextEditingController thirdOtpController = TextEditingController();
  final TextEditingController forthOtpController = TextEditingController();
  final TextEditingController fifthOtpController = TextEditingController();
  final TextEditingController sixthOtpController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  double lineHeight = 53.5;

  @override
  void initState() {
    text1 = FocusNode();
    text2 = FocusNode();
    text3 = FocusNode();
    text4 = FocusNode();
    text5 = FocusNode();
    text6 = FocusNode();
    text1.requestFocus();

    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _offsetAnimation = Tween<Offset>(
      begin: Offset(0, .6),
      end: Offset(0, 2.8),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  void clear() {
    firstOtpController.clear();
    secondOtpController.clear();
    thirdOtpController.clear();
    forthOtpController.clear();
    fifthOtpController.clear();
    sixthOtpController.clear();
  }

  @override
  void dispose() {
    _controller.dispose();
    firstOtpController.dispose();
    secondOtpController.dispose();
    thirdOtpController.dispose();
    forthOtpController.dispose();
    fifthOtpController.dispose();
    sixthOtpController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    globalLogger.d(MediaQuery.of(context).size.width / 8);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 342,
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 36),
              padding: EdgeInsets.symmetric(vertical: 36),
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(50)),
                color: AppColors.kPrimaryColor.withOpacity(.07),
              ),
              child: Image.asset(
                AssetsConstant.splash_image_full,
              ),
            ),
            Text(
              'Login',
              style: AppTheme.textStyleSemiBoldBlack24,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Stack(
                children: [
                  SizedBox(
                    height: 160,
                    width: MediaQuery.of(context).size.width,
                  ),
                  AnimatedPositioned(
                    top: _otpVisible ? 60 : 25,
                    left: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ...List.generate(
                            6,
                            (index) => Container(
                              // margin: EdgeInsets.symmetric(
                              //     horizontal:
                              //         MediaQuery.of(context).size.width / 13.7),
                              color: Colors.red,
                              width: _otpVisible ? 2 : 0,
                              height: _otpVisible ? 53.5 : 0,
                            ),
                          )
                        ],
                      ),
                    ),
                    duration: Duration(milliseconds: 550),
                    onEnd: () {
                      lineHeight = 60;
                      setState(() {});
                    },
                    curve: Curves.linear,
                  ),
                  // AnimatedPositioned(
                  //   top: _otpVisible ? 60 : 25,
                  //   left: 0,
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  //     child: Stack(
                  //       children: [
                  //         SizedBox(
                  //           width: MediaQuery.of(context).size.width,
                  //           height: _otpVisible ? 53.5 : 0,
                  //         ),
                  //         ...List.generate(
                  //           6,
                  //           (index) => Positioned(
                  //             left: ,
                  //             child: Container(
                  //               color: Colors.red,
                  //               width: _otpVisible ? 2 : 0,
                  //               height: _otpVisible ? 53.5 : 0,
                  //             ),
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  //   duration: Duration(milliseconds: 550),
                  //   curve: Curves.easeInOut,
                  // ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          final Color forwardColor = Colors.green;
                          final Color reverseColor = Colors.red;
                          final Color? containerColor =
                              ColorTween(begin: forwardColor, end: reverseColor)
                                  .animate(_controller)
                                  .value;
                          return SlideTransition(
                            position: _offsetAnimation,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 40,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    OtpContainer(
                                        controller: firstOtpController,
                                        focusNode: text1),
                                    OtpContainer(
                                        controller: secondOtpController,
                                        focusNode: text2),
                                    OtpContainer(
                                        controller: thirdOtpController,
                                        focusNode: text3),
                                    OtpContainer(
                                        controller: forthOtpController,
                                        focusNode: text4),
                                    OtpContainer(
                                        controller: fifthOtpController,
                                        focusNode: text5),
                                    OtpContainer(
                                        controller: sixthOtpController,
                                        focusNode: text6),
                                  ],
                                ),
                              ),
                            ),
                            /*),
                            ),*/
                          );
                        }),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: CustomTextField(
                      keyboardType: TextInputType.phone,
                      maxLine: 2,
                      labelText: 'Mobile Number',
                      onSubmitted: (p0) {
                        setState(() {
                          enterNumber = true;
                        });
                      },
                      focusColor: AppColors.kPrimaryColor,
                      labelFontWeight: FontWeight.w500,
                      labelSize: 16,
                      labelColor: Colors.black.withOpacity(.7),
                      hintText: 'Enter your mobile number',
                      marginVertical: 0,
                      fillColor: Colors.white,
                      enableBorderColor: AppColors.kPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
            firstOtpController.text.isNotEmpty &&
                        secondOtpController.text.isNotEmpty &&
                        thirdOtpController.text.isNotEmpty &&
                        forthOtpController.text.isNotEmpty &&
                        fifthOtpController.text.isNotEmpty &&
                        sixthOtpController.text.isNotEmpty ||
                    !_otpVisible
                ? SizedBox.shrink()
                : Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text.rich(TextSpan(
                          text: '15',
                          style: AppTheme.textStyleSemiBoldBlack16,
                          children: [
                            TextSpan(
                                text: ' Sec Left',
                                style: AppTheme.textStyleMediumBlack10)
                          ])),
                    ),
                  ),
            CustomSizedBox.space12H,
            CustomSizedBox.space12H,
            CustomButton(
              marginVertical: 16,
              loading: firstOtpController.text.isNotEmpty &&
                          secondOtpController.text.isNotEmpty &&
                          thirdOtpController.text.isNotEmpty &&
                          forthOtpController.text.isNotEmpty &&
                          fifthOtpController.text.isNotEmpty &&
                          sixthOtpController.text.isNotEmpty ||
                      !_otpVisible
                  ? false
                  : true,
              // loadingStrokeWidth: 2,
              // loadingHeight: 20,
              // loadingWidth: 20,
              borderRadiusAll: 22,
              isDisable: !enterNumber ? true : false,
              primary: !enterNumber
                  ? AppColors.kButtonDisableColor
                  : AppColors.kPrimaryColor,
              label: firstOtpController.text.isNotEmpty &&
                      secondOtpController.text.isNotEmpty &&
                      thirdOtpController.text.isNotEmpty &&
                      forthOtpController.text.isNotEmpty &&
                      fifthOtpController.text.isNotEmpty &&
                      sixthOtpController.text.isNotEmpty
                  ? 'Login'
                  : 'Continue',
              onPressed: () {
                if (firstOtpController.text.isNotEmpty &&
                    secondOtpController.text.isNotEmpty &&
                    thirdOtpController.text.isNotEmpty &&
                    forthOtpController.text.isNotEmpty &&
                    fifthOtpController.text.isNotEmpty &&
                    sixthOtpController.text.isNotEmpty) {
                  setState(() {
                    clear();
                    _controller.reverse();
                  });
                  Get.toNamed(MainHomeScreen.routeName);
                } else {
                  setState(() {
                    _otpVisible = !_otpVisible;
                    if (_otpVisible) {
                      lineHeight = 53.5;
                      _controller.forward();
                    } else {
                      lineHeight = 0;
                      _controller.reverse();
                    }
                  });
                }
              },
            ),
            Text.rich(TextSpan(
                text: 'Didn’t receive OTP? ',
                style: AppTheme.textStyleSemiBoldBlack12,
                children: [
                  TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = () {},
                      text: 'Resend again',
                      style: AppTheme.textStyleMediumRed12)
                ])),
          ],
        ),
      ),
    );
  }
}
