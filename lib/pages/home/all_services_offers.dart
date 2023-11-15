import 'package:fix_ican/constants/assets_constant.dart';
import 'package:fix_ican/constants/color_constant.dart';
import 'package:fix_ican/pages/home/home_page.dart';
import 'package:fix_ican/pages/services/service_offer_details.dart';
import 'package:fix_ican/shared/custom_scaffold.dart';
import 'package:fix_ican/shared/custom_sized_box.dart';
import 'package:fix_ican/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllServicesOffers extends StatefulWidget {
  static const String routeName = '/SeeAllserviceoffers';

  const AllServicesOffers({super.key});

  @override
  State<AllServicesOffers> createState() => _AllServicesOffersState();
}

class _AllServicesOffersState extends State<AllServicesOffers> {
  int currentIndexBanner1 = 0;
  PageController bannerController1 = PageController();
  List<String> bannerContent1 = [
    AssetsConstant.banner,
    AssetsConstant.banner,
    AssetsConstant.banner
  ];

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
      title: Text(argument == 'offer' ? 'All Offers' : 'Popular Services'),
      bottom: SizedBox.shrink(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSizedBox.space12H,
          SizedBox(
            height: 130,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: bannerController1,
              onPageChanged: (value) {
                setState(() {
                  currentIndexBanner1 = value;
                });
              },
              itemCount: bannerContent1.length,
              itemBuilder: (context, index) {
                currentIndexBanner1 = index;
                String data = bannerContent1[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Image.asset(
                    data,
                    width: Get.width,
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) => Icon(
                      Icons.image,
                    ),
                    height: 125,
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                3,
                (index) => AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.linear,
                      margin: const EdgeInsets.all(4),
                      width: currentIndexBanner1 == index ? 20 : 10,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 3,
                              color: currentIndexBanner1 == index
                                  ? AppColors.kPrimaryColor
                                  : AppColors.kPrimaryColor.withOpacity(.5)),
                          borderRadius: BorderRadius.circular(20)),
                    )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Text(
                  'Services:',
                  style: AppTheme.textStyleSemiBoldBlack16,
                ),
                CustomSizedBox.space8W,
                Text('/Shop', style: AppTheme.textStyleSemiBoldBlack16)
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            child: GridView.builder(
              shrinkWrap: true,
              primary: false,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 5,
                  childAspectRatio: .95),
              itemCount: 10,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Get.toNamed(ServiceOfferDetails.routeName,
                          arguments: argument);
                    },
                    child: OfferAndServicesWidget(
                      height: 70,
                      iconVisible: false,
                      subtitle: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.0),
                        child: Text(
                          'basic cleaning service',
                          style: AppTheme.textStyleMediumBlack12,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
