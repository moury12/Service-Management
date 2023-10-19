import 'package:fix_ican/constants/assets_constant.dart';
import 'package:fix_ican/constants/color_constant.dart';
import 'package:fix_ican/pages/settings/payment_setting_page.dart';
import 'package:fix_ican/shared/custom_scaffold.dart';
import 'package:fix_ican/shared/custom_sized_box.dart';
import 'package:fix_ican/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:mh_core/widgets/textfield/custom_textfield.dart';

class AddDebitScreen extends StatefulWidget {
  static const String routeName = '/addcard';

  const AddDebitScreen({super.key});

  @override
  State<AddDebitScreen> createState() => _AddDebitScreenState();
}

class _AddDebitScreenState extends State<AddDebitScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    String title = Get.arguments as String;
    return CustomScaffold(
      bottom: title == 'edit'
          ? CustomButton(
              label: 'Done',
              onPressed: () {
                Get.toNamed(PaymentSettingScreen.routeName);
              },
              borderRadiusAll: 22,
            )
          : const SizedBox.shrink(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: title == 'edit'
            ? Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10, color: Colors.black.withOpacity(.15))
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      maxLine: 2,
                      borderRadius: 10,
                      onSubmitted: (p0) {},
                      labelFontWeight: FontWeight.w500,
                      labelSize: 16,
                      marginHorizontal: 0,
                      labelColor: Colors.black.withOpacity(.7),
                      hintText: 'Credit Card Number',
                      marginVertical: 0,
                      fillColor: Colors.white,
                      enableBorderColor: AppColors.kAccentColor,
                      focusColor: AppColors.kAppbarColor,
                    ),
                    CustomTextField(
                      maxLine: 2,
                      borderRadius: 10,
                      onSubmitted: (p0) {},
                      labelFontWeight: FontWeight.w500,
                      labelSize: 16,
                      marginHorizontal: 0,
                      labelColor: Colors.black.withOpacity(.7),
                      hintText: 'Card Holder Name',
                      marginVertical: 12,
                      fillColor: Colors.white,
                      enableBorderColor: AppColors.kAccentColor,
                      focusColor: AppColors.kAppbarColor,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            maxLine: 2,
                            borderRadius: 10,
                            onSubmitted: (p0) {},
                            labelFontWeight: FontWeight.w500,
                            labelSize: 16,
                            labelColor: Colors.black.withOpacity(.7),
                            hintText: 'Expiry Date',
                            marginVertical: 12,
                            marginHorizontal: 0,
                            fillColor: Colors.white,
                            enableBorderColor: AppColors.kAccentColor,
                            focusColor: AppColors.kAppbarColor,
                          ),
                        ),
                        CustomSizedBox.space8W,
                        Expanded(
                          child: CustomTextField(
                            maxLine: 2,
                            borderRadius: 10,
                            onSubmitted: (p0) {},
                            labelFontWeight: FontWeight.w500,
                            labelSize: 16,
                            marginHorizontal: 0,
                            labelColor: Colors.black.withOpacity(.7),
                            hintText: 'CVC/CVV',
                            marginVertical: 12,
                            fillColor: Colors.white,
                            enableBorderColor: AppColors.kAccentColor,
                            focusColor: AppColors.kAppbarColor,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isChecked = !isChecked;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: isChecked
                                      ? AppColors.kPrimaryColor
                                      : Colors.transparent,
                                  border: Border.all(
                                    color: const Color(0xffFFD9D9),
                                    width: 1.4,
                                  ),
                                  borderRadius: BorderRadius.circular(3)),
                              child: isChecked
                                  ? Image.asset(
                                      AssetsConstant.check_icon,
                                      height: 12,
                                    )
                                  : const SizedBox.shrink(),
                            ),
                          ),
                          CustomSizedBox.space8W,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Save This Card ',
                                  style: AppTheme.textStyleSemiBoldFadeBlack14,
                                ),
                                const Text.rich(TextSpan(
                                    text:
                                        'For more information please visit the ',
                                    style: AppTheme.textStyleNormalBlack12,
                                    children: [
                                      TextSpan(
                                        text: 'Privacy Policy',
                                        style: AppTheme.textStyleBoldBlack12,
                                      )
                                    ])),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : Column(
                children: [
                  CustomTextField(
                    keyboardType: TextInputType.phone,
                    borderRadius: 10,
                    maxLine: 2,
                    labelText: 'Account Number',
                    onSubmitted: (p0) {},
                    labelFontWeight: FontWeight.w500,
                    labelSize: 16,
                    labelColor: Colors.black.withOpacity(.7),
                    hintText: 'XXXX XXXX XXXX',
                    marginVertical: 12,
                    fillColor: Colors.white,
                    enableBorderColor: AppColors.kAccentColor,
                    focusColor: AppColors.kAppbarColor,
                  ),
                  CustomTextField(
                    borderRadius: 10,
                    maxLine: 2,
                    labelText: 'Account Holder Name',
                    onSubmitted: (p0) {},
                    labelFontWeight: FontWeight.w500,
                    labelSize: 16,
                    labelColor: Colors.black.withOpacity(.7),
                    hintText: 'Mustafijur Rahman',
                    marginVertical: 12,
                    fillColor: Colors.white,
                    enableBorderColor: AppColors.kAccentColor,
                    focusColor: AppColors.kAppbarColor,
                  ),
                  CustomTextField(
                    keyboardType: TextInputType.phone,
                    maxLine: 2,
                    borderRadius: 10,
                    labelText: 'CC VV',
                    onSubmitted: (p0) {},
                    labelFontWeight: FontWeight.w500,
                    labelSize: 16,
                    labelColor: Colors.black.withOpacity(.7),
                    hintText: '021455',
                    marginVertical: 12,
                    fillColor: Colors.white,
                    enableBorderColor: AppColors.kAccentColor,
                    focusColor: AppColors.kAppbarColor,
                  ),
                  CustomTextField(
                    keyboardType: TextInputType.phone,
                    maxLine: 2,
                    borderRadius: 10,
                    labelText: 'Expire Date',
                    onSubmitted: (p0) {},
                    labelFontWeight: FontWeight.w500,
                    labelSize: 16,
                    labelColor: Colors.black.withOpacity(.7),
                    hintText: '02/22/2023',
                    marginVertical: 12,
                    fillColor: Colors.white,
                    enableBorderColor: AppColors.kAccentColor,
                    focusColor: AppColors.kAppbarColor,
                  ),
                ],
              ),
      ),
      leading: InkWell(
        onTap: () {
          Get.back();
        },
        child: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      title: const Text('Add a credit or debit card'),
    );
  }
}
