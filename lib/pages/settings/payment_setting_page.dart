import 'package:fix_ican/constants/assets_constant.dart';
import 'package:fix_ican/constants/color_constant.dart';
import 'package:fix_ican/pages/settings/add_debit_card_page.dart';
import 'package:fix_ican/shared/custom_scaffold.dart';
import 'package:fix_ican/shared/custom_sized_box.dart';
import 'package:fix_ican/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentSettingScreen extends StatelessWidget {
  static const String routeName = '/paymentsettibg';

  const PaymentSettingScreen({super.key});

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
      title: const Text('Add a credit or debit card'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    Icons.save,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: AppColors.kAppbarColor,
                  ),
                ),
                CustomSizedBox.space8W,
                Text(
                  'Saved Card',
                  style: AppTheme.textStyleSemiBoldBlack18,
                )
              ],
            ),
            CustomSizedBox.space12H,
            ClipRRect(borderRadius: BorderRadius.circular(9), child: Image.asset(AssetsConstant.visa_card)),
            CustomSizedBox.space12H,
            InkWell(
              onTap: () {
                Get.toNamed(AddDebitScreen.routeName);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    color: AppColors.kPrimaryColor,
                  ),
                  CustomSizedBox.space4W,
                  Text(
                    'Add Card',
                    style: AppTheme.textStyleMediumPrimary14,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottom: SizedBox.shrink(),
    );
  }
}
