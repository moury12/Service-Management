import 'package:fix_ican/constants/color_constant.dart';
import 'package:fix_ican/pages/home/home_page.dart';
import 'package:fix_ican/pages/services/service_offer_details.dart';
import 'package:fix_ican/shared/custom_sized_box.dart';
import 'package:fix_ican/shared/enums.dart';
import 'package:fix_ican/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/button/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

class DealsDetailsScreen extends StatefulWidget {
  const DealsDetailsScreen({super.key});

  @override
  State<DealsDetailsScreen> createState() => _DealsDetailsScreenState();
}

class _DealsDetailsScreenState extends State<DealsDetailsScreen> {
  deals dealType = deals.About;
  List<String> imageUrls = [
    'https://media.istockphoto.com/id/1473162545/photo/senior-care-hug-and-portrait-of-nurse-with-patient-for-medical-help-healthcare-or.webp?b=1&s=170667a&w=0&k=20&c=utvVFt8ggaYLkaKo7Bm2rtPvXWWUf0m_1n-hZURpjJI=',
    'https://images.pexels.com/photos/518244/pexels-photo-518244.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://media.istockphoto.com/id/1466353453/photo/management-responsible-for-quality-control-iso-certification-product-quality-guarantee.webp?b=1&s=170667a&w=0&k=20&c=Aw_ZGT_TQInYjF0wiek4GugQQAsPE7YXjad7iPbNys0=',
    'https://media.istockphoto.com/id/1473162545/photo/senior-care-hug-and-portrait-of-nurse-with-patient-for-medical-help-healthcare-or.webp?b=1&s=170667a&w=0&k=20&c=utvVFt8ggaYLkaKo7Bm2rtPvXWWUf0m_1n-hZURpjJI=',
    'https://images.pexels.com/photos/518244/pexels-photo-518244.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://media.istockphoto.com/id/1473162545/photo/senior-care-hug-and-portrait-of-nurse-with-patient-for-medical-help-healthcare-or.webp?b=1&s=170667a&w=0&k=20&c=utvVFt8ggaYLkaKo7Bm2rtPvXWWUf0m_1n-hZURpjJI=',
    'https://media.istockphoto.com/id/1423369897/photo/call-center-worker.webp?b=1&s=170667a&w=0&k=20&c=SKeoIBoh9SG15iFz94tEoOOPg8OA0iivmtGj0HY_JL0=',
    'https://images.pexels.com/photos/518244/pexels-photo-518244.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://media.istockphoto.com/id/1423369897/photo/call-center-worker.webp?b=1&s=170667a&w=0&k=20&c=SKeoIBoh9SG15iFz94tEoOOPg8OA0iivmtGj0HY_JL0=',
  ];
  final String contact =
      '+8801716773054'; // Replace with the phone number you want to message
  final String message = 'Hello, this is a WhatsApp message!';
  final Uri smsLaunchUri = Uri(
    scheme: 'sms',
    path: '+8801716773054',
    queryParameters: <String, String>{
      'body': Uri.encodeComponent('Example Subject & Symbols are allowed!'),
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: Container(
              margin: EdgeInsets.all(8),
              decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                borderRadius: BorderRadius.circular(90),
                child: Icon(
                  Icons.arrow_back,
                  size: 20,
                  color: AppColors.kPrimaryColor,
                ),
              ),
            ),
            actions: [
              Container(
                decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(90),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.share,
                      size: 20,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(90),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.favorite_outline_rounded,
                      size: 20,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                ),
              ),
            ],
            expandedHeight: 230,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  alignment: Alignment.center,
                  fit: StackFit.expand,
                  children: [
                    Positioned.fill(
                      child: Container(
                        child: Image.network(
                          'https://images.pexels.com/photos/518244/pexels-photo-518244.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                          fit: BoxFit.cover,
                          height: 200,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 115,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey.withOpacity(.8)),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: InkWell(
                                onTap: () {},
                                borderRadius: BorderRadius.circular(90),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Icon(
                                    Icons.play_arrow_rounded,
                                    size: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'Demo Video',
                              style: AppTheme.textStyleSemiBoldWhite12,
                            ),
                            CustomSizedBox.space8W
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 30,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 3, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white),
                          child: Wrap(
                            children: [
                              ...List.generate(
                                  imageUrls.length > 6 ? 6 : imageUrls.length,
                                      (index) =>
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 3),
                                        child: Stack(
                                          children: [
                                            GestureDetector(
                                              child: ClipRRect(
                                                borderRadius:
                                                BorderRadius.circular(6),
                                                child: Image.network(
                                                  imageUrls[index],
                                                  fit: BoxFit.cover,
                                                  height: 50,
                                                  width: 50,
                                                ),
                                              ),
                                              onTap: () =>
                                                  Get.to(FullScreenImageScreen(
                                                    imageUrl: imageUrls[index],
                                                  )),
                                            ),
                                            index == 5
                                                ? Positioned(
                                              left: 0,
                                              right: 0,
                                              top: 0,
                                              bottom: 0,
                                              child: GestureDetector(
                                                onTap: () =>
                                                    Get.to(ImageGalleryScreen(
                                                      imageUrls: imageUrls,
                                                    )),
                                                child: Container(
                                                  height: 50,
                                                  width: 50,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      color: Colors.black12
                                                          .withOpacity(.5),
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(6)),
                                                  child: Text(
                                                    '+${imageUrls.length - 5}',
                                                    textAlign:
                                                    TextAlign.center,
                                                    style: AppTheme
                                                        .textStyleMediumWhite12,
                                                  ),
                                                ),
                                              ),
                                            )
                                                : SizedBox.shrink()
                                          ],
                                        ),
                                      ))
                            ],
                          ),
                        ))
                  ],
                )),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              CustomSizedBox.space12H,
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        'Home cleaning',
                        style: AppTheme.textStyleMediumPrimary12,
                      ),
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.kAccentColor.withOpacity(.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.star_rate_rounded,
                          size: 17,
                          color: Colors.orangeAccent,
                        ),
                        Text(
                          '4.5 (365 reviews)',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                              fontSize: 12),
                        )
                      ],
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Text(
                  'Deep House Cleaning',
                  style: AppTheme.textStyleSemiBoldBlack20,
                ),
              ),
              CustomSizedBox.space8H,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Text(
                  '0120 Ocean avanue, New yourk, USA',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      fontSize: 12),
                ),
              ),
              CustomSizedBox.space12H,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            'About',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: dealType == deals.About
                                    ? AppColors.kPrimaryColor
                                    : const Color(0xffFC8E99)),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          color: AppColors.kPrimaryColor,
                          height: dealType == deals.About ? 3 : 0,
                          width: dealType == deals.About
                              ? MediaQuery
                              .of(context)
                              .size
                              .width / 4.5
                              : 0,
                        )
                      ],
                    ),
                    onTap: () {
                      dealType = deals.About;
                      setState(() {});
                    },
                  ),
                  InkWell(
                    onTap: () {
                      dealType = deals.More;
                      setState(() {});
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            'More Service',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: dealType == deals.More
                                    ? AppColors.kPrimaryColor
                                    : const Color(0xffFC8E99)),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          color: AppColors.kPrimaryColor,
                          height: dealType == deals.More ? 3 : 0,
                          width: dealType == deals.More
                              ? MediaQuery
                              .of(context)
                              .size
                              .width / 3.5
                              : 0,
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      dealType = deals.Review;
                      setState(() {});
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            'Review',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: dealType == deals.Review
                                    ? AppColors.kPrimaryColor
                                    : const Color(0xffFC8E99)),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          color: AppColors.kPrimaryColor,
                          height: dealType == deals.Review ? 3 : 0,
                          width: dealType == deals.Review
                              ? MediaQuery
                              .of(context)
                              .size
                              .width / 4.5
                              : 0,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 0.5,
                height: 0,
                indent: 0,
                color: Color(0xffF1B2BF),
              ),
              dealType == deals.About
                  ? Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About Service',
                      style: AppTheme.textStyleSemiBoldBlack14,
                    ),
                    CustomSizedBox.space12H,
                    Text(
                      'Entertainers called ventriloquists can make dummies appear to talk. The automobile industry uses dummies in cars to study how safe cars are during a crash.',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          fontSize: 12),
                    ),
                    CustomSizedBox.space12H,
                    Text(
                      'Service Provider',
                      style: AppTheme.textStyleSemiBoldBlack14,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      minVerticalPadding: 12,
                      leading: ClipOval(
                        child: Image.network(
                            'https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250'),
                      ),
                      title: Text(
                        'jenny willson',
                        style: AppTheme.textStyleSemiBoldBlack16,
                      ),
                      subtitle: Text(
                        'Service Provider',
                        style: AppTheme.textStyleMediumFadeBlack12,
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            //margin: EdgeInsets.all(8),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.kAccentColor
                                    .withOpacity(.7)),
                            child: InkWell(
                              onTap: () {
                                Get.back();
                              },
                              borderRadius: BorderRadius.circular(90),
                              child: Icon(
                                Icons.textsms_rounded,
                                size: 20,
                                color: AppColors.kPrimaryColor,
                              ),
                            ),
                          ),
                          CustomSizedBox.space8W,
                          Container(
                            //margin: EdgeInsets.all(8),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.kAccentColor
                                    .withOpacity(.7)),
                            child: InkWell(
                              onTap: () {
                                Get.back();
                              },
                              borderRadius: BorderRadius.circular(90),
                              child: Icon(
                                Icons.call,
                                size: 20,
                                color: AppColors.kPrimaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
                  : dealType == deals.More
                  ? SizedBox(
                height: 520,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ...List.generate(
                            3,
                                (index) =>
                                Row(
                                  children: [
                                    ...List.generate(
                                        2,
                                            (index) =>
                                            GestureDetector(
                                                onTap: () {
                                                  Get.toNamed(
                                                      ServiceOfferDetails
                                                          .routeName,
                                                      arguments:
                                                      'service');
                                                },
                                                child:
                                                OfferAndServicesWidget()))
                                  ],
                                ))
                      ],
                    );

                    // GridView.builder(
                    //   shrinkWrap: true,
                    //   primary: false,
                    //   padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    //       crossAxisCount: 2,
                    //       mainAxisSpacing: 8,
                    //       crossAxisSpacing: 5,
                    //       childAspectRatio: .95),
                    //   itemCount: 4,
                    //   itemBuilder: (context, index) {
                    //     return GestureDetector(
                    //         onTap: () {
                    //           Get.toNamed(ServiceOfferDetails.routeName,
                    //               arguments: 'offer');
                    //         },
                    //         child: OfferAndServicesWidget());
                    //   },
                    // );
                  },
                ),
              )
                  : Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '4.0',
                          style: AppTheme.textStyleSemiBoldBlack20,
                        ),
                        CustomSizedBox.space8W,
                        ...List.generate(
                            5,
                                (index) =>
                                Icon(
                                  Icons.star_rate_rounded,
                                  color: index == 4
                                      ? Colors.grey.shade300
                                      : Colors.orangeAccent,
                                )),
                        CustomSizedBox.space4W,
                        Text(
                          '23 reviews',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade400,
                              fontSize: 12),
                        )
                      ],
                    ),
                    CustomSizedBox.space12H,
                    ...List.generate(
                        3,
                            (index) =>
                            Row(
                              children: [
                                Container(
                                  child: Text(
                                    'Cozy Place (12)',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                        fontSize: 12),
                                  ),
                                  padding: EdgeInsets.all(12),
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 4),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius:
                                      BorderRadius.circular(30)),
                                ),
                                Container(
                                  child: Text(
                                    'Not very crowded (18)',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                        fontSize: 12),
                                  ),
                                  padding: EdgeInsets.all(12),
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius:
                                      BorderRadius.circular(30)),
                                ),
                              ],
                            )),
                    ListTile(
                      horizontalTitleGap: 4,
                      contentPadding: EdgeInsets.zero,
                      minVerticalPadding: 0,

                      leading: ClipOval(
                        child: Image.network(
                          'https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250',
                          height: 30,
                        ),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'jenny willson',
                            style: AppTheme.textStyleSemiBoldBlack14,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star_rate_rounded,
                                size: 12,
                                color: Colors.orangeAccent,
                              ),
                              Text(
                                ' 5.0',
                                style:
                                AppTheme.textStyleMediumBlack10,
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: Text(
                        '11/3/2023',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade400,
                            fontSize: 12),
                      ),
                    ),
                    Text(
                      'Entertainers called ventriloquists can make dummies appear to talk. The automobile industry uses dummies in cars to study how safe cars are during a crash.',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          fontSize: 12),
                    ),
                  ],
                ),
              )
            ]),
          ),
          // SliverFillRemaining(
          //   hasScrollBody: false,
          //   child: Align(
          //     alignment: Alignment.bottomCenter,
          //     child: Container(
          //       width: double.infinity,
          //       padding: const EdgeInsets.all(16),
          //       decoration: BoxDecoration(
          //           color: Colors.white,
          //           borderRadius:
          //               const BorderRadius.vertical(top: Radius.circular(22)),
          //           boxShadow: [
          //             BoxShadow(
          //                 blurRadius: 10, color: Colors.black.withOpacity(.1))
          //           ]),
          //       child: Row(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text.rich(
          //             TextSpan(
          //               text: 'Total Price',
          //               style: TextStyle(
          //                 color: Colors.grey,
          //                 fontSize: 12,
          //                 fontWeight: FontWeight.w500,
          //               ),
          //               children: <TextSpan>[
          //                 TextSpan(
          //                   text: '\nTk. 2988',
          //                   style: TextStyle(
          //                     color: AppColors.kPrimaryColor,
          //                     fontSize: 18,
          //                     fontWeight: FontWeight.w600,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //           CustomSizedBox.space12W,
          //           Expanded(
          //             child: CustomButton(
          //               label: 'Book Now',
          //               onPressed: () {},
          //               marginHorizontal: 0,
          //               marginVertical: 0,
          //               borderRadiusAll: 22,
          //             ),
          //           )
          //         ],
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
      bottomNavigationBar: dealType == deals.About
          ? Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            height: 50,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.grey.shade100),
          ),
          Positioned(
            top: -25,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade100,
              ),
              padding: EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(.2),
                          blurRadius: 5)
                    ]),
                child: InkWell(
                  onTap: () {
                    _makePhoneCall(
                      'message',
                    );
                  },
                  borderRadius: BorderRadius.circular(90),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(
                      Icons.phone_android,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: -25,
            left: 30,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade100,
              ),
              padding: EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(.2),
                          blurRadius: 5)
                    ]),
                child: InkWell(
                  onTap: () {
                    _openWhatsApp();
                  },
                  borderRadius: BorderRadius.circular(90),
                  child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        'assets/icons/whatsapp.png',
                        height: 20,
                      )),
                ),
              ),
            ),
          ),
          Positioned(
            top: -25,
            right: 30,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade100,
              ),
              padding: EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(.2),
                          blurRadius: 5)
                    ]),
                child: InkWell(
                  onTap: () {
                    _launchUrl();
                  },
                  borderRadius: BorderRadius.circular(90),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(
                      Icons.sms,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      )
          : Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
            const BorderRadius.vertical(top: Radius.circular(22)),
            boxShadow: [
              BoxShadow(
                  blurRadius: 10, color: Colors.black.withOpacity(.1))
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
                text: 'Total Price',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '\nTk. 2988',
                    style: TextStyle(
                      color: AppColors.kPrimaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            CustomSizedBox.space12W,
            Expanded(
              child: CustomButton(
                label: 'Book Now',
                onPressed: () {},
                marginHorizontal: 0,
                marginVertical: 0,
                borderRadiusAll: 22,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(smsLaunchUri)) {
      throw Exception('Could not launch $smsLaunchUri');
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> _openWhatsApp() async {
    var url = "whatsapp://send?phone=$contact&text=Hi, I need some help";
    await launchUrl(Uri.parse(url));
    // if (await canLaunchUrl(Uri.parse(url))) {
    //   await launchUrl(Uri.parse(url));
    // } else {
    //   throw 'Could not launch WhatsApp.';
    // }
  }
}

class ImageGalleryScreen extends StatelessWidget {
  final List<String> imageUrls;

  ImageGalleryScreen({required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: PageView.builder(
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return Image.network(
            imageUrls[index],
          );
        },
      ),
    );
  }
}

class FullScreenImageScreen extends StatelessWidget {
  final String imageUrl;

  FullScreenImageScreen({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Image.network(
          imageUrl,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
