import 'package:fix_ican/pages/auth/login_page.dart';
import 'package:fix_ican/pages/home/all_services_offers.dart';
import 'package:fix_ican/pages/home/home_page.dart';
import 'package:fix_ican/pages/order/delivery_details_edit_page.dart';
import 'package:fix_ican/pages/order/delivery_details_page.dart';
import 'package:fix_ican/pages/order/e_commerce_panel_Screen.dart';
import 'package:fix_ican/pages/order/payment_method_page.dart';
import 'package:fix_ican/pages/order/place_order_page.dart';
import 'package:fix_ican/pages/profile/edit_profile_page.dart';
import 'package:fix_ican/pages/profile/profile_page.dart';
import 'package:fix_ican/pages/services/basic-cleaning/all_cleaning_process_page.dart';
import 'package:fix_ican/pages/services/basic_cleaning_page.dart';
import 'package:fix_ican/pages/services/service_offer_details.dart';
import 'package:fix_ican/pages/services/service_page.dart';
import 'package:fix_ican/pages/settings/add_debit_card_page.dart';
import 'package:fix_ican/pages/settings/payment_setting_page.dart';
import 'package:fix_ican/pages/splash/language_selection_page.dart';
import 'package:fix_ican/pages/splash/onboarding_page.dart';
import 'package:get/get.dart';

import '../pages/home/main_home_page.dart';
import '../pages/splash/splash_page.dart';

class AppRoutes {
  static routes() =>
      [
        GetPage(
          name: MainHomeScreen.routeName,
          page: () => const MainHomeScreen(),
        ),

        GetPage(
          name: LanguageSelectionScreen.routeName,
          page: () => const LanguageSelectionScreen(),
        ),
        //   GetPage(
        //   name: DeliveryDetailsEditScreen.routeName,
        //   page: () =>  DeliveryDetailsEditScreen(),
        // ),
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
        GetPage(
          name: AllCleaningProcessScreen.routeName,
          page: () => const AllCleaningProcessScreen(),
        ),
        GetPage(
          name: PlaceOrderScreen.routeName,
          page: () => const PlaceOrderScreen(),
        ),
        GetPage(
          name: DeliveryDetailsScreen.routeName,
          page: () => const DeliveryDetailsScreen(),
        ),
        GetPage(
          name: PaymentMethodSelectionScreen.routeName,
          page: () => const PaymentMethodSelectionScreen(),
        ),
        GetPage(
          name: PaymentSettingScreen.routeName,
          page: () => const PaymentSettingScreen(),
        ),
        GetPage(
          name: AddDebitScreen.routeName,
          page: () => const AddDebitScreen(),
        ),
        GetPage(
          name: ProfileScreen.routeName,
          page: () => const ProfileScreen(),
        ),
        GetPage(
          name: EditProfileScreen.routeName,
          page: () => const EditProfileScreen(),
        ),
        GetPage(
          name: EcommercepanelScreen.routeName,
          page: () => const EcommercepanelScreen(),
        ),
      ];
}
