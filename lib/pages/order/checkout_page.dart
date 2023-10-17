import 'package:fix_ican/shared/custom_scaffold.dart';
import 'package:fix_ican/theme/theme_data.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  static const String routeName = '/checkout';

  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),

    );
    // return CustomScaffold(
    //   title: Text.rich(TextSpan(
    //       text: 'Order Review',
    //       style: AppTheme.textStyleSemiBoldWhite18,
    //       children: [
    //         TextSpan(
    //             text: '\nCustomer ID: CA56589',
    //             style: AppTheme.textStyleSemiBoldWhite10)
    //       ])),
    // );
  }
}
