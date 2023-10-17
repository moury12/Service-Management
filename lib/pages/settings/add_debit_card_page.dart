import 'package:fix_ican/constants/color_constant.dart';
import 'package:fix_ican/shared/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/textfield/custom_textfield.dart';

class AddDebitScreen extends StatelessWidget {
  static const String routeName = '/addcard';

  const AddDebitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      bottom: SizedBox.shrink(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          children: [
            CustomTextField(
              keyboardType: TextInputType.phone,
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
              keyboardType: TextInputType.phone,
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
