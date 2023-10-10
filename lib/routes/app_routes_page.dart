import 'package:fix_ican/pages/auth/login_page.dart';
import 'package:fix_ican/pages/home/home_page.dart';
import 'package:fix_ican/pages/splash/language_selection_page.dart';
import 'package:fix_ican/pages/splash/onboarding_page.dart';
import 'package:get/get.dart';

import '../pages/splash/splash_page.dart';

class AppRoutes {
  static routes() =>
      [

        GetPage(
          name: '/',
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: LanguageSelectionScreen.routeName,
          page: () => const LanguageSelectionScreen(),
        ),
        GetPage(
          name: OnboardingScreen.routeName,
          page: () => const OnboardingScreen(),
        ),
        GetPage(
          name: LoginScreen.routeName,
          page: () => const LoginScreen(),
        ), GetPage(
        name: HomeScreen.routeName,
        page: () => const HomeScreen(),
      ),
      ];
}
