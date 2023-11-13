import 'dart:async';

import 'package:fix_ican/constants/color_constant.dart';
import 'package:fix_ican/shared/custom_sized_box.dart';
import 'package:fix_ican/theme/theme_data.dart';
import 'package:flutter/material.dart';

class EcommercepanelScreen extends StatefulWidget {
  static const String routeName = '/ecommerce';

  const EcommercepanelScreen({super.key});

  @override
  State<EcommercepanelScreen> createState() => _EcommercepanelScreenState();
}

class _EcommercepanelScreenState extends State<EcommercepanelScreen> {
  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  List<String> bannerContent = [
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

  @override
  void initState() {
    Timer.periodic(Duration(milliseconds: 800), (timer) {
      if (currentPage < (bannerContent.length - 1)) {
        pageController.nextPage(
            duration: Duration(milliseconds: 800), curve: Curves.ease);
      } else {
        pageController.animateToPage(0,
            duration: Duration(milliseconds: 100), curve: Curves.ease);
      }
    });
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
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 164,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: pageController,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: bannerContent.length,
              itemBuilder: (context, index) {
                currentPage = index;
                String data = bannerContent[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      data,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                      height: 135,
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(bannerContent.length, (index) {
              return Container(
                margin: EdgeInsets.all(4),
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentPage == index
                      ? AppColors.kPrimaryColor
                      : AppColors.kAccentColor,
                ),
              );
            }),
          ),
          CustomSizedBox.space12H,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
            child: Row(
              children: [
                Text(
                  'Shop Name:',
                  style: AppTheme.textStyleBoldBlack16,
                ),
                CustomSizedBox.space16W,
                Text(
                  'perfecto.fgkdfgidfgg',
                  style: AppTheme.textStyleNormalBlack14,
                ),
                Spacer(),
                Row(
                  children: [
                    Icon(
                      Icons.star_rate_rounded,
                      color: Colors.orangeAccent,
                      size: 20,
                    ),
                    CustomSizedBox.space4W,
                    Text(
                      '2.3',
                      style: AppTheme.textStyleMediumBlack14,
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
            child: Row(
              children: [
                Text(
                  'Location:',
                  style: AppTheme.textStyleBoldBlack16,
                ),
                CustomSizedBox.space16W,
                Text(
                  'perfecto.fgkdfgidfgg',
                  style: AppTheme.textStyleNormalBlack14,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
            child: Row(
              children: [
                Text(
                  'Products:',
                  style: AppTheme.textStyleBoldBlack16,
                ),
                CustomSizedBox.space16W,
                // Text(
                //   'perfecto.fgkdfgidfgg',
                //   style: AppTheme.textStyleNormalBlack14,
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
