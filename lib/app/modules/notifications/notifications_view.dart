import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/widgets/custom_app_bar.dart';
import 'package:black_market/app/modules/notifications/notification_view.dart';
import 'package:black_market/app/modules/notifications/notifications_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        appBar: CustomAppBar(
          text: AppStrings.notifications,
          onTap: () => Get.back(),
        ),
        backgroundColor: AppColors.blackNormalHover,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: 55.h,
                decoration: BoxDecoration(
                    color: AppColors.darkGrey,
                    borderRadius: BorderRadius.circular(16.r)),
                child: TabBar(
                  indicatorPadding: EdgeInsets.all(5.r),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: AppColors.yellowNormal,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  labelColor: Colors.black,
                  unselectedLabelColor: AppColors.white,
                  unselectedLabelStyle: TextStyle(
                      fontFamily: 'Almarai',
                      color: AppColors.white,
                      fontWeight: FontWeight.w700),
                  labelStyle: TextStyle(
                      fontFamily: 'Almarai',
                      color: AppColors.blackNormal,
                      fontWeight: FontWeight.w700),
                  dividerColor: Colors.black,
                  tabs: [
                    Tab(text: AppStrings.articles),
                    Tab(text: AppStrings.notifications),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  NotificationView(),
                  NotificationView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
