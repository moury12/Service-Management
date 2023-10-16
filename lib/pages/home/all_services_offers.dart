import 'package:fix_ican/constants/assets_constant.dart';
import 'package:fix_ican/pages/home/home_page.dart';
import 'package:fix_ican/pages/services/service_offer_details.dart';
import 'package:fix_ican/shared/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllServicesOffers extends StatelessWidget {
  static const String routeName = '/serviceoffers';

  const AllServicesOffers({super.key});

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
      body: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
        child: GridView.builder(
          shrinkWrap: true,
          primary: false,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 5),
          itemCount: 10,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  Get.toNamed(ServiceOfferDetails.routeName,
                      arguments: argument);
                },
                child: OfferAndServicesWidget());
          },
        ),
      ),
    );
  }
}
