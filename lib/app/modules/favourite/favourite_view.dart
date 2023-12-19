import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/modules/favourite/favourite_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FavouriteView extends GetView<FavouriteController> {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            AppStrings.favourite,
            style: TextStyle(
              fontSize: 18.sp,
              color: AppColors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        backgroundColor: AppColors.blackNormalHover,
      ),
      backgroundColor: AppColors.blackNormalHover,
      body: SafeArea(
          child: ListView(
        children: [
          SizedBox(
            height: 15.h,
          ),
          GridView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1,
                crossAxisSpacing: 20,
                mainAxisSpacing: 10),
            itemCount: 6,
            itemBuilder: (ctx, i) => GestureDetector(
                //  child:  CardItem(),
                onTap: () => controller.goToBankDetails()),
          )
        ],
      )),
    );
  }
}
