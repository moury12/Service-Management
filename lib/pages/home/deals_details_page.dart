import 'package:fix_ican/constants/color_constant.dart';
import 'package:fix_ican/pages/home/home_page.dart';
import 'package:fix_ican/pages/order/e_commerce_panel_Screen.dart';
import 'package:fix_ican/pages/order/review_page.dart';
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

class _DealsDetailsScreenState extends State<DealsDetailsScreen>
    with SingleTickerProviderStateMixin {
  deals dealType = deals.About;
  late TabController tabController;
  String? displayUrl;

  List<String> tabTiles = ['About', 'More Service', 'Review'];
  int currentIndex = 0;
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
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      setState(() {
        currentIndex = tabController.index;
      });
      print("Current Tab Index: $currentIndex");
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

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
              margin: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                borderRadius: BorderRadius.circular(90),
                child: const Icon(
                  Icons.arrow_back,
                  size: 20,
                  color: AppColors.kPrimaryColor,
                ),
              ),
            ),
            actions: [
              Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(EcommercepanelScreen.routeName);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.share,
                      size: 20,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(90),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
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
                      displayUrl ??
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
                          margin: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(90),
                            child: const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Icon(
                                Icons.play_arrow_rounded,
                                size: 20,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        const Text(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 3, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                      child: Wrap(
                        children: [
                          ...List.generate(
                              imageUrls.length > 6 ? 6 : imageUrls.length,
                              (index) => Padding(
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
                                            onTap: () {
                                              setState(() {
                                                displayUrl = imageUrls[index];
                                              });
                                            }),
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
                                            : const SizedBox.shrink()
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
                      child: const Text(
                        'Home cleaning',
                        style: AppTheme.textStyleMediumPrimary12,
                      ),
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.kAccentColor.withOpacity(.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    const Row(
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
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Text(
                  'Deep House Cleaning',
                  style: AppTheme.textStyleSemiBoldBlack20,
                ),
              ),
              CustomSizedBox.space8H,
              const Padding(
                padding: EdgeInsets.symmetric(
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Text(
                  '2000 BDT/ month',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.kPrimaryColor,
                      fontSize: 12),
                ),
              ),
              TabBar(
                  labelColor: AppColors.kPrimaryColor,
                  indicatorColor: AppColors.kPrimaryColor,
                  dividerColor: AppColors.kPrimaryColor,
                  controller: tabController,
                  tabs: tabTiles.map((String title) {
                    return Tab(
                      text: title,
                    );
                  }).toList()),
              CustomSizedBox.space12H,
              SizedBox(
                height: 300,
                child: TabBarView(
                    controller: tabController,
                    children: List.generate(3, (index) => buildwidget(index))),
              ),
            ]),
          ),
        ],
      ),
      bottomNavigationBar: currentIndex == 0
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
                    padding: const EdgeInsets.all(16),
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
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
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
                    padding: const EdgeInsets.all(16),
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
                    padding: const EdgeInsets.all(16),
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
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
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
          : currentIndex == 2
              ? Container(
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
                      // Text.rich(
                      //   TextSpan(
                      //     text: 'Total Price',
                      //     style: TextStyle(
                      //       color: Colors.grey,
                      //       fontSize: 12,
                      //       fontWeight: FontWeight.w500,
                      //     ),
                      //     children: <TextSpan>[
                      //       TextSpan(
                      //         text: '\nTk. 2988',
                      //         style: TextStyle(
                      //           color: AppColors.kPrimaryColor,
                      //           fontSize: 18,
                      //           fontWeight: FontWeight.w600,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // CustomSizedBox.space12W,
                      Expanded(
                        child: CustomButton(
                          label: 'Write Review',
                          onPressed: () {
                            Get.to(const ReviewScreen());
                          },
                          marginHorizontal: 0,
                          marginVertical: 0,
                          borderRadiusAll: 22,
                        ),
                      )
                    ],
                  ),
                )
              : const SizedBox.shrink(),
    );
  }

  // Widget bottomWidget(){}

  Widget buildwidget(int tabIndex) {
    switch (tabIndex) {
      case 0:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'About Service',
                style: AppTheme.textStyleSemiBoldBlack14,
              ),
              CustomSizedBox.space12H,
              const Text(
                'Entertainers called ventriloquists can make dummies appear to talk. The automobile industry uses dummies in cars to study how safe cars are during a crash.',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    fontSize: 12),
              ),
              CustomSizedBox.space12H,
              const Text(
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
                title: const Text(
                  'jenny willson',
                  style: AppTheme.textStyleSemiBoldBlack16,
                ),
                subtitle: const Text(
                  'Service Provider',
                  style: AppTheme.textStyleMediumFadeBlack12,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      //margin: EdgeInsets.all(8),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.kAccentColor.withOpacity(.7)),
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        borderRadius: BorderRadius.circular(90),
                        child: const Icon(
                          Icons.textsms_rounded,
                          size: 20,
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                    ),
                    CustomSizedBox.space8W,
                    Container(
                      //margin: EdgeInsets.all(8),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.kAccentColor.withOpacity(.7)),
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        borderRadius: BorderRadius.circular(90),
                        child: const Icon(
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
        );

      case 1:
        return GridView.builder(
          shrinkWrap: true,
          primary: false,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
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
                      arguments: 'service');
                },
                child: const OfferAndServicesWidget(
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
        );
      case 2:
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    '4.0',
                    style: AppTheme.textStyleSemiBoldBlack20,
                  ),
                  CustomSizedBox.space8W,
                  ...List.generate(
                      5,
                      (index) => Icon(
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
                  (index) => Row(
                        children: [
                          Container(
                            child: const Text(
                              'Cozy Place (12)',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                  fontSize: 12),
                            ),
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 4),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          Container(
                            child: const Text(
                              'Not very crowded (18)',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                  fontSize: 12),
                            ),
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(30)),
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
                title: const Column(
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
                          style: AppTheme.textStyleMediumBlack10,
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
              const Text(
                'Entertainers called ventriloquists can make dummies appear to talk. The automobile industry uses dummies in cars to study how safe cars are during a crash.',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    fontSize: 12),
              ),
            ],
          ),
        );
      default:
        return Center(
          child: Text(
            'Unknown Tab',
            style: TextStyle(fontSize: 10),
          ),
        );
    }
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
