import 'package:black_market/app/modules/login/login_view.dart';
import 'package:black_market/app/modules/onBoarding/on_boarding_view.dart';
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
    //binding: LoginBinding(),
  ),
  // GetPage(
  //   name: "/register",
  //   page: () => RegisterView(),
  //   binding: RegisterBinding(),
  // ),
];
