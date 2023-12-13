import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:black_market/app/core/widgets/custom_app_bar.dart';
import 'package:black_market/app/core/widgets/custom_container_drag.dart';
import 'package:black_market/app/core/widgets/state_button.dart';
import 'package:black_market/app/modules/profile/setting/preferred_of_banks/preferred_of_banks_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PreferredOfBanksView extends GetView<PreferredOfBanksController> {
  const PreferredOfBanksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackNormalHover,
      appBar: CustomAppBar(
        text: AppStrings.setting,
        onTap: () => Get.back(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(context.screenWidth * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                height: 80.h,
                width: 340.w,
                decoration: BoxDecoration(
                  color: AppColors.gray,
                  border: Border.all(color: AppColors.gray),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          AppStrings.noteBank,
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                            wordSpacing: 1.w,
                            height: 2.h,
                            fontSize: 12.sp,
                            color: AppColors.yellowLightHover,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 18.w,
                    ),
                    Image.asset(AppAssetIcons.note),
                  ],
                ),
              ),
              SizedBox(
                height: context.screenHeight * 0.05,
              ),
              Text(
                AppStrings.dragBank,
                style: TextStyle(
                  fontSize: 16 * context.textScale,
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: GetBuilder<PreferredOfBanksController>(
                  id: "bankList",
                  builder: (_) {
                    return ReorderableListView(
                      children: [
                        for (final bank in controller.bankList)
                          Padding(
                            key: ValueKey(bank),
                            padding: const EdgeInsets.all(5.0),
                            child: CustomContainerDrag(
                              text: bank.name!,
                              stringImage: bank.icon!,
                              stringIcon: AppAssetIcons.drag,
                            ),
                          ),
                      ],
                      onReorder: (oldIndex, newIndex) {
                        controller.updateMyTiles(oldIndex, newIndex);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 24.h),
        child: GetBuilder<PreferredOfBanksController>(
            id: "saveNewBanks",
            builder: (_) {
              return StateButton(
                isLoading: controller.isLoading,
                text: AppStrings.change,
                onPressed: () {
                  controller.saveNewBanks(controller.bankList);
                },
                buttonColor: AppColors.yellowNormal,
                radius: 14.r,
                textColor: AppColors.blackDark,
              );
            }),
      ),
    );
  }
}
