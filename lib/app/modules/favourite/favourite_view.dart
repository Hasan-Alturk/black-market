import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/widgets/currencies_view_widgets/card_item.dart';
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
          GetBuilder<FavouriteController>(
              id: "favouriteList",
              builder: (_) {
                if (controller.token != null) {
                  return GridView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 1,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 10),
                    itemCount: controller.favouriteBankList.length,
                    itemBuilder: (ctx, i) => GestureDetector(
                        child: CardItem(
                          bankName: controller.favouriteBankList[i].bankName,
                          bankImage: controller.favouriteBankList[i].bankIcon
                              .toString(),
                          sellPrice: controller.favouriteBankList[i].sellPrice,
                          buyPrice: controller.favouriteBankList[i].buyPrice,
                          onFavouriteTapped: () =>
                              controller.deleteFavouriteBanks(
                                  controller.favouriteBankList[i]),
                        ),
                        onTap: () => controller.goToBankDetails(
                            controller.favouriteBankList[i].bankId)),
                  );
                } else {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        onPressed: controller.goToRegister,
                        child: Text(
                          AppStrings.createAccount,
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: AppColors.yellowNormalActive,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        onPressed: controller.goToLogin,
                        child: Text(
                          AppStrings.login,
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: AppColors.yellowNormalActive,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  );
                }
              })
        ],
      )),
    );
  }
}
