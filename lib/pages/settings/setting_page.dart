import 'package:fix_ican/constants/assets_constant.dart';
import 'package:fix_ican/pages/settings/add_debit_card_page.dart';
import 'package:fix_ican/pages/settings/payment_setting_page.dart';
import 'package:fix_ican/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        // Get.toNamed(PaymentSettingScreen.routeName);
        Get.toNamed(AddDebitScreen.routeName, arguments: 'add');
      },
      leading: Image.asset(
        AssetsConstant.profile_icon,
        height: 18,
      ),
      title: Text(
        'Payment',
        style: AppTheme.textStyleMediumBlack16,
      ),
      trailing: Image.asset(
        AssetsConstant.date_forward_icon,
        color: Colors.black,
        height: 15,
      ),
    );
  }
}
