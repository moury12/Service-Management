import 'package:fix_ican/constants/assets_constant.dart';
import 'package:fix_ican/constants/color_constant.dart';
import 'package:fix_ican/pages/home/all_services_offers.dart';
import 'package:fix_ican/shared/custom_sized_box.dart';
import 'package:fix_ican/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mh_core/utils/constant.dart';
import 'package:mh_core/utils/global.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  bool showMore = false;
  int currentIndex = 0;
  int gridItem = 17;

  Color? containerColor = Colors.white.withOpacity(.6);

  AnimationController? _controller;
  Animation<double>? _animation;
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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
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
                          // duration: const Duration(milliseconds: 300),
                          // height: showMore ? 400 : 200,
                          // onEnd: () {
                          //   // if (showMore) {
                          //   //   gridItem = 32;
                          //   //   setState(() {});
                          //   // }
                          // },
                          child: GridView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, mainAxisSpacing: 24, crossAxisSpacing: 24),
                            itemCount: /*showMore
                                ?*/
                                gridItem >= 8 ? 8 + ((gridItem - 8) ~/ 4 * (_animation!.value * 4).floor().toInt()) + (_animation!.value == 1 ? (gridItem % 4) : 0) : gridItem
                            /*: gridItem >= 8
                                    ? 8
                                    : gridItem*/
                            ,
                            // itemCount: gridItem,
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
              top: 32 +
                  (showMore
                      ? (90.0 * (gridItem / 4.0).ceil())
                      : gridItem > 4
                          ? 105
                          : 25),
              left: 0,
              right: 0,
              duration: Duration(milliseconds: 300),
              child: Container(
                color: containerColor,
                width: double.infinity,
                height: 90,
                clipBehavior: Clip.none,
                child: FittedBox(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(.2), blurRadius: 5)],
                        gradient: const LinearGradient(colors: [AppColors.kPrimaryColor, Color(0xffFFA0A9)], begin: Alignment.centerLeft, end: Alignment.centerRight),
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
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Show More',
                                style: AppTheme.textStyleMediumWhite12,
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
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
        if (!showMore)
          SizedBox(
            height: 24,
          ),
        SizedBox(
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemBuilder: (context, index) {
              currentIndex = index;

              return const OfferItemWidget();
            },
          ),
        ),
        CustomSizedBox.space4H,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              3,
              (index) => Container(
                    margin: const EdgeInsets.all(4),
                    width: currentIndex == index ? 20 : 10,
                    decoration: BoxDecoration(
                        border: Border.all(width: 3, color: currentIndex == index ? AppColors.kPrimaryColor : AppColors.kPrimaryColor.withOpacity(.5)),
                        borderRadius: BorderRadius.circular(20)),
                  )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0).copyWith(right: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Popular Services',
                style: AppTheme.textStyleSemiBoldBlack16,
              ),
              TextButton(
                  onPressed: () {
                    Get.toNamed(AllServicesOffers.routeName, arguments: 'service');
                  },
                  child: const Text(
                    'See All',
                    style: AppTheme.textStyleSemiBoldPrimary12,
                  ))
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width / 2,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            padding: EdgeInsets.symmetric(horizontal: 8),
            itemBuilder: (context, index) {
              currentIndex = index;

              return OfferAndServicesWidget();
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0).copyWith(right: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Offers',
                style: AppTheme.textStyleSemiBoldBlack16,
              ),
              TextButton(
                  onPressed: () {
                    Get.toNamed(AllServicesOffers.routeName, arguments: 'offer');
                  },
                  child: const Text(
                    'See All',
                    style: AppTheme.textStyleSemiBoldPrimary12,
                  ))
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width / 2,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            padding: EdgeInsets.symmetric(horizontal: 8),
            itemBuilder: (context, index) {
              return OfferAndServicesWidget();
            },
          ),
        ),
        SizedBox(
          height: 80,
        )
      ],
    );
  }
}

class OfferAndServicesWidget extends StatelessWidget {
  const OfferAndServicesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .4,
      margin: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.white, boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(.06))]),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.asset(
              AssetsConstant.dummy_service,
              fit: BoxFit.cover,
            ),
          ),
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
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(.2), blurRadius: 5)],
          gradient: const LinearGradient(colors: [AppColors.kPrimaryColor, Color(0xffFFA0A9)], begin: Alignment.centerLeft, end: Alignment.centerRight),
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
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                      TextSpan(text: 'Get Discount\nUp to ', children: [TextSpan(text: '25%', style: AppTheme.textStyleBoldWhite20)]),
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
  });

  final Widget? label;
  final double? height;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: [
          Container(
            decoration: BoxDecoration(
                color: const Color(0xffFFF1F2), borderRadius: BorderRadius.circular(6), boxShadow: [BoxShadow(color: AppColors.kPrimaryColor.withOpacity(.5), blurRadius: 2)]),
            margin: const EdgeInsets.all(8),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  child: Image.asset(
                    AssetsConstant.service_item_shade,
                  ),
                  bottom: 0,
                  left: 0,
                  right: 0,
                ),
                Padding(
                  padding: padding ?? const EdgeInsets.all(12),
                  child: Center(
                    child: Image.asset(AssetsConstant.home_service_icon1, height: height ?? 25),
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
