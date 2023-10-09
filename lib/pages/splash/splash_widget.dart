import 'package:fix_ican/constants/assets_constant.dart';
import 'package:fix_ican/constants/color_constant.dart';
import 'package:flutter/material.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 376,
            padding: EdgeInsets.all(45),
            decoration: BoxDecoration(
                color: AppColors.kPrimaryColor.withOpacity(.2),
                borderRadius: BorderRadius.circular(360)),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.kPrimaryColor.withOpacity(.2),
                  borderRadius: BorderRadius.circular(360)),
              padding: EdgeInsets.all(45),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.kBackgroundColor,
                    borderRadius: BorderRadius.circular(360)),
                alignment: Alignment.center,
                height: 196,
                //padding: EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(
                  AssetsConstant.app_title,
                  height: 49,
                ),
              ),
            ),
          ),
        ),
        Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(AssetsConstant.splash_image))
      ],
    );
  }
}
