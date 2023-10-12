import 'package:fix_ican/constants/assets_constant.dart';
import 'package:fix_ican/constants/color_constant.dart';
import 'package:fix_ican/shared/custom_scaffold.dart';
import 'package:fix_ican/shared/custom_sized_box.dart';
import 'package:fix_ican/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool showMore = false;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          Column(
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
              GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 24,
                    crossAxisSpacing: 24),
                itemCount: showMore ? 8 : 8,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return const HomeServiceItemWidget();
                },
              ),
              // Show More Button

              // Last 2 Rows (Hidden)
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: showMore ? 200 : 0,
                child: GridView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 24,
                      crossAxisSpacing: 24),
                  itemCount: 8,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return const HomeServiceItemWidget();
                  },
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //
              //   },
              //   child: Text('Show More'),
              // ),
            ],
          ),
          AnimatedPositioned(
            top: showMore ? 100 * 4 : 150,
            left: 0,
            right: 0,
            duration: const Duration(milliseconds: 200),
            child: Column(
              children: [
                Container(
                  color: showMore ? null : Colors.white.withOpacity(.6),
                  width: double.infinity,
                  height: 90,
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
                                showMore = true;
                              });
                            } else {
                              setState(() {
                                showMore = false;
                              });
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
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
                                border: Border.all(
                                    width: 3,
                                    color: currentIndex == index
                                        ? AppColors.kPrimaryColor
                                        : AppColors.kPrimaryColor
                                            .withOpacity(.5)),
                                borderRadius: BorderRadius.circular(20)),
                          )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0)
                      .copyWith(right: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Popular Services',
                        style: AppTheme.textStyleSemiBoldBlack16,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'See All',
                            style: AppTheme.textStyleSemiBoldPrimary12,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 160,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    itemBuilder: (context, index) {
                      currentIndex = index;

                      return Container(
                        width: MediaQuery.of(context).size.width * .4,
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(.06))
                            ]),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(8)),
                              child: Image.asset(
                                AssetsConstant.dummy_service,
                                fit: BoxFit.cover,
                                height: 99,
                                width: MediaQuery.of(context).size.width * .4,
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
                    },
                  ),
                ),
                // AnimatedButtonContainer()
                // SlideAnimationIcons()
              ],
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
          // boxShadow: [
          //   BoxShadow(
          //       color: Colors.black.withOpacity(.2), blurRadius: 5)
          // ],
          gradient: const LinearGradient(
              colors: [AppColors.kPrimaryColor, Color(0xffFFA0A9)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
          color: Colors.red),
      child: Stack(
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
  });

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
            margin: const EdgeInsets.all(8),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  child: Image.asset(AssetsConstant.service_item_shade),
                  bottom: 0,
                  left: 0,
                  right: 0,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Center(
                    child: Image.asset(AssetsConstant.home_service_icon1),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
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

class SlideAnimationIcons extends StatefulWidget {
  @override
  _SlideAnimationIconsState createState() => _SlideAnimationIconsState();
}

class _SlideAnimationIconsState extends State<SlideAnimationIcons>
    with TickerProviderStateMixin {
  bool areIconsVisible = false;

  void toggleIconsVisibility() {
    setState(() {
      areIconsVisible = !areIconsVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (areIconsVisible)
                AnimatedPositioned(
                  left: areIconsVisible ? 0 : 50,
                  duration: const Duration(seconds: 1),
                  child: const Icon(Icons.star, size: 50, color: Colors.blue),
                ),
              if (areIconsVisible)
                ScaleTransition(
                  scale: Tween<double>(begin: 1.0, end: 0.5)
                      .animate(CurvedAnimation(
                          parent: AnimationController(
                            duration: const Duration(milliseconds: 500),
                            vsync: this,
                          ),
                          curve: Curves.easeIn)),
                  child: const Icon(Icons.star, size: 50, color: Colors.blue),
                ),
              GestureDetector(
                onTap: toggleIconsVisibility,
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  color: Colors.green,
                  child: Text(
                    areIconsVisible ? "Hide Icons" : "Show Icons",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              if (areIconsVisible)
                SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0.0, 0.0),
                    end: const Offset(1.0, 0.0),
                  ).animate(
                    CurvedAnimation(
                      parent: AnimationController(
                        duration: const Duration(milliseconds: 500),
                        vsync: this,
                      ),
                      curve: Curves.linear,
                    ),
                  ),
                  child: const Icon(Icons.star, size: 50, color: Colors.red),
                ),
              if (areIconsVisible)
                SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0.0, 0.0),
                    end: const Offset(1.0, 0.0),
                  ).animate(
                    CurvedAnimation(
                      parent: AnimationController(
                        duration: const Duration(milliseconds: 500),
                        vsync: this,
                      ),
                      curve: Curves.linear,
                    ),
                  ),
                  child: const Icon(Icons.star, size: 50, color: Colors.red),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class AnimatedButtonContainer extends StatefulWidget {
  @override
  _AnimatedButtonContainerState createState() =>
      _AnimatedButtonContainerState();
}

class _AnimatedButtonContainerState extends State<AnimatedButtonContainer> {
  bool isContainerVisible = false;
  double containerWidth = 100.0;

  void toggleContainerVisibility() {
    setState(() {
      isContainerVisible = !isContainerVisible;
      if (isContainerVisible) {
        containerWidth = 200.0;
      } else {
        containerWidth = 0.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          width: containerWidth,
          height: 50.0,
          color: Colors.blue,
          child: isContainerVisible
              ? Center(
                  child: Text(
                    'Content inside the container',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              : null,
        ),
        SizedBox(height: 20.0),
        GestureDetector(
          onTap: toggleContainerVisibility,
          child: Container(
            padding: EdgeInsets.all(10.0),
            color: Colors.green,
            child: Text(
              isContainerVisible ? "Hide" : "Show",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
