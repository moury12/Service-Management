import 'package:fix_ican/constants/assets_constant.dart';
import 'package:fix_ican/constants/color_constant.dart';
import 'package:fix_ican/pages/home/home_page.dart';
import 'package:fix_ican/pages/services/basic_cleaning_page.dart';
import 'package:fix_ican/shared/custom_scaffold.dart';
import 'package:fix_ican/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/button/custom_button.dart';

class ServiceOfferDetails extends StatefulWidget {
  static const String routeName = '/serviceOfferDetails';

  const ServiceOfferDetails({super.key});

  @override
  State<ServiceOfferDetails> createState() => _ServiceOfferDetailsState();
}

class _ServiceOfferDetailsState extends State<ServiceOfferDetails> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    String argument = Get.arguments as String;
    return CustomScaffold(
      leading: InkWell(
        onTap: () {
          Get.back();
        },
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      title: Text(argument == 'offer' ? 'Offer Details' : 'Service Details'),
      bottom: CustomButton(
        label: argument == 'service' ? 'Continue' : 'Okay',
        onPressed: argument == 'service'
            ? () {
                Get.toNamed(BasicCleaningScreen.routeName);
              }
            : () {},
        marginHorizontal: 16,
        marginVertical: 12,
        suffixImage: argument == 'service' ? AssetsConstant.arrow_icon : null,
        suffixImageHeight: 11,
        borderRadiusAll: 22,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(AssetsConstant.dummy_service)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                'Catering Service',
                style: AppTheme.textStyleSemiBoldBlack20,
              ),
            ),
            Text(
              'Details: Lorem ipsum dolor sit amet consectetur. Elementum integer a sit euismod nunc id. Nec consequat aliquam blandit ullamcorper id nunc augue.',
              style: AppTheme.textStyleNormalBlack12,
            ),
            argument == 'service'
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      'Services',
                      style: AppTheme.textStyleSemiBoldBlack20,
                    ),
                  )
                : SizedBox.shrink(),
            argument == 'service'
                ? StatefulBuilder(builder: (context, setState) {
                    return Column(
                      children: [
                        ...List.generate(
                            2,
                            (index) => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        print('object');
                                        print(isChecked);
                                        setState(() {
                                          isChecked = !isChecked;
                                        });
                                        print(isChecked);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(2),
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            color: isChecked
                                                ? AppColors.kPrimaryColor
                                                : Colors.transparent,
                                            border: Border.all(
                                              color: Color(0xffFFD9D9),
                                              width: 1.4,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                        child: isChecked
                                            ? Image.asset(
                                                AssetsConstant.check_icon,
                                                height: 12,
                                              )
                                            : SizedBox.shrink(),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: HomeServiceItemWidget(
                                        label: SizedBox.shrink(),
                                        height: 33,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Breakfast, Lunch, Dinner',
                                          style:
                                              AppTheme.textStyleSemiBoldBlack12,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                              text: 'Estimated time:',
                                              style: AppTheme
                                                  .textStyleMediumBlack10,
                                              children: [
                                                TextSpan(
                                                  text: ' 2:30 hrs',
                                                )
                                              ]),
                                          style: AppTheme
                                              .textStyleNormalFadeBlack10,
                                        )
                                      ],
                                    ),
                                    Spacer(),
                                    Text(
                                      'Tk.1299',
                                      style: AppTheme.textStyleSemiBoldBlack12,
                                    )
                                  ],
                                ))
                      ],
                    );
                  })
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
