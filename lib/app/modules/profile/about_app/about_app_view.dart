import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/widgets/custom_app_bar.dart';
import 'package:black_market/app/modules/profile/about_app/about_app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

class AboutAppView extends GetView<AboutAppController> {
  const AboutAppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackNormalHover,
      appBar: CustomAppBar(
        text: AppStrings.aboutApp,
        onTap: () => Get.back(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            GetBuilder<AboutAppController>(
              builder: (_){
                return Expanded(
                child: SingleChildScrollView(
                  child: HtmlWidget(
                    controller.text,
                    textStyle: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.lighterGrey,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              },
            ),
          ],

          
        ),
      ),
      // body: SafeArea(
      //   child: Padding(
      //     padding: const EdgeInsets.all(10),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.end,
      //       children: [
      //         SizedBox(
      //           height: 15.h,
      //         ),
      //         Text(
      //           controller.text,
      //           style: TextStyle(
      //             fontSize: 16 * context.textScale,
      //             color: AppColors.white,
      //             fontWeight: FontWeight.w700,
      //           ),
      //         ),
      //         SizedBox(
      //           height: context.screenHeight * 0.05,
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
