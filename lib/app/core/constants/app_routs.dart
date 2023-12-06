import 'package:black_market/app/modules/bank_details/bank_details_binding.dart';
import 'package:black_market/app/modules/bank_details/bank_details_view.dart';
import 'package:black_market/app/modules/currencies/currencies_binding.dart';
import 'package:black_market/app/modules/currencies/currencies_view.dart';
import 'package:black_market/app/modules/favourite/favourite_binding.dart';
import 'package:black_market/app/modules/favourite/favourite_view.dart';
import 'package:black_market/app/modules/gold/main_gold/main_gold_binding.dart';
import 'package:black_market/app/modules/gold/main_gold/main_gold_view.dart';
import 'package:black_market/app/modules/login/login_binding.dart';
import 'package:black_market/app/modules/login/login_view.dart';
import 'package:black_market/app/modules/main/main_home_binding.dart';
import 'package:black_market/app/modules/main/main_home_view.dart';
import 'package:black_market/app/modules/notification/notification_binding.dart';
import 'package:black_market/app/modules/notification/notifications_view.dart';
import 'package:black_market/app/modules/password/insert_otp/insert_otp%20controller_binding.dart';
import 'package:black_market/app/modules/password/insert_otp/insert_otp_view.dart';
import 'package:black_market/app/modules/password/new_password_successfully/new_password_successfully_binding.dart';
import 'package:black_market/app/modules/password/new_password_successfully/new_password_successfully_view.dart';
import 'package:black_market/app/modules/password/reset_password/reset_password_binding.dart';
import 'package:black_market/app/modules/password/reset_password/reset_password_view.dart';
import 'package:black_market/app/modules/password/send_otp/send_otp_binding.dart';
import 'package:black_market/app/modules/password/send_otp/send_otp_view.dart';
import 'package:black_market/app/modules/profile/about_app/about_app_binding.dart';
import 'package:black_market/app/modules/profile/about_app/about_app_view.dart';
import 'package:black_market/app/modules/profile/main_cuurency/main_cuurency_binding.dart';
import 'package:black_market/app/modules/profile/main_cuurency/main_cuurency_view.dart';
import 'package:black_market/app/modules/profile/main_profile/main_profile_binding.dart';
import 'package:black_market/app/modules/profile/main_profile/main_profile_view.dart';
import 'package:black_market/app/modules/profile/setting/language/language_binding.dart';
import 'package:black_market/app/modules/profile/setting/language/language_view.dart';
import 'package:black_market/app/modules/profile/setting/main_setting/main_setting_binding.dart';
import 'package:black_market/app/modules/profile/setting/main_setting/main_setting_view.dart';
import 'package:black_market/app/modules/profile/setting/notifications_setting/notifications_setting_binding.dart';
import 'package:black_market/app/modules/profile/setting/notifications_setting/notifications_setting_view.dart';
import 'package:black_market/app/modules/profile/setting/preferred_of_banks/preferred_of_banks_binding.dart';
import 'package:black_market/app/modules/profile/setting/preferred_of_banks/preferred_of_banks_view.dart';
import 'package:black_market/app/modules/profile/setting/preferred_of_currencies/preferred_of_currencies_binding.dart';
import 'package:black_market/app/modules/profile/setting/preferred_of_currencies/preferred_of_currencies_view.dart';
import 'package:black_market/app/modules/register/register_binding.dart';
import 'package:black_market/app/modules/register/register_view.dart';
import 'package:black_market/app/modules/splash/splash_binding.dart';
import 'package:black_market/app/modules/splash/splash_view.dart';
import 'package:get/get.dart';

List<GetPage> approuts = [
  GetPage(
    name: "/splash",
    page: () => const SplashView(),
    binding: SplashBinding(),
  ),
  GetPage(
    name: "/login",
    page: () => LoginView(),
    binding: LoginBinding(),
  ),
  GetPage(
    name: "/register",
    page: () => RegisterView(),
    binding: RegisterBinding(),
  ),
  GetPage(
    name: "/send_otp",
    page: () => SendOtpView(),
    binding: SendOtpBinding(),
  ),
  GetPage(
    name: "/insert_otp",
    page: () => const InsertOtpView(),
    binding: InsertOtpBinding(),
  ),
  GetPage(
    name: "/reset_password",
    page: () => ResetPasswordView(),
    binding: ResetPasswordBinding(),
  ),
  GetPage(
    name: "/new_password_successfully",
    page: () => const NewPasswordSuccessfullyView(),
    binding: NewPasswordSuccessfullyBinding(),
  ),
  GetPage(
    name: "/main_home",
    page: () => const MainHomeView(),
    binding: MainHomeBinding(),
  ),
  GetPage(
    name: "/currencies",
    page: () => const CurrenciesView(),
    binding: CurrenciesBinding(),
  ),
  GetPage(
    name: "/main_gold",
    page: () => const MainGoldView(),
    binding: MainGoldBinding(),
  ),
  GetPage(
    name: "/favourite",
    page: () => const FavouriteView(),
    binding: FavouriteBinding(),
  ),
  GetPage(
    name: "/main_profile",
    page: () => const MainProfileView(),
    binding: MainProfileBinding(),
  ),
  GetPage(
    name: "/bank_details",
    page: () => const BankDetailsView(),
    binding: BankDetailsBinding(),
  ),
  GetPage(
    name: "/notifications",
    page: () => const NotificationsView(),
    binding: NotificationBinding(),
  ),
  GetPage(
    name: "/main_cuurency",
    page: () => const MainCurencyView(),
    binding: MainCurencyBinding(),
  ),
  GetPage(
    name: "/main_setting",
    page: () => const MainSettingView(),
    binding: MainSettingBinding(),
  ),
  GetPage(
    name: "/language",
    page: () => const LanguageView(),
    binding: LanguageBinding(),
  ),
  GetPage(
    name: "/notifications_setting",
    page: () => const NotificationsSettingView(),
    binding: NotificationsSettingBinding(),
  ),
  GetPage(
    name: "/preferred_of_banks",
    page: () => const PreferredOfBanksView(),
    binding: PreferredOfBanksBinding(),
  ),
  GetPage(
    name: "/preferred_of_currencies",
    page: () => const PreferredOfCurrenciesView(),
    binding: PreferredOfCurrenciesBinding(),
  ),
  GetPage(
    name: "/about_app",
    page: () => const AboutAppView(),
    binding: AboutAppBinding(),
  ),
];
