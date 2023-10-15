import 'package:fix_ican/constants/assets_constant.dart';
import 'package:fix_ican/constants/color_constant.dart';
import 'package:fix_ican/shared/custom_scaffold.dart';
import 'package:fix_ican/shared/custom_sized_box.dart';
import 'package:fix_ican/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mh_core/utils/color/custom_color.dart';
import 'package:mh_core/widgets/button/custom_button.dart';

class BasicCleaningScreen extends StatefulWidget {
  static const String routeName = '/basiccleaning';

  const BasicCleaningScreen({super.key});

  @override
  State<BasicCleaningScreen> createState() => _BasicCleaningScreenState();
}

class _BasicCleaningScreenState extends State<BasicCleaningScreen>
    with TickerProviderStateMixin {
  double scale = 1.0; // Initial scale value
  bool tapped = false;

  void _onTap() {
    setState(() {
      if (tapped) {
        // Bounce-out effect
        tapped = false;
      } else {
        // Bounce-in effect
        tapped = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text('Basic Cleaning'),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                children: [
                  Column(
                    children: [
                      ...List.generate(
                          4,
                          (index) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'How many bedroom?',
                                          style:
                                              AppTheme.textStyleSemiBoldBlack16,
                                        ),
                                        Image.asset(
                                          AssetsConstant.info_icon,
                                          height: 12,
                                        )
                                      ],
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 12),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(33),
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 6,
                                                color: Colors.black
                                                    .withOpacity(.15))
                                          ]),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            AssetsConstant.add_icon,
                                            height: 15,
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 8),
                                            decoration: BoxDecoration(
                                              color: AppColors.kPrimaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(180),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 16),
                                            child: Text(
                                              '0',
                                              style: AppTheme
                                                  .textStyleSemiBoldWhite14,
                                            ),
                                          ),
                                          Image.asset(
                                            AssetsConstant.minimize_icon,
                                            color: AppColors.kPrimaryColor,
                                            width: 15,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ))
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'How many dishes?',
                        style: AppTheme.textStyleSemiBoldBlack16,
                      ),
                      Image.asset(
                        AssetsConstant.info_icon,
                        height: 12,
                      )
                    ],
                  ),
                  Wrap(
                    children: [
                      ...List.generate(
                          3,
                          (index) => FittedBox(
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 12),
                                  height: 42,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 16),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: index == 0
                                          ? AppColors.kPrimaryColor
                                          : Color(0xffFC8E99)),
                                  child: Text(
                                    index == 0 ? 'Open\nChimney' : 'Chimney',
                                    textAlign: TextAlign.center,
                                    style: AppTheme.textStyleSemiBoldWhite12,
                                  ),
                                ),
                              ))
                    ],
                  ),
                  CustomSizedBox.space8H,
                  Row(
                    children: [
                      Text(
                        'How many dishes?',
                        style: AppTheme.textStyleSemiBoldBlack16,
                      ),
                      Image.asset(
                        AssetsConstant.info_icon,
                        height: 12,
                      )
                    ],
                  ),
                  Wrap(
                    children: [
                      ...List.generate(
                          4,
                          (index) => FittedBox(
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 12),
                                  height: 42,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 16),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: index == 0
                                          ? AppColors.kPrimaryColor
                                          : Color(0xffFC8E99)),
                                  child: Text(
                                    index == 0 ? 'Open\nChimney' : 'Chimney',
                                    textAlign: TextAlign.center,
                                    style: AppTheme.textStyleSemiBoldWhite12,
                                  ),
                                ),
                              ))
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 147,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10, color: Colors.black.withOpacity(.1))
                  ]),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: 'Total',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '(Inc. VAT where applicable)',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Tk. 2988',
                            style: AppTheme.textStyleBoldBlack18,
                          ),
                          Text.rich(
                            TextSpan(
                                text: 'Tk. ',
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Colors.black54,
                                ),
                                children: [
                                  TextSpan(
                                    text: '2988',
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: Colors.black54,
                                        decoration: TextDecoration.lineThrough),
                                  )
                                ]),
                          )
                        ],
                      )
                    ],
                  ),
                  CustomSizedBox.space8H,
                  Row(
                    children: [
                      // GestureDetector(
                      //   onTap: _onTap,
                      //   child: ScaleTransition(
                      //     scale: AlwaysStoppedAnimation<double>(scale),
                      //     child: Container(
                      //       padding: EdgeInsets.symmetric(
                      //           horizontal: 24, vertical: 12),
                      //       decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(30),
                      //           color: scale == .8
                      //               ? AppColors.kPrimaryColor
                      //               : Colors.transparent,
                      //           border: Border.all(
                      //               color: AppColors.kPrimaryColor, width: 2)),
                      //       child: Image.asset(
                      //         AssetsConstant.cart_icon,
                      //         height: 22,
                      //         color: scale == .8 ? Colors.white : null,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      GestureDetector(
                        onTap: _onTap,
                        child: AnimatedBuilder(
                          animation: CurvedAnimation(
                            parent: TweenSequence<double>(
                              <TweenSequenceItem<double>>[
                                TweenSequenceItem<double>(
                                  tween: Tween<double>(
                                    begin: 1.0,
                                    end:
                                        .8, // Adjust this value for bounce intensity
                                  ),
                                  weight: 50,
                                ),
                                TweenSequenceItem<double>(
                                  tween: Tween<double>(
                                    begin: .8,
                                    end: 1.0,
                                  ),
                                  weight: 50,
                                ),
                              ],
                            ).animate(CurvedAnimation(
                              parent: AnimationController(
                                duration: Duration(milliseconds: 300),
                                vsync: this,
                              ),
                              curve: Curves.easeOut,
                            )),
                            curve: Curves.easeInOut,
                          ),
                          builder: (context, child) {
                            return Transform.scale(
                              scale: scale * (tapped ? .8 : 1.0),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 12),
                                decoration: BoxDecoration(
                                  color: tapped
                                      ? AppColors.kPrimaryColor
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: AppColors.kPrimaryColor,
                                    // Change the border color as needed
                                    width: 2,
                                  ),
                                ),
                                child: Image.asset(
                                  AssetsConstant.cart_icon,
                                  color: tapped ? Colors.white : null,
                                  // Replace with your image asset
                                  height: 22,
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      CustomSizedBox.space16W,
                      Expanded(
                        child: CustomButton(
                          label: 'Continue',
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              enableDrag: true,
                              isScrollControlled: false,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                              ),
                              builder: (BuildContext context) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        'Choose Your Frequency',
                                        style:
                                            AppTheme.textStyleSemiBoldBlack16,
                                      ),
                                    ),
                                    Divider(
                                      thickness: 0.5,
                                      color: Color(0xffF1B2BF),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xffFC8E99),
                                              width: .5),
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'Monthly',
                                                style: AppTheme
                                                    .textStyleSemiBoldBlack16,
                                              ),
                                              Spacer(),
                                              Text(
                                                '15% Off',
                                                style: AppTheme
                                                    .textStyleSemiBoldGreen16,
                                              ),
                                              Radio(
                                                activeColor:
                                                    AppColors.kPrimaryColor,
                                                value: 'Monthly',
                                                groupValue: 'Monthly',
                                                onChanged: (value) {
                                                  value = 'Weekly';
                                                  setState(() {});
                                                },
                                              )
                                            ],
                                          ),
                                          Divider(
                                            thickness: 0.5,
                                            color: Color(0xffF1B2BF),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ...List.generate(
                                                    3,
                                                    (index) => Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(2.0),
                                                          child: Wrap(
                                                            children: [
                                                              Icon(
                                                                Icons.circle,
                                                                size: 5,
                                                                color: AppColors
                                                                    .kAppbarColor,
                                                              ),
                                                              Text(
                                                                'The same professional will join you every week.',
                                                                style: AppTheme
                                                                    .textStyleNormalBlack12,
                                                              )
                                                            ],
                                                            crossAxisAlignment:
                                                                WrapCrossAlignment
                                                                    .center,
                                                            alignment:
                                                                WrapAlignment
                                                                    .start,
                                                          ),
                                                        ))
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                );
                              },
                            );
                          },
                          marginHorizontal: 0,
                          marginVertical: 0,
                          suffixImage: AssetsConstant.arrow_icon,
                          suffixImageHeight: 11,
                          borderRadiusAll: 22,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        bottom: SizedBox.shrink());
  }
}
