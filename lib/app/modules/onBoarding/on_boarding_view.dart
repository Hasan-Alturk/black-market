import 'package:black_market/app/core/constants/app_asset_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  //   void initState() {
  //   Future.delayed(const Duration(seconds: 5), () {
  // GoRouter.of(context).pushReplacement("/OnBoarding");
  //   });
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Center(
              child: SvgPicture.asset(
                AppAssetSvg.svgOnBoarding,
                height: 500,
                width: 500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
