import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:black_market/app/core/widgets/custom_app_bar.dart';
import 'package:black_market/app/core/widgets/line_painter.dart';
import 'package:black_market/app/modules/notifications/notification_view.dart';
import 'package:black_market/app/modules/notifications/notifications_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        appBar:CustomAppBar(text: AppStrings.notifications, onTap: () => controller.goToHome(),),
        backgroundColor: AppColors.blackNormalHover,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    color: AppColors.darkGrey,
                    borderRadius: BorderRadius.circular(16)),
                child: TabBar(
                  indicatorPadding: const EdgeInsets.all(5),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: AppColors.yellowNormal,
                    borderRadius: BorderRadius.circular(16),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomPaint(
                    painter: LinePainter(),
                    child: SizedBox(
                      height: context.screenHeight * 0.05,
                    ),
                  ),
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Padding(
                    padding: EdgeInsets.all(context.screenWidth * 0.05),
                    child: Text(
                      AppStrings.date,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18 * context.textScale,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: CustomPaint(
                    painter: LinePainter(),
                    child: SizedBox(
                      height: context.screenHeight * 0.07,
                    ),
                  ),
                ),
              ],
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
