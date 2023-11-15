import 'package:fix_ican/constants/assets_constant.dart';
import 'package:fix_ican/constants/color_constant.dart';
import 'package:fix_ican/pages/auth/login_page.dart';
import 'package:fix_ican/shared/custom_sized_box.dart';
import 'package:fix_ican/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/widgets/button/custom_button.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = '/Onboarding';

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List contents = [
    {
      'image': AssetsConstant.slide_image,
      'title': 'On-Demand Services',
      'subtitle': 'Just one Tap  book Maid fromAnywhere, Anytime!',
      'bottomtitle': 'We are always there for you',
    },
    {
      'image': AssetsConstant.slide_image1,
      'title': 'Safety and Security',
      'subtitle': 'Verified workers in terms of Safety and Security',
      'bottomtitle': 'We are always there for you',
    },
    {
      'image': AssetsConstant.slide_image2,
      'title': 'Trained Workers',
      'subtitle': 'Providing well trained and polite Workers',
      'bottomtitle': 'We are always there for you',
    },
  ];
  int currentIndex = 0;
  PageController pageController = PageController();

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.kBackgroundColor,
        elevation: 0,
        leading: SizedBox.shrink(),
        actions: [],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 28.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () {
                    Get.offAndToNamed(LoginScreen.routeName);
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'Skip',
                      style: AppTheme.textStyleMediumPrimary12,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                itemCount: contents.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> data = contents[index];
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 56.0, vertical: 24),
                        child: Image.asset(data['image']),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Text(
                          data['title'],
                          style: AppTheme.textStyleSemiBoldBlack24,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 46),
                        child: Text(
                          data['subtitle'],
                          style: AppTheme.textStyleSemiBoldFadeBlack14,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      CustomSizedBox.space36H,
                      Text(
                        data['bottomtitle'],
                        style: AppTheme.textStyleMediumFadeBlack12,
                      )
                    ],
                  );
                }),
          ),
          // Container(
          //   height: 44,
          //   child: Icon(Icons.arrow_forward_outlined),
          //   decoration: BoxDecoration(
          //       color: AppColors.kPrimaryColor.withOpacity(.2),
          //       borderRadius: BorderRadius.circular(60)),
          //   padding: EdgeInsets.all(16),
          // )
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  3,
                  (index) => Container(
                        margin: EdgeInsets.all(4),
                        width: currentIndex == index ? 20 : 10,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 3,
                                color: currentIndex == index
                                    ? AppColors.kPrimaryColor
                                    : AppColors.kPrimaryColor.withOpacity(.5)),
                            borderRadius: BorderRadius.circular(20)),
                      )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                currentIndex == 0
                    ? Text('')
                    : GestureDetector(
                        onTap: () {
                          if (currentIndex <= contents.length - 1) {
                            pageController.previousPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          }
                        },
                        child: Image.asset(
                          AssetsConstant.backward_icon,
                          height: 44,
                        ),
                      ),
                Spacer(),
                currentIndex == contents.length - 1
                    ? Expanded(
                        child: CustomButton(
                          primary: AppColors.kPrimaryColor,
                          borderRadiusAll: 20,
                          label: 'Get Started',
                          marginVertical: 0,
                          marginHorizontal: 0,
                          contentHorizontalPadding: 0,
                          onPressed: () {
                            Get.offAndToNamed(LoginScreen.routeName);
                          },
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          if (currentIndex < contents.length - 1) {
                            pageController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          }
                        },
                        child: Image.asset(
                          AssetsConstant.forward_icon,
                          height: 44,
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
