import 'package:fix_ican/constants/assets_constant.dart';
import 'package:fix_ican/constants/color_constant.dart';
import 'package:fix_ican/pages/order/place_order_page.dart';
import 'package:fix_ican/shared/custom_scaffold.dart';
import 'package:fix_ican/shared/custom_sized_box.dart';
import 'package:fix_ican/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/button/custom_button.dart';

class AllCleaningProcessScreen extends StatelessWidget {
  final String? title;
  final bool? isCustom;
  static const String routeName = '/weekly';

  const AllCleaningProcessScreen(
      {super.key, this.title, this.isCustom = false});

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
                color: const Color(0xffFFE5E5),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Frequency',
                      style: AppTheme.textStyleSemiBoldBlack18,
                    ),
                    CustomSizedBox.space4H,
                    Text(
                      'Change',
                      style: TextStyle(
                          color: AppColors.kPrimaryColor, fontSize: 13),
                    )
                  ],
                ),
                Container(
                  // margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                      color: const Color(0xffFFF9F9),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    title ?? 'Weekly',
                    style: const TextStyle(
                        color: AppColors.kPrimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Choose your preferred professional',
              style: AppTheme.textStyleSemiBoldBlack16,
            ),
          ),
          SizedBox(
            height: 180,
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 10),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return index == 0
                    ? Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 12),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                            color: const Color(0xffFFE6EB),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                width: 1, color: const Color(0xffFC8E99))),
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: AppColors.kPrimaryColor,
                                borderRadius: BorderRadius.circular(190),
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    AssetsConstant.auto_assign_icon,
                                    height: 21,
                                    fit: BoxFit.cover,
                                  ),
                                  const Text(
                                    'iMaids',
                                    style: AppTheme.textStyleSemiBoldWhite12,
                                  )
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.0),
                              child: Text(
                                'Auto-assign',
                                style: AppTheme.textStyleSemiBoldBlack16,
                              ),
                            ),
                            const Text(
                              'We’ll assign the best professional',
                              style: AppTheme.textStyleNormalFadeBlack10,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )
                    : Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 12),
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                    width: 1, color: const Color(0xffFC8E99))),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(190),
                                  child: Image.asset(
                                    AssetsConstant.dummy_service,
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12.0),
                                  child: Text(
                                    'Samantha',
                                    style: AppTheme.textStyleSemiBoldBlack16,
                                  ),
                                ),
                                const Text(
                                  'Recommended in your area',
                                  style: AppTheme.textStyleNormalFadeBlack10,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          Positioned.fill(
                            child: Container(
                              color: title == 'One Time' || title == 'Custom'
                                  ? Colors.white.withOpacity(.5)
                                  : null,
                            ),
                          )
                        ],
                      );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Select Date',
                  style: AppTheme.textStyleSemiBoldBlack16,
                ),
                Row(
                  children: [
                    Image.asset(
                      AssetsConstant.date_back_icon,
                      height: 15,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'January',
                        style: AppTheme.textStyleSemiBoldBlack14,
                      ),
                    ),
                    Image.asset(
                      AssetsConstant.date_forward_icon,
                      height: 15,
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 10, top: 12),
              scrollDirection: Axis.horizontal,
              itemCount: 15,
              itemBuilder: (context, index) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26),
                      border:
                          Border.all(width: 1, color: const Color(0xffFC8E99))),
                  child: const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          'Wed',
                          style: AppTheme.textStyleSemiBoldBlack16,
                        ),
                      ),
                      Text(
                        '28',
                        style: AppTheme.textStyleSemiBoldBlack14,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: Text(
              'Select your preferred time',
              style: AppTheme.textStyleSemiBoldBlack16,
            ),
          ),
          isCustom == true
              ? Column(
                  children: [
                    ...List.generate(
                        3,
                        (index) => Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                      color: const Color(0xffFFE6EB),
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                          width: 0.5,
                                          color: const Color(0xffFC8E99))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomSizedBox.space4W,
                                      const Text(
                                        'Sun 25',
                                        style:
                                            AppTheme.textStyleSemiBoldBlack16,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 16),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 6),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(26),
                                            border: Border.all(
                                                width: 1,
                                                color:
                                                    const Color(0xffFC8E99))),
                                        child: Row(
                                          children: [
                                            const Text(
                                              '12:30 - 01:00',
                                              style: AppTheme
                                                  .textStyleSemiBoldBlack16,
                                            ),
                                            CustomSizedBox.space8W,
                                            Image.asset(
                                              AssetsConstant.arrow_down_icon,
                                              height: 10,
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Positioned(
                                    top: 8,
                                    bottom: 8,
                                    left: 16,
                                    child: Image.asset(
                                        AssetsConstant.custom_stack_img))
                              ],
                            )),
                    SizedBox(
                      height: 120,
                    )
                  ],
                )
              : SizedBox(
                  height: 40,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 16),
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(26),
                            border: Border.all(
                                width: 1, color: const Color(0xffFC8E99))),
                        child: const Text(
                          '12:30 - 01:00',
                          style: AppTheme.textStyleSemiBoldBlack16,
                        ),
                      );
                    },
                  ),
                ),
          CustomSizedBox.space12H,
        ],
      ),
      bottom: Container(
        height: 120,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
            boxShadow: [
              BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(.1))
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: 'Total',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '(Inc. VAT where applicable)',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Tk. 2988',
                  style: AppTheme.textStyleBoldBlack18,
                )
              ],
            ),
            CustomSizedBox.space16H,
            CustomButton(
              label: 'Continue',
              onPressed: () {
                Get.toNamed(PlaceOrderScreen.routeName);
              },
              marginHorizontal: 0,
              marginVertical: 0,
              suffixImage: AssetsConstant.arrow_icon,
              suffixImageHeight: 11,
              borderRadiusAll: 22,
            )
          ],
        ),
      ),
      title: const Text('Basic Cleaning'),
    );
  }
}
