import 'package:fix_ican/constants/assets_constant.dart';
import 'package:fix_ican/pages/home/deals_details_page.dart';
import 'package:fix_ican/shared/custom_scaffold.dart';
import 'package:fix_ican/shared/custom_sized_box.dart';
import 'package:fix_ican/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllDealsScreen extends StatelessWidget {
  const AllDealsScreen({super.key});

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
      action: [],
      title: Text('Special Offer', style: AppTheme.textStyleSemiBoldWhite18),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSizedBox.space8H,
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(
              'Fixican Deals',
              style: AppTheme.textStyleSemiBoldBlack16,
            ),
          ),
          featureWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ).copyWith(top: 12),
            child: Text(
              'Fixican Deals',
              style: AppTheme.textStyleSemiBoldBlack16,
            ),
          ),
          featureWidget(),
        ],
      ),
    );
  }
}

class featureWidget extends StatelessWidget {
  const featureWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: GestureDetector(
          onTap: () {
            Get.to(DealsDetailsScreen());
          },
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                AssetsConstant.dummy_service,
                height: 160,
                fit: BoxFit.cover,
              )),
        ),
      ),
      itemCount: 3,
    );
  }
}
