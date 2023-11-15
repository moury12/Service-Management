import 'package:fix_ican/constants/assets_constant.dart';
import 'package:fix_ican/constants/color_constant.dart';
import 'package:fix_ican/pages/splash/onboarding_page.dart';
import 'package:fix_ican/shared/custom_sized_box.dart';
import 'package:fix_ican/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/button/custom_button.dart';

class LanguageSelectionScreen extends StatefulWidget {
  static const String routeName = '/languageSelection';

  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String groupValue = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 477,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(50)),
                color: AppColors.kPrimaryColor.withOpacity(.07),
                image: const DecorationImage(
                    image: AssetImage(
                  AssetsConstant.language_image,
                ))),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Select Language',
                    style: AppTheme.textStyleSemiBoldBlack20,
                  ),
                  CustomSizedBox.space12H,
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.kBorderColor, width: 1),
                        borderRadius: BorderRadius.circular(6)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('বাংলা',
                            style: AppTheme.textStyleMediumBlack14),
                        Radio(
                          value: 'বাংলা',
                          activeColor: AppColors.kPrimaryColor,
                          groupValue: groupValue,
                          onChanged: (value) {
                            setState(() {
                              groupValue = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  CustomSizedBox.space4H,
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        border: Border.all(
                          color: AppColors.kBorderColor,
                          // Set the left border color
                          width: 1,
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('English',
                            style: AppTheme.textStyleMediumBlack14),
                        Radio(
                          value: 'English',
                          activeColor: AppColors.kPrimaryColor,
                          groupValue: groupValue,
                          onChanged: (value) {
                            setState(() {
                              groupValue = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  CustomSizedBox.space4H,
                  Text(
                    '*You can change language later from settings tab',
                    style: AppTheme.textStyleNormalBlack14,
                  ),
                  CustomSizedBox.space16H,
                  CustomButton(
                    label: 'Next',
                    onPressed: () {
                      Get.toNamed(OnboardingScreen.routeName);
                    },
                    primary: AppColors.kPrimaryColor,
                    marginHorizontal: 0,
                    marginVertical: 18,
                    borderRadiusAll: 22,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
