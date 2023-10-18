import 'package:fix_ican/constants/assets_constant.dart';
import 'package:fix_ican/constants/color_constant.dart';
import 'package:fix_ican/shared/custom_scaffold.dart';
import 'package:fix_ican/shared/custom_sized_box.dart';
import 'package:fix_ican/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:mh_core/widgets/textfield/custom_textfield.dart';

class DeliveryDetailsScreen extends StatefulWidget {
  static const String routeName = '/deliveryDetails';

  const DeliveryDetailsScreen({super.key});

  @override
  State<DeliveryDetailsScreen> createState() => _DeliveryDetailsScreenState();
}

class _DeliveryDetailsScreenState extends State<DeliveryDetailsScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      bottom: SizedBox.shrink(),
      leading: InkWell(
        onTap: () {
          Get.back();
        },
        child: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      title: const Text('Delivery Details'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                    const Spacer(),
                    Image.asset(
                      AssetsConstant.edit_icon2,
                      height: 18,
                    )
                  ],
                ),
                CustomSizedBox.space12H,
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(AssetsConstant.map_img),
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        keyboardType: TextInputType.phone,
                        maxLine: 2,
                        onSubmitted: (p0) {},
                        labelFontWeight: FontWeight.w500,
                        labelSize: 16,
                        labelColor: Colors.black.withOpacity(.7),
                        hintText: 'Road',
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
                        keyboardType: TextInputType.phone,
                        maxLine: 2,
                        onSubmitted: (p0) {},
                        labelFontWeight: FontWeight.w500,
                        labelSize: 16,
                        marginHorizontal: 0,
                        labelColor: Colors.black.withOpacity(.7),
                        hintText: 'Block',
                        marginVertical: 12,
                        fillColor: Colors.white,
                        enableBorderColor: AppColors.kAccentColor,
                        focusColor: AppColors.kAppbarColor,
                      ),
                    ),
                  ],
                ),
                CustomTextField(
                  keyboardType: TextInputType.phone,
                  maxLine: 2,
                  onSubmitted: (p0) {},
                  labelFontWeight: FontWeight.w500,
                  labelSize: 16,
                  marginHorizontal: 0,
                  labelColor: Colors.black.withOpacity(.7),
                  hintText: 'Area',
                  marginVertical: 0,
                  fillColor: Colors.white,
                  enableBorderColor: AppColors.kAccentColor,
                  focusColor: AppColors.kAppbarColor,
                ),
                CustomTextField(
                  keyboardType: TextInputType.phone,
                  maxLine: 2,
                  onSubmitted: (p0) {},
                  labelFontWeight: FontWeight.w500,
                  labelSize: 16,
                  marginHorizontal: 0,
                  labelColor: Colors.black.withOpacity(.7),
                  hintText: 'Apartment Name',
                  marginVertical: 12,
                  fillColor: Colors.white,
                  enableBorderColor: AppColors.kAccentColor,
                  focusColor: AppColors.kAppbarColor,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              'Delivery Instructions',
              style: AppTheme.textStyleSemiBoldBlack18,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(
              'Please give us more information about your address',
              style: AppTheme.textStyleSemiBoldfadeBlack12,
            ),
          ),
          CustomTextField(
            keyboardType: TextInputType.phone,
            maxLine: 2,
            onSubmitted: (p0) {},
            labelFontWeight: FontWeight.w500,
            labelSize: 16,
            marginHorizontal: 16,
            labelColor: Colors.black.withOpacity(.7),
            hintText: '(Optional) Floor or Apt No or tell us more info..',
            marginVertical: 12,
            fillColor: Colors.transparent,
            enableBorderColor: AppColors.kAccentColor,
            focusColor: AppColors.kAppbarColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    print('object');
                    print(isChecked);
                    setState(() {
                      isChecked = !isChecked;
                    });
                    print(isChecked);
                  },
                  child: Container(
                    padding: EdgeInsets.all(2),
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: isChecked
                            ? AppColors.kPrimaryColor
                            : Colors.transparent,
                        border: Border.all(
                          color: Color(0xffFFD9D9),
                          width: 1.4,
                        ),
                        borderRadius: BorderRadius.circular(3)),
                    child: isChecked
                        ? Image.asset(
                            AssetsConstant.check_icon,
                            height: 12,
                          )
                        : SizedBox.shrink(),
                  ),
                ),
                CustomSizedBox.space8W,
                Text(
                  'Save This Location',
                  style: AppTheme.textStyleSemiBoldFadeBlack14,
                ),
              ],
            ),
          ),
          CustomSizedBox.space12H,
          CustomButton(
            label: 'Save and Continue',
            onPressed: () {},
            marginHorizontal: 16,
            marginVertical: 12,
            borderRadiusAll: 22,
          ),
        ],
      ),
    );
  }
}
