import 'package:fix_ican/constants/color_constant.dart';
import 'package:fix_ican/shared/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/textfield/custom_textfield.dart';

class EditProfileScreen extends StatelessWidget {
  static const String routeName = '/editProfile';

  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      bottom: SizedBox.shrink(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          children: [
            CustomTextField(
              borderRadius: 10,
              maxLine: 2,
              labelText: 'Full Name',
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
              borderRadius: 10,
              keyboardType: TextInputType.phone,
              maxLine: 2,
              labelText: 'Mobile Number',
              onSubmitted: (p0) {},
              labelFontWeight: FontWeight.w500,
              labelSize: 16,
              labelColor: Colors.black.withOpacity(.7),
              hintText: '2198759759',
              marginVertical: 12,
              fillColor: Colors.white,
              enableBorderColor: AppColors.kAccentColor,
              focusColor: AppColors.kAppbarColor,
            ),
            CustomTextField(
              borderRadius: 10,
              maxLine: 2,
              labelText: 'Location',
              onSubmitted: (p0) {},
              labelFontWeight: FontWeight.w500,
              labelSize: 16,
              labelColor: Colors.black.withOpacity(.7),
              hintText: '51/A, Kalabagan, Dhanmondi, Dhaka',
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
      title: const Text('Edit Profile'),
    );
  }
}
