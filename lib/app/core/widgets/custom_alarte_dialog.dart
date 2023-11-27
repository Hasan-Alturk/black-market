import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:black_market/app/core/widgets/state_button.dart';
import 'package:flutter/material.dart';

class CustomAlarteDialog extends StatelessWidget {
  final String content;
  final Function() onPressed;
  final Function() onTap;

  const CustomAlarteDialog({
    super.key,
    required this.content,
    required this.onPressed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.gray,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.elliptical(120, 20),
                  topRight: Radius.elliptical(120, 20))),
          height: context.screenHeight * 0.4,
          width: context.screenWidth,
          child: Padding(
            padding: EdgeInsets.all(context.screenWidth * 0.07),
            child: Column(
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(AppAssetIcons.close),
                  ),
                ),
                SizedBox(
                  height: context.screenHeight * 0.02,
                ),
                Text(
                  AppStrings.areYouSureToLogout,
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: context.screenHeight * 0.03,
                ),
                CircleAvatar(
                  radius: 45.0,
                  backgroundColor: AppColors.red,
                  child: Image.asset(AppAssetIcons.wrong),
                ),
                SizedBox(
                  height: context.screenHeight * 0.03,
                ),
                StateButton(
                    textColor: AppColors.white,
                    isLoading: false,
                    text: AppStrings.logout,
                    onPressed: () => (),
                    buttonColor: AppColors.red,
                    radius: 14)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

        // AlertDialog(
        //   // icon: Center(child: Image.asset(AppAssetIcons.wrong)),
        //   contentPadding: const EdgeInsets.all(18),
        //   backgroundColor: AppColors.gray,
        //   //title: const Text("data"),
        //   content: Container(
        //     decoration: BoxDecoration(
        //         color: AppColors.gray,
        //         borderRadius: const BorderRadius.only(
        //             topLeft: Radius.elliptical(120, 20),
        //             topRight: Radius.elliptical(120, 20))),
        //     height: context.screenHeight * 0.35,
        //     child: Column(
        //       children: [
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Text(
        //               content,
        //               style: TextStyle(
        //                   color: AppColors.white,
        //                   fontWeight: FontWeight.w700,
        //                   fontSize: 18),
        //             ),
        //           ],
        //         ),
        //       ],
        //     ),
        //   ),
        //   // actions: <Widget>[
        //   //   Center(
        //   //     child: StateButton(
        //   //       isLoading: false,
        //   //       text: AppStrings.logout,
        //   //       onPressed: () => (),
        //   //       buttonColor: AppColors.red,
        //   //       radius: 14,
        //   //     ),
        //   //   ),
        //   // ],
        // ),
      