import 'package:fix_ican/constants/assets_constant.dart';
import 'package:fix_ican/constants/color_constant.dart';
import 'package:fix_ican/pages/home/all_deals_page.dart';
import 'package:fix_ican/pages/home/all_services_offers.dart';
import 'package:fix_ican/pages/services/service_offer_details.dart';
import 'package:fix_ican/shared/custom_sized_box.dart';
import 'package:fix_ican/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mh_core/utils/global.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool showMore = false;
  int currentIndexBanner1 = 0;
  PageController bannerController1 = PageController();
  int currentIndexBanner2 = 0;
  PageController bannerController2 = PageController();
  double dynamicHeight = 0.2;
  int gridItem = 16;

  Color? containerColor = Colors.white.withOpacity(.6);

  AnimationController? _controller;
  Animation<double>? _animation;

  String selectedCategory = '';
  List<String> bannerContent1 = [
    AssetsConstant.banner,
    AssetsConstant.banner,
    AssetsConstant.banner
  ];
  List<String> bannerContent2 = [
    AssetsConstant.banner,
    AssetsConstant.banner,
    AssetsConstant.banner
  ];
  List<Map<String, dynamic>> categoryList = [
    {'category': 'All', 'isSelected': true},
    {'category': 'Cleaning', 'isSelected': false},
    {'category': 'Repairing', 'isSelected': false},
    {'category': 'Painting', 'isSelected': false}
  ];

  void _up() {
    setState(() {
      if (showMore) {
        _controller!.forward(from: 0.0);
      } else {
        _controller!.reverse(from: 1.0);
      }
    });
  }

  @override
  void initState() {
    bannerController1 = PageController(initialPage: 0);
    bannerController2 = PageController(initialPage: 0);

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animation = CurvedAnimation(
      parent: _controller!,
      curve: Interval(0.0, 1.0, curve: Curves.linear),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: showMore ? 72 : 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSizedBox.space12H,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Service Category',
                      style: AppTheme.textStyleSemiBoldBlack16,
                    ),
                  ),
                  AnimatedBuilder(
                      animation: _animation!,
                      builder: (context, child) {
                        globalLogger.d(_animation!.value);
                        return Container(
                          child: GridView.builder(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 16),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    mainAxisSpacing: 30,
                                    crossAxisSpacing: 30),
                            itemCount: /*showMore
                                ?*/
                                gridItem >= 8
                                    ? 8 +
                                        ((gridItem - 8) ~/
                                            4 *
                                            (_animation!.value * 4)
                                                .floor()
                                                .toInt()) +
                                        (_animation!.value == 1
                                            ? (gridItem % 4)
                                            : 0)
                                    : gridItem,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return const HomeServiceItemWidget();
                            },
                          ),
                        );
                      }),
                ],
              ),
            ),
            AnimatedPositioned(
              onEnd: () {
                if (showMore) {
                  containerColor = null;
                  setState(() {});
                }
              },
              top: 30 +
                  (showMore
                      ? (90.0 * (gridItem / 4.0).ceil())
                      : gridItem > 4
                          ? 105
                          : 25),
              left: 0,
              right: 0,
              duration: Duration(milliseconds: 300),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                color: containerColor,
                width: double.infinity,
                height: 90,
                clipBehavior: Clip.none,
                child: FittedBox(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(.2),
                              blurRadius: 5)
                        ],
                        gradient: const LinearGradient(
                            colors: [
                              AppColors.kPrimaryColor,
                              Color(0xffFFA0A9)
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                        color: Colors.red),
                    child: Material(
                      type: MaterialType.transparency,
                      borderRadius: BorderRadius.circular(20),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          if (!showMore) {
                            setState(() {
                              containerColor = Colors.white.withOpacity(.6);
                              showMore = true;
                            });
                          } else {
                            setState(() {
                              containerColor = Colors.white.withOpacity(.6);
                              showMore = false;
                            });
                          }
                          _up();
                        },
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                showMore ? "Show Less" : 'Show More',
                                style: AppTheme.textStyleMediumWhite12,
                              ),
                              Icon(
                                showMore
                                    ? Icons.keyboard_arrow_up_rounded
                                    : Icons.keyboard_arrow_down_rounded,
                                color: Colors.white,
                                size: 17,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        CustomSizedBox.space12H,
        OrientationBuilder(builder: (context, orientation) {
          return SizedBox(
            height: orientation == Orientation.portrait ? 130 : 400,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: bannerController2,
              onPageChanged: (value) {
                setState(() {
                  currentIndexBanner2 = value;
                });
              },
              itemCount: bannerContent2.length,
              itemBuilder: (context, index) {
                currentIndexBanner2 = index;
                String data = bannerContent2[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Image.asset(
                    data,
                    width: Get.width,
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) => Icon(
                      Icons.image,
                    ),
                    height: orientation == Orientation.portrait ? 125 : 400,
                  ),
                );
              },
            ),
          );
        }),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              3,
              (index) => AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.linear,
                    margin: const EdgeInsets.all(4),
                    width: currentIndexBanner2 == index ? 20 : 10,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 3,
                            color: currentIndexBanner2 == index
                                ? AppColors.kPrimaryColor
                                : AppColors.kPrimaryColor.withOpacity(.5)),
                        borderRadius: BorderRadius.circular(20)),
                  )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12)
              .copyWith(right: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recently Viewed',
                style: AppTheme.textStyleSemiBoldBlack16,
              ),
              // TextButton(
              //     onPressed: () {
              //       Get.toNamed(AllServicesOffers.routeName,
              //           arguments: 'service');
              //     },
              //     child: const Text(
              //       'See All',
              //       style: AppTheme.textStyleSemiBoldPrimary12,
              //     ))
            ],
          ),
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            padding: EdgeInsets.symmetric(horizontal: 8),
            itemBuilder: (context, index) {
              currentIndexBanner1 = index;

              return InkWell(
                  onTap: () {
                    Get.toNamed(ServiceOfferDetails.routeName,
                        arguments: 'service');
                  },
                  child: OfferAndServicesWidget());
            },
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 16.0).copyWith(right: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Fixican Deals',
                style: AppTheme.textStyleSemiBoldBlack16,
              ),
              TextButton(
                  onPressed: () {
                    Get.to(AllDealsScreen());
                  },
                  child: const Text(
                    'See All',
                    style: AppTheme.textStyleSemiBoldPrimary12,
                  ))
            ],
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 8),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                child: ClipOval(
                  child:
                      // index == 3
                      //     ? Container(
                      //         height: 80,
                      //         width: 80,
                      //         decoration: BoxDecoration(
                      //             shape: BoxShape.circle,
                      //             border: Border.all(
                      //                 color:
                      //                     AppColors.kPrimaryColor.withOpacity(.5),
                      //                 width: .3),
                      //             color: AppColors.kPrimaryColor.withOpacity(.05)),
                      //         child: InkWell(
                      //           onTap: () => Get.to(AllDealsScreen()),
                      //           child: Icon(
                      //             Icons.arrow_forward,
                      //             color: AppColors.kPrimaryColor,
                      //           ),
                      //         ),
                      //       )
                      //     :
                      Image.asset(
                    AssetsConstant.dummy_service,
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            itemCount: 5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12)
              .copyWith(right: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Popular Services',
                style: AppTheme.textStyleSemiBoldBlack16,
              ),
              // TextButton(
              //     onPressed: () {
              //       Get.toNamed(AllServicesOffers.routeName,
              //           arguments: 'service');
              //     },
              //     child: const Text(
              //       'See All',
              //       style: AppTheme.textStyleSemiBoldPrimary12,
              //     ))
            ],
          ),
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            padding: EdgeInsets.symmetric(horizontal: 8),
            itemBuilder: (context, index) {
              currentIndexBanner1 = index;

              return InkWell(
                  onTap: () {
                    Get.toNamed(ServiceOfferDetails.routeName,
                        arguments: 'offer');
                  },
                  child: OfferAndServicesWidget());
            },
          ),
        ),
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
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12)
              .copyWith(right: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Services',
                style: AppTheme.textStyleSemiBoldBlack16,
              ),
              // TextButton(
              //     onPressed: () {
              //       Get.toNamed(AllServicesOffers.routeName,
              //           arguments: 'offer');
              //     },
              //     child: const Text(
              //       'See All',
              //       style: AppTheme.textStyleSemiBoldPrimary12,
              //     ))
            ],
          ),
        ),
        Container(
          height: 35,
          width: double.infinity,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 12),
            scrollDirection: Axis.horizontal,
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
              var cat = categoryList[index];
              return CategoryListWidget(
                isSelected: cat['isSelected'],
                categoryItem: cat['category'],
                onToggleChimney: (category) {
                  setState(() {
                    cat['isSelected'] =
                        category; // Update the list with the new value
                  });
                },
              );
            },
          ),
        ),
        CustomSizedBox.space8H,
        ...List.generate(
          5,
          (index) => Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Cleaning',
                      style: AppTheme.textStyleSemiBoldBlack16,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.toNamed(AllServicesOffers.routeName,
                              arguments: 'service');
                        },
                        child: const Text(
                          'See All',
                          style: AppTheme.textStyleSemiBoldPrimary12,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 350,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ...List.generate(
                            2,
                            (index) => Row(
                                  children: [
                                    ...List.generate(
                                        2,
                                        (index) => GestureDetector(
                                            onTap: () {
                                              Get.toNamed(
                                                  ServiceOfferDetails.routeName,
                                                  arguments: 'offer');
                                            },
                                            child: OfferAndServicesWidget()))
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
              ),
            ],
          ),
        ),
        SizedBox(
          height: 80,
        )
      ],
    );
  }
}

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({
    super.key,
    this.isSelected = false,
    required this.onToggleChimney,
    required this.categoryItem,
  });

  final String categoryItem;
  final bool isSelected;
  final Function(bool) onToggleChimney;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onToggleChimney(!isSelected);
      },
      child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(width: 1, color: AppColors.kPrimaryColor),
              color: isSelected ? AppColors.kPrimaryColor : Colors.transparent),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 21),
            child: Text(
              categoryItem,
              style: TextStyle(
                  color: isSelected ? Colors.white : AppColors.kPrimaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          )),
    );
  }
}

class OfferAndServicesWidget extends StatelessWidget {
  const OfferAndServicesWidget({
    super.key,
    this.height,
    this.iconVisible = true,
    this.subtitle,
  });

  final double? height;
  final bool iconVisible;
  final Widget? subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(.06))
          ]),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            child: Stack(
              children: [
                Image.asset(
                  AssetsConstant.dummy_service,
                  fit: BoxFit.cover,
                  height: height ?? 120,
                ),
                iconVisible
                    ? Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.5)),
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.camera_alt_outlined,
                                    size: 17,
                                    color: Colors.white,
                                  ),
                                  CustomSizedBox.space4W,
                                  Text(
                                    '12',
                                    style: AppTheme.textStyleSemiBoldWhite12,
                                  )
                                ],
                              ),
                              Icon(
                                Icons.favorite_outline_rounded,
                                size: 17,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      )
                    : SizedBox.shrink()
              ],
            ),
          ),
          subtitle ??
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Basic Cleaning Service',
                  style: AppTheme.textStyleSemiBoldBlack16,
                ),
              )
        ],
      ),
    );
  }
}

class OfferItemWidget extends StatelessWidget {
  const OfferItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .9,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(.2), blurRadius: 5)
          ],
          gradient: const LinearGradient(
              colors: [AppColors.kPrimaryColor, Color(0xffFFA0A9)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
          color: Colors.red),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              AssetsConstant.feature_shade_2,
              height: 100,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              AssetsConstant.feature_shade_1,
              height: 90,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xffFC8E99),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text('Special Offer',
                          style: GoogleFonts.parisienne(
                            color: const Color(0xffFFE7EC),
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          )),
                    ),
                    const Text.rich(
                      TextSpan(text: 'Get Discount\nUp to ', children: [
                        TextSpan(
                            text: '25%', style: AppTheme.textStyleBoldWhite20)
                      ]),
                      style: AppTheme.textStyleSemiBoldWhite20,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Image.asset(
                  AssetsConstant.dummy_washing_machine,
                  height: 113,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class HomeServiceItemWidget extends StatelessWidget {
  const HomeServiceItemWidget({
    super.key,
    this.label,
    this.height,
    this.padding,
    this.margin,
  });

  final Widget? label;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: [
          Container(
            decoration: BoxDecoration(
                color: const Color(0xffFFF1F2),
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.kPrimaryColor.withOpacity(.5),
                      blurRadius: 2)
                ]),
            margin: margin ?? const EdgeInsets.symmetric(vertical: 8),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  child: Image.asset(
                    AssetsConstant.service_item_shade,
                  ),
                  bottom: -2,
                  left: -1.5,
                  right: 0,
                ),
                Padding(
                  padding: padding ?? const EdgeInsets.all(12),
                  child: Center(
                    child: Image.asset(AssetsConstant.home_service_icon1,
                        height: height ?? 25),
                  ),
                ),
              ],
            ),
          ),
          label ??
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'Basic Cleaning',
                  style: AppTheme.textStyleSemiBoldBlack10,
                ),
              )
        ],
      ),
    );
  }
}
