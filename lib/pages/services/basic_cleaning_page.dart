import 'package:fix_ican/constants/assets_constant.dart';
import 'package:fix_ican/constants/color_constant.dart';
import 'package:fix_ican/pages/services/basic-cleaning/all_cleaning_process_page.dart';
import 'package:fix_ican/shared/custom_scaffold.dart';
import 'package:fix_ican/shared/custom_sized_box.dart';
import 'package:fix_ican/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mh_core/utils/global.dart';
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
  bool isSelected = false;
  String groupValue = 'Weekly';
  double cartHeight = 50;

  String groupValueMonthly = 'With Instalment';

  void onTapButton() {
    setState(() {
      cartHeight = 44;
      tapped = !tapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      leading: InkWell(
        onTap: () {
          Get.back();
        },
        child: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      title: const Text('Basic Cleaning'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            ...List.generate(
                6,
                (index) => CountWidget(
                      hasdishes: index >= 4 ? true : false,
                      dishwidgetLength: index == 5 ? 4 : 3,
                    ))
          ],
        ),
      ),
      bottom: Container(
        width: double.infinity,
        height: 147,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
            boxShadow: [
              BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(.1))
            ]),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text.rich(
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
                    const Text(
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
                GestureDetector(
                  onTap: onTapButton,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    curve: Curves.linear,
                    onEnd: () {
                      cartHeight = 50;
                      setState(() {});
                    },
                    height: /*tapped ? 44 :*/ cartHeight,
                    decoration: BoxDecoration(
                      color:
                          tapped ? AppColors.kPrimaryColor : Colors.transparent,
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
                ),
                CustomSizedBox.space16W,
                Expanded(
                  child: CustomButton(
                    label: 'Continue',
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        enableDrag: true,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        builder: (BuildContext context) {
                          return StatefulBuilder(builder: (context, setState) {
                            return SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(
                                      'Choose Your Frequency',
                                      style: AppTheme.textStyleSemiBoldBlack16,
                                    ),
                                  ),
                                  const Divider(
                                    thickness: 0.5,
                                    color: Color(0xffF1B2BF),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: groupValue == 'Monthly'
                                            ? AppColors.kAccentColor
                                            : null,
                                        border: Border.all(
                                            color: const Color(0xffFC8E99),
                                            width: .5),
                                        borderRadius: BorderRadius.circular(6)),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 6),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          isSelected = true;
                                          groupValue = 'Monthly';
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                const Text(
                                                  'Monthly',
                                                  style: AppTheme
                                                      .textStyleSemiBoldBlack16,
                                                ),
                                                const Spacer(),
                                                const Text(
                                                  '15% Off',
                                                  style: AppTheme
                                                      .textStyleSemiBoldGreen16,
                                                ),
                                                Radio(
                                                  activeColor:
                                                      AppColors.kPrimaryColor,
                                                  fillColor: MaterialStateColor
                                                      .resolveWith(
                                                    (Set<MaterialState>
                                                        states) {
                                                      if (states.contains(
                                                          MaterialState
                                                              .selected)) {
                                                        return AppColors
                                                            .kPrimaryColor;
                                                      }
                                                      return AppColors
                                                          .kPrimaryColor;
                                                    },
                                                  ),
                                                  value: 'Monthly',
                                                  groupValue: groupValue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      groupValue = value!;
                                                    });
                                                  },
                                                )
                                              ],
                                            ),
                                            const Divider(
                                              thickness: 0.5,
                                              color: Color(0xffF1B2BF),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ...List.generate(
                                                      3,
                                                      (index) => const Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    2.0),
                                                            child: Wrap(
                                                              crossAxisAlignment:
                                                                  WrapCrossAlignment
                                                                      .center,
                                                              alignment:
                                                                  WrapAlignment
                                                                      .start,
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
                                                            ),
                                                          ))
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: groupValue == 'Weekly'
                                            ? AppColors.kAccentColor
                                            : null,
                                        border: Border.all(
                                            color: const Color(0xffFC8E99),
                                            width: .5),
                                        borderRadius: BorderRadius.circular(6)),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 6),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(6),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 12),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      'Weekly',
                                                      style: AppTheme
                                                          .textStyleSemiBoldBlack16,
                                                    ),
                                                    CustomSizedBox.space4H,
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: AppColors
                                                            .kPrimaryColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3),
                                                      ),
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 8,
                                                          vertical: 4),
                                                      child: const Text(
                                                        'Most Popular',
                                                        style: AppTheme
                                                            .textStyleMediumWhite10,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const Spacer(),
                                                const Text(
                                                  '10% Off',
                                                  style: AppTheme
                                                      .textStyleSemiBoldGreen16,
                                                ),
                                                Radio(
                                                  activeColor:
                                                      AppColors.kPrimaryColor,
                                                  fillColor: MaterialStateColor
                                                      .resolveWith(
                                                    (Set<MaterialState>
                                                        states) {
                                                      if (states.contains(
                                                          MaterialState
                                                              .selected)) {
                                                        return AppColors
                                                            .kPrimaryColor;
                                                      }
                                                      return AppColors
                                                          .kPrimaryColor;
                                                    },
                                                  ),
                                                  value: 'Weekly',
                                                  groupValue: groupValue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      groupValue = value!;
                                                    });
                                                    if (value == 'Weekly') {
                                                      setState(() {
                                                        isSelected = true;
                                                      });
                                                    }
                                                  },
                                                )
                                              ],
                                            ),
                                            const Divider(
                                              thickness: 0.5,
                                              color: Color(0xffF1B2BF),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ...List.generate(
                                                      3,
                                                      (index) => const Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    2.0),
                                                            child: Wrap(
                                                              crossAxisAlignment:
                                                                  WrapCrossAlignment
                                                                      .center,
                                                              alignment:
                                                                  WrapAlignment
                                                                      .start,
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
                                                            ),
                                                          ))
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          isSelected = true;
                                          groupValue = 'Weekly';
                                        });
                                      },
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: groupValue == 'One Time'
                                            ? AppColors.kAccentColor
                                            : null,
                                        border: Border.all(
                                            color: const Color(0xffFC8E99),
                                            width: .5),
                                        borderRadius: BorderRadius.circular(6)),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 6),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          isSelected = true;
                                          groupValue = 'One Time';
                                        });
                                      },
                                      borderRadius: BorderRadius.circular(6),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                const Text(
                                                  'One Time',
                                                  style: AppTheme
                                                      .textStyleSemiBoldBlack16,
                                                ),
                                                CustomSizedBox.space4H,
                                                const Spacer(),
                                                Radio(
                                                  activeColor:
                                                      AppColors.kPrimaryColor,
                                                  fillColor: MaterialStateColor
                                                      .resolveWith(
                                                    (Set<MaterialState>
                                                        states) {
                                                      if (states.contains(
                                                          MaterialState
                                                              .selected)) {
                                                        return AppColors
                                                            .kPrimaryColor;
                                                      }
                                                      return AppColors
                                                          .kPrimaryColor;
                                                    },
                                                  ),
                                                  value: 'One Time',
                                                  groupValue: groupValue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      groupValue = value!;
                                                    });
                                                  },
                                                )
                                              ],
                                            ),
                                            const Divider(
                                              thickness: 0.5,
                                              color: Color(0xffF1B2BF),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ...List.generate(
                                                      2,
                                                      (index) => const Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    2.0),
                                                            child: Wrap(
                                                              crossAxisAlignment:
                                                                  WrapCrossAlignment
                                                                      .center,
                                                              alignment:
                                                                  WrapAlignment
                                                                      .start,
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
                                                            ),
                                                          ))
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: groupValue == 'Custom'
                                            ? AppColors.kAccentColor
                                            : null,
                                        border: Border.all(
                                            color: const Color(0xffFC8E99),
                                            width: .5),
                                        borderRadius: BorderRadius.circular(6)),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 6),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(6),
                                      onTap: () {
                                        setState(() {
                                          isSelected = true;
                                          groupValue = 'Custom';
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                const Text(
                                                  'Custom',
                                                  style: AppTheme
                                                      .textStyleSemiBoldBlack16,
                                                ),
                                                CustomSizedBox.space4H,
                                                const Spacer(),
                                                Radio(
                                                  activeColor:
                                                      AppColors.kPrimaryColor,
                                                  fillColor: MaterialStateColor
                                                      .resolveWith(
                                                    (Set<MaterialState>
                                                        states) {
                                                      if (states.contains(
                                                          MaterialState
                                                              .selected)) {
                                                        return AppColors
                                                            .kPrimaryColor;
                                                      }
                                                      return AppColors
                                                          .kPrimaryColor;
                                                    },
                                                  ),
                                                  value: 'Custom',
                                                  groupValue: groupValue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      groupValue = value!;
                                                    });
                                                  },
                                                )
                                              ],
                                            ),
                                            const Divider(
                                              thickness: 0.5,
                                              color: Color(0xffF1B2BF),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ...List.generate(
                                                      1,
                                                      (index) => const Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    2.0),
                                                            child: Wrap(
                                                              crossAxisAlignment:
                                                                  WrapCrossAlignment
                                                                      .center,
                                                              alignment:
                                                                  WrapAlignment
                                                                      .start,
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
                                                            ),
                                                          ))
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  CustomButton(
                                    label: 'Continue',
                                    onPressed: () {
                                      Navigator.pop(context);
                                      groupValue == 'Weekly'
                                          ? Get.toNamed(AllCleaningProcessScreen
                                              .routeName)
                                          : groupValue == 'One Time'
                                              ? Navigator.push(context,
                                                  MaterialPageRoute(
                                                  builder: (context) {
                                                    return const AllCleaningProcessScreen(
                                                      title: 'One Time',
                                                      isCustom: false,
                                                    );
                                                  },
                                                ))
                                              : groupValue == 'Custom'
                                                  ? Navigator.push(context,
                                                      MaterialPageRoute(
                                                      builder: (context) {
                                                        return const AllCleaningProcessScreen(
                                                          title: 'Custom',
                                                          isCustom: true,
                                                        );
                                                      },
                                                    ))
                                                  : showModalBottomSheet(
                                                      context: context,
                                                      enableDrag: true,
                                                      isScrollControlled: true,
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  20.0),
                                                        ),
                                                      ),
                                                      builder: (BuildContext
                                                          context) {
                                                        return StatefulBuilder(
                                                          builder: (context,
                                                                  setState) =>
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  margin: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          16,
                                                                      vertical:
                                                                          12),
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          16,
                                                                      vertical:
                                                                          12),
                                                                  decoration: BoxDecoration(
                                                                      color: const Color(
                                                                          0xffFFE5E5),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      const Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            'Frequency',
                                                                            style:
                                                                                AppTheme.textStyleSemiBoldBlack18,
                                                                          ),
                                                                          CustomSizedBox
                                                                              .space4H,
                                                                          Text(
                                                                            'Change',
                                                                            style:
                                                                                TextStyle(color: AppColors.kPrimaryColor, fontSize: 13),
                                                                          )
                                                                        ],
                                                                      ),
                                                                      Container(
                                                                        // margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                                                        padding: const EdgeInsets
                                                                            .symmetric(
                                                                            horizontal:
                                                                                16,
                                                                            vertical:
                                                                                12),
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                const Color(0xffFFF9F9),
                                                                            borderRadius: BorderRadius.circular(5)),
                                                                        child:
                                                                            const Text(
                                                                          'Monthly',
                                                                          style: TextStyle(
                                                                              color: AppColors.kPrimaryColor,
                                                                              fontSize: 16,
                                                                              fontWeight: FontWeight.w600),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color: const Color(
                                                                              0xffFC8E99),
                                                                          width:
                                                                              .5),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              6)),
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          16),
                                                                  margin: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          16,
                                                                      vertical:
                                                                          6),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          const Text(
                                                                            'With Instalment',
                                                                            style:
                                                                                AppTheme.textStyleSemiBoldBlack16,
                                                                          ),
                                                                          const Spacer(),
                                                                          Text(
                                                                            '10% Off',
                                                                            style: TextStyle(
                                                                                fontSize: 10,
                                                                                fontWeight: FontWeight.w600,
                                                                                color: const Color(0xff09AB4A).withOpacity(.4),
                                                                                decoration: TextDecoration.lineThrough),
                                                                          ),
                                                                          const Text(
                                                                            '10% Off',
                                                                            style:
                                                                                AppTheme.textStyleSemiBoldGreen16,
                                                                          ),
                                                                          Radio(
                                                                            activeColor:
                                                                                AppColors.kPrimaryColor,
                                                                            fillColor:
                                                                                MaterialStateColor.resolveWith(
                                                                              (Set<MaterialState> states) {
                                                                                if (states.contains(MaterialState.selected)) {
                                                                                  return AppColors.kPrimaryColor;
                                                                                }
                                                                                return AppColors.kPrimaryColor;
                                                                              },
                                                                            ),
                                                                            value:
                                                                                'With Instalment',
                                                                            groupValue:
                                                                                groupValueMonthly,
                                                                            onChanged:
                                                                                (value) {
                                                                              setState(() {
                                                                                groupValueMonthly = value!;
                                                                              });
                                                                            },
                                                                          )
                                                                        ],
                                                                      ),
                                                                      const Divider(
                                                                        thickness:
                                                                            0.5,
                                                                        color: Color(
                                                                            0xffF1B2BF),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .symmetric(
                                                                            vertical:
                                                                                8.0),
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            ...List.generate(
                                                                                1,
                                                                                (index) => const Padding(
                                                                                      padding: EdgeInsets.all(2.0),
                                                                                      child: Wrap(
                                                                                        crossAxisAlignment: WrapCrossAlignment.center,
                                                                                        alignment: WrapAlignment.start,
                                                                                        children: [
                                                                                          Icon(
                                                                                            Icons.circle,
                                                                                            size: 5,
                                                                                            color: AppColors.kAppbarColor,
                                                                                          ),
                                                                                          CustomSizedBox.space4W,
                                                                                          Text(
                                                                                            'Pay total payment in 3 instalment phase',
                                                                                            style: AppTheme.textStyleNormalBlack12,
                                                                                          )
                                                                                        ],
                                                                                      ),
                                                                                    )),
                                                                            Container(
                                                                              margin: const EdgeInsets.symmetric(vertical: 6),
                                                                              width: double.infinity,
                                                                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                                                              decoration: BoxDecoration(border: Border.all(color: const Color(0xffFC8E99), width: .5), color: const Color(0xffFFE5E5), borderRadius: BorderRadius.circular(5)),
                                                                              child: const Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    'First Instalment',
                                                                                    style: AppTheme.textStyleSemiBoldBlack14,
                                                                                  ),
                                                                                  CustomSizedBox.space4H,
                                                                                  Text(
                                                                                    'You have to pay the first Instalment first',
                                                                                    style: TextStyle(color: Colors.black87, fontSize: 12),
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              margin: const EdgeInsets.symmetric(vertical: 6),
                                                                              width: double.infinity,
                                                                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                                                              decoration: BoxDecoration(border: Border.all(color: const Color(0xffFC8E99), width: .5), color: const Color(0xffFFE5E5), borderRadius: BorderRadius.circular(5)),
                                                                              child: const Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    'Second Instalment',
                                                                                    style: AppTheme.textStyleSemiBoldBlack14,
                                                                                  ),
                                                                                  CustomSizedBox.space4H,
                                                                                  Text(
                                                                                    'Second instalment should be pay within 10 July 2023',
                                                                                    style: TextStyle(color: Colors.black87, fontSize: 12),
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              margin: const EdgeInsets.symmetric(vertical: 6),
                                                                              width: double.infinity,
                                                                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                                                              decoration: BoxDecoration(border: Border.all(color: const Color(0xffFC8E99), width: .5), color: const Color(0xffFFE5E5), borderRadius: BorderRadius.circular(5)),
                                                                              child: const Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    'Third Instalment',
                                                                                    style: AppTheme.textStyleSemiBoldBlack14,
                                                                                  ),
                                                                                  CustomSizedBox.space4H,
                                                                                  Text(
                                                                                    'Third instalment should be pay within 20 July 2023',
                                                                                    style: TextStyle(color: Colors.black87, fontSize: 12),
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color: const Color(
                                                                              0xffFC8E99),
                                                                          width:
                                                                              .5),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              6)),
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          16),
                                                                  margin: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          16,
                                                                      vertical:
                                                                          6),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          const Text(
                                                                            'Without Instalment',
                                                                            style:
                                                                                AppTheme.textStyleSemiBoldBlack16,
                                                                          ),
                                                                          const Spacer(),
                                                                          Radio(
                                                                            activeColor:
                                                                                AppColors.kPrimaryColor,
                                                                            fillColor:
                                                                                MaterialStateColor.resolveWith(
                                                                              (Set<MaterialState> states) {
                                                                                if (states.contains(MaterialState.selected)) {
                                                                                  return AppColors.kPrimaryColor;
                                                                                }
                                                                                return AppColors.kPrimaryColor;
                                                                              },
                                                                            ),
                                                                            value:
                                                                                'Without Instalment',
                                                                            groupValue:
                                                                                groupValueMonthly,
                                                                            onChanged:
                                                                                (value) {
                                                                              setState(() {
                                                                                groupValueMonthly = value!;
                                                                              });
                                                                            },
                                                                          )
                                                                        ],
                                                                      ),
                                                                      const Divider(
                                                                        thickness:
                                                                            0.5,
                                                                        color: Color(
                                                                            0xffF1B2BF),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .symmetric(
                                                                            vertical:
                                                                                8.0),
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            ...List.generate(
                                                                                1,
                                                                                (index) => const Padding(
                                                                                      padding: EdgeInsets.all(2.0),
                                                                                      child: Wrap(
                                                                                        crossAxisAlignment: WrapCrossAlignment.center,
                                                                                        alignment: WrapAlignment.start,
                                                                                        children: [
                                                                                          Icon(
                                                                                            Icons.circle,
                                                                                            size: 5,
                                                                                            color: AppColors.kAppbarColor,
                                                                                          ),
                                                                                          CustomSizedBox.space4W,
                                                                                          Text(
                                                                                            'Pay total payment in 3 instalment phase',
                                                                                            style: AppTheme.textStyleNormalBlack12,
                                                                                          )
                                                                                        ],
                                                                                      ),
                                                                                    )),
                                                                          ],
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                                CustomButton(
                                                                  label:
                                                                      'Continue',
                                                                  onPressed:
                                                                      groupValueMonthly ==
                                                                              'With Instalment'
                                                                          ? () {
                                                                              Navigator.pop(context);
                                                                              Navigator.push(context, MaterialPageRoute(
                                                                                builder: (context) {
                                                                                  return const AllCleaningProcessScreen(
                                                                                    title: 'Monthly',
                                                                                    isCustom: false,
                                                                                  );
                                                                                },
                                                                              ));
                                                                            }
                                                                          : () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                  marginHorizontal:
                                                                      16,
                                                                  marginVertical:
                                                                      12,
                                                                  suffixImage:
                                                                      AssetsConstant
                                                                          .arrow_icon,
                                                                  suffixImageHeight:
                                                                      11,
                                                                  borderRadiusAll:
                                                                      22,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                    },
                                    marginHorizontal: 16,
                                    marginVertical: 12,
                                    suffixImage: AssetsConstant.arrow_icon,
                                    suffixImageHeight: 11,
                                    borderRadiusAll: 22,
                                  ),
                                ],
                              ),
                            );
                          });
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
    );
  }
}

class CountWidget extends StatefulWidget {
  final bool hasdishes;
  final int dishwidgetLength;

  const CountWidget({
    super.key,
    this.hasdishes = false,
    required this.dishwidgetLength,
  });

  @override
  State<CountWidget> createState() => _CountWidgetState();
}

class _CountWidgetState extends State<CountWidget> {
  int value = 0;
  OverlayEntry? _overlayEntry;
  bool hasIncremented = false; // Track if increment has occurred
  bool hasDecremented = false;
  int addOn = 0;
  double countTogglePosition = 33;
  double startDragPosition = 0;
  Offset? _overlayPosition;
  List<bool> chimney = [false, false, false, false];

  @override
  void initState() {
    print('0000000000000000000000000');
    print(countTogglePosition);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    'How many bedroom?',
                    style: AppTheme.textStyleSemiBoldBlack16,
                  ),
                  GestureDetector(
                    onTap: () {
                      showOverlay(context);
                      _overlayPosition = _getButtonPosition(context);
                    },
                    child: Image.asset(
                      AssetsConstant.info_icon,
                      height: 12,
                    ),
                  ),
                ],
              ),
              !widget.hasdishes
                  ? Container(
                      width: 98,
                      height: 35,
                      // padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(33),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 6,
                                color: Colors.black.withOpacity(.15))
                          ]),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 8,
                            top: 5,
                            bottom: 5,
                            child: Image.asset(
                              AssetsConstant.minimize_icon,
                              color:
                                  value >= 1 ? AppColors.kPrimaryColor : null,
                              height: 15,
                              width: 15,
                            ),
                          ),
                          Positioned(
                            right: 8,
                            top: 5,
                            bottom: 5,
                            child: Image.asset(
                              AssetsConstant.add_icon,
                              height: 15,
                              width: 15,
                            ),
                          ),
                          Positioned(
                            left: countTogglePosition,
                            child: GestureDetector(
                              onHorizontalDragUpdate:
                                  (DragUpdateDetails details) {
                                globalLogger.d(details.localPosition, 'Update');
                                if (countTogglePosition <= 63 &&
                                    countTogglePosition >= 0) {
                                  countTogglePosition =
                                      33 + (details.localPosition.dx - 16);
                                  addOn = 0;
                                }
                                if (countTogglePosition <= 0) {
                                  countTogglePosition = 0;
                                  if (value != 0) {
                                    addOn = -1;
                                  }
                                }
                                if (countTogglePosition >= 63) {
                                  countTogglePosition = 63;
                                  addOn = 1;
                                }
                                setState(() {});
                              },
                              onHorizontalDragStart:
                                  (DragStartDetails details) {
                                globalLogger.d(details.localPosition, 'Start');
                                startDragPosition = details.localPosition.dx;
                                setState(() {});
                              },
                              onHorizontalDragEnd: (DragEndDetails details) {
                                if (details.primaryVelocity != null) {
                                  countTogglePosition = 33;
                                  setState(() {
                                    value += addOn;
                                  });
                                }
                                globalLogger.d(details.primaryVelocity, 'End');
                              },
                              child: Container(
                                width: 35.0,
                                height: 35.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColors.kPrimaryColor,
                                  borderRadius: BorderRadius.circular(180),
                                ),
                                child: Text(
                                  '$value',
                                  textAlign: TextAlign.center,
                                  style: AppTheme.textStyleSemiBoldWhite14,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          widget.hasdishes
              ? Wrap(
                  children: [
                    ...List.generate(
                        widget.dishwidgetLength,
                        (index) => FittedBox(
                                child: DisheshWidget(
                              index: index,
                              chimney: chimney[index],
                              // Use individual chimney property
                              onToggleChimney: (newChimneyValue) {
                                setState(() {
                                  chimney[index] =
                                      newChimneyValue; // Update the list with the new value
                                });
                              },
                            )))
                  ],
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }

  void showOverlay(BuildContext context) {
    if (_overlayPosition == null) return;

    // Create an OverlayEntry
    _overlayEntry = OverlayEntry(
      builder: (context) {
        // The widget that will be displayed as an overlay
        return Positioned(
          top: _overlayPosition!.dy + 20, // Adjust as needed
          left: _overlayPosition!.dx + 80, // Adjust as needed
          child: const Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('this is fixican'),
            ),
          ),
        );
      },
    );
    Overlay.of(context).insert(_overlayEntry!);
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _overlayEntry?.remove();
      });
    });
  }

  Offset _getButtonPosition(BuildContext context) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    return renderBox.localToGlobal(const Offset(0, 0));
  }
}

class DisheshWidget extends StatefulWidget {
  const DisheshWidget({
    super.key,
    required this.index,
    required this.chimney,
    required this.onToggleChimney,
  });

  final int index;
  final bool chimney;
  final Function(bool) onToggleChimney;

  @override
  State<DisheshWidget> createState() => _DisheshWidgetState();
}

class _DisheshWidgetState extends State<DisheshWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onToggleChimney(!widget.chimney);
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12)
            .copyWith(bottom: 0),
        height: 42,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: widget.chimney
                ? AppColors.kPrimaryColor
                : const Color(0xffFC8E99)),
        child: Text(
          widget.chimney ? 'Open\nChimney' : 'Chimney',
          textAlign: TextAlign.center,
          style: AppTheme.textStyleSemiBoldWhite12,
        ),
      ),
    );
  }
}
