import 'package:fix_ican/pages/auth/login_page.dart';
import 'package:fix_ican/pages/home/all_services_offers.dart';
import 'package:fix_ican/pages/home/home_page.dart';
import 'package:fix_ican/pages/services/basic_cleaning_page.dart';
import 'package:fix_ican/pages/services/service_offer_details.dart';
import 'package:fix_ican/pages/services/service_page.dart';
import 'package:fix_ican/pages/splash/language_selection_page.dart';
import 'package:fix_ican/pages/splash/onboarding_page.dart';
import 'package:fix_ican/shared/custom_scaffold.dart';
import 'package:get/get.dart';

import '../pages/splash/splash_page.dart';

class AppRoutes {
  static routes() => [
        GetPage(
          name: '/',
          page: () => const HomeScreen(),
        ),
        // GetPage(
        //   name: '/',
        //   page: () => const SplashScreen(),
        // ),
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
        ),
        GetPage(
          name: HomeScreen.routeName,
          page: () => const HomeScreen(),
        ),
        GetPage(
          name: ServicesScreen.routeName,
          page: () => const ServicesScreen(),
        ),
        GetPage(
          name: AllServicesOffers.routeName,
          page: () => const AllServicesOffers(),
        ),
        GetPage(
          name: ServiceOfferDetails.routeName,
          page: () => const ServiceOfferDetails(),
        ),
        GetPage(
          name: BasicCleaningScreen.routeName,
          page: () => const BasicCleaningScreen(),
        ),
      ];
}
