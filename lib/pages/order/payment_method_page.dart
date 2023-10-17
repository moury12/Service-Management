import 'package:fix_ican/constants/assets_constant.dart';
import 'package:fix_ican/shared/custom_scaffold.dart';
import 'package:fix_ican/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethodSelectionScreen extends StatefulWidget {
  static const String routeName = '/payment';

  const PaymentMethodSelectionScreen({super.key});

  @override
  State<PaymentMethodSelectionScreen> createState() =>
      _PaymentMethodSelectionScreenState();
}

class _PaymentMethodSelectionScreenState
    extends State<PaymentMethodSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Image.asset(
            AssetsConstant.cross_icon,
            height: 15,
          )),
      title: const Text('Select Payment Method'),
    );
  }
}
