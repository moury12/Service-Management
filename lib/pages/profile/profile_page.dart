import 'package:fix_ican/constants/assets_constant.dart';
import 'package:fix_ican/constants/color_constant.dart';
import 'package:fix_ican/pages/order/checkout_page.dart';
import 'package:fix_ican/pages/profile/edit_profile_page.dart';
import 'package:fix_ican/shared/custom_sized_box.dart';
import 'package:fix_ican/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/Profile';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomSizedBox.space12H,
              Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(90),
                      child: Image.asset(
                        AssetsConstant.dummy_service,
                        height: 130,
                        width: 130,
                        fit: BoxFit.cover,
                      )),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.kPrimaryColor),
                        padding: EdgeInsets.all(5),
                        child: Image.asset(
                          AssetsConstant.edit_icon,
                          height: 18,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              CustomSizedBox.space12H,
              Text(
                'Mustafijur Rahman',
                style: AppTheme.textStyleSemiBoldBlack20,
              ),
              CustomSizedBox.space8H,
              Text(
                'Home: 52/A, Kalabagan, Dhaka.',
                style: AppTheme.textStyleSemiBoldFadeBlack14,
              ),
              CustomSizedBox.space12H,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Divider(
                  thickness: 2,
                  color: Color(0xffF1B2BF).withOpacity(.5),
                ),
              ),
              ListTile(
                onTap: () {
                  Get.toNamed(EditProfileScreen.routeName);
                  // Get.toNamed(PaymentSettingScreen.routeName);
                  //Get.toNamed(AddDebitScreen.routeName);
                },
                leading: Image.asset(
                  AssetsConstant.profile_icon,
                  height: 18,
                ),
                title: Text(
                  'Edit Profile',
                  style: AppTheme.textStyleMediumBlack16,
                ),
                trailing: Image.asset(
                  AssetsConstant.date_forward_icon,
                  color: Colors.black,
                  height: 15,
                ),
              ),
              ListTile(
                onTap: () {
                  // Get.toNamed(PaymentSettingScreen.routeName);
                  Get.toNamed(CheckoutScreen.routeName);
                },
                leading: Image.asset(
                  AssetsConstant.profile_icon2,
                  height: 18,
                ),
                title: Text(
                  'FAQ',
                  style: AppTheme.textStyleMediumBlack16,
                ),
                trailing: Image.asset(
                  AssetsConstant.date_forward_icon,
                  color: Colors.black,
                  height: 15,
                ),
              ),
              ListTile(
                onTap: () {
                  // Get.toNamed(PaymentSettingScreen.routeName);
                  //Get.toNamed(AddDebitScreen.routeName);
                },
                leading: Image.asset(
                  AssetsConstant.profile_icon3,
                  height: 18,
                ),
                title: Text(
                  'Privacy Policy',
                  style: AppTheme.textStyleMediumBlack16,
                ),
                trailing: Image.asset(
                  AssetsConstant.date_forward_icon,
                  color: Colors.black,
                  height: 15,
                ),
              ),
            ],
          ),
          ListTile(
            leading: Image.asset(
              AssetsConstant.logout_icon,
              height: 18,
            ),
            title: Text(
              'Logout',
              style: AppTheme.textStyleMediumPrimary16,
            ),
          )
        ],
      ),
    );
  }
}
