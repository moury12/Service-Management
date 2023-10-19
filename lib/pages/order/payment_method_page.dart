import 'package:fix_ican/constants/assets_constant.dart';
import 'package:fix_ican/constants/color_constant.dart';
import 'package:fix_ican/pages/settings/add_debit_card_page.dart';
import 'package:fix_ican/shared/custom_scaffold.dart';
import 'package:fix_ican/shared/custom_sized_box.dart';
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
  String groupValue = 'Cash';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      action: [],
      leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset(
              AssetsConstant.cross_icon,
              height: 10,
            ),
          )),
      title: const Text('Select Payment Method'),
      body: Column(
        children: [
          CustomSizedBox.space8H,
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(blurRadius: 2, color: Colors.black.withOpacity(.04))
                ],
                borderRadius: BorderRadius.circular(10)),
            child: InkWell(
              onTap: () =>
                  Get.toNamed(AddDebitScreen.routeName, arguments: 'edit'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AssetsConstant.card_icon, height: 15),
                  const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      'Credit Card',
                      style: AppTheme.textStyleMediumBlack16,
                    ),
                  ),
                  Spacer(),
                  Image.asset(
                    AssetsConstant.date_forward_icon,
                    color: AppColors.kAppbarColor,
                    height: 10,
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(blurRadius: 2, color: Colors.black.withOpacity(.04))
                ],
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AssetsConstant.cash_icon, height: 15),
                const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    'Cash',
                    style: AppTheme.textStyleMediumBlack16,
                  ),
                ),
                Spacer(),
                Radio(
                  activeColor: AppColors.kAppbarColor,
                  fillColor: MaterialStateColor.resolveWith(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.selected)) {
                        return AppColors.kAppbarColor;
                      }
                      return AppColors.kAppbarColor;
                    },
                  ),
                  value: 'Cash',
                  groupValue: groupValue,
                  onChanged: (value) {
                    setState(() {
                      groupValue = value!;
                    });
                  },
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(blurRadius: 2, color: Colors.black.withOpacity(.04))
                ],
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AssetsConstant.bkash_icon, height: 20),
                const Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bkash',
                        style: AppTheme.textStyleMediumBlack16,
                      ),
                      CustomSizedBox.space4H,
                      Text(
                        'Get 5% discount on Bkash payment ',
                        style: AppTheme.textStyleNormalBlack10,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Radio(
                  activeColor: AppColors.kAppbarColor,
                  fillColor: MaterialStateColor.resolveWith(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.selected)) {
                        return AppColors.kAppbarColor;
                      }
                      return AppColors.kAppbarColor;
                    },
                  ),
                  value: 'Bkash',
                  groupValue: groupValue,
                  onChanged: (value) {
                    setState(() {
                      groupValue = value!;
                    });
                  },
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(blurRadius: 2, color: Colors.black.withOpacity(.04))
                ],
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AssetsConstant.nagad_icon, height: 20),
                const Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nagad',
                        style: AppTheme.textStyleMediumBlack16,
                      ),
                      CustomSizedBox.space4H,
                      Text(
                        'Get 5% discount on Bkash payment ',
                        style: AppTheme.textStyleNormalBlack10,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Radio(
                  activeColor: AppColors.kAppbarColor,
                  fillColor: MaterialStateColor.resolveWith(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.selected)) {
                        return AppColors.kAppbarColor;
                      }
                      return AppColors.kAppbarColor;
                    },
                  ),
                  value: 'Nagad',
                  groupValue: groupValue,
                  onChanged: (value) {
                    setState(() {
                      groupValue = value!;
                    });
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
