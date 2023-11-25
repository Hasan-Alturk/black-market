import 'package:black_market/app/modules/bank_details/bank_details_binding.dart';
import 'package:black_market/app/modules/bank_details/bank_details_view.dart';
import 'package:black_market/app/modules/favourite/favourite_binding.dart';
import 'package:black_market/app/modules/favourite/favourite_view.dart';
import 'package:black_market/app/modules/gold/gold_binding.dart';
import 'package:black_market/app/modules/gold/gold_view.dart';
import 'package:black_market/app/modules/currencies/currencies_binding.dart';
import 'package:black_market/app/modules/currencies/currencies_view.dart';
import 'package:black_market/app/modules/login/login_binding.dart';
import 'package:black_market/app/modules/login/login_view.dart';
import 'package:black_market/app/modules/main/main_home_binding.dart';
import 'package:black_market/app/modules/main/main_home_view.dart';
import 'package:black_market/app/modules/onBoarding/on_boarding_view.dart';
import 'package:black_market/app/modules/password/insert_otp/insert_otp%20controller_binding.dart';
import 'package:black_market/app/modules/password/insert_otp/insert_otp_view.dart';
import 'package:black_market/app/modules/password/new_password_successfully/new_password_successfully_binding.dart';
import 'package:black_market/app/modules/password/new_password_successfully/new_password_successfully_view.dart';
import 'package:black_market/app/modules/password/reset_password/reset_password_binding.dart';
import 'package:black_market/app/modules/password/reset_password/reset_password_view.dart';
import 'package:black_market/app/modules/password/send_otp/send_otp_binding.dart';
import 'package:black_market/app/modules/password/send_otp/send_otp_view.dart';
import 'package:black_market/app/modules/profile/main_profile/main_profile_binding.dart';
import 'package:black_market/app/modules/profile/main_profile/main_profile_view.dart';
import 'package:black_market/app/modules/register/register_binding.dart';
import 'package:black_market/app/modules/register/register_view.dart';
import 'package:get/get.dart';

List<GetPage> approuts = [
  GetPage(
    name: "/onBoarding",
    page: () => const OnBoardingView(),
    //binding: WrapperBinding(),
  ),
  GetPage(
    name: "/login",
    page: () => const LoginView(),
    binding: LoginBinding(),
  ),
  GetPage(
    name: "/register",
    page: () => const RegisterView(),
    binding: RegisterBinding(),
  ),
  GetPage(
    name: "/send_otp",
    page: () => const SendOtpView(),
    binding: SendOtpBinding(),
  ),
  GetPage(
    name: "/insert_otp",
    page: () => const InsertOtpView(),
    binding: InsertOtpBinding(),
  ),
  GetPage(
    name: "/reset_password",
    page: () => const ResetPasswordView(),
    binding: ResetPasswordBinding(),
  ),
  GetPage(
    name: "/new_password_successfully",
    page: () => const NewPasswordSuccessfullyView(),
    binding: NewPasswordSuccessfullyBinding(),
  ),
  GetPage(
    name: "/mainHome",
    page: () => const MainHomeView(),
    binding: MainHomeBinding(),
  ),
  GetPage(
    name: "/currencies",
    page: () => const CurrenciesView(),
    binding: CurrenciesBinding(),
  ),
  GetPage(
    name: "/gold",
    page: () => const GoldView(),
    binding: GoldBinding(),
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
];
