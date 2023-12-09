import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/widgets/custom_container_notifications.dart';
import 'package:black_market/app/modules/notification/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NotificationsView extends GetView<NotificationController> {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackDark,
      body: SafeArea(
        child: GetBuilder<NotificationController>(
          id: "notifications",
          builder: (_) {
            return RefreshIndicator(
              onRefresh: () async {
                // عند سحب الشاشة، قم بجلب البيانات الجديدة
                controller.getNotificationAgain();
              },
              child: NotificationListener<ScrollEndNotification>(
                onNotification: (notification) {
                  if (notification.metrics.pixels ==
                      notification.metrics.maxScrollExtent) {
                    if (!controller.isLoading) {
                      controller.getNotification();
                    }
                  }
                  return false;
                },
                child: ListView.builder(
                  physics: const ScrollPhysics(),
                  itemCount: controller.notifications.length +
                      (controller.isLoading ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == controller.notifications.length) {
                      return controller.isLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : const SizedBox.shrink();
                    } else if (index == 0 ||
                        DateFormat('yyyy/MM/dd').format(DateTime.parse(
                                controller
                                    .notifications[index].notificationDate)) !=
                            DateFormat('yyyy/MM/dd').format(DateTime.parse(
                                controller.notifications[index - 1]
                                    .notificationDate))) {
                      return Column(
                        children: [
                          Text(
                            DateFormat('yyyy/MM/dd').format(
                              DateTime.parse(controller
                                  .notifications[index].notificationDate),
                            ),
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: AppColors.yellowDark,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          CustomContainerNotifications(
                            title: controller.notifications[index].title,
                            body: controller.notifications[index].body,
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          CustomContainerNotifications(
                            title: controller.notifications[index].title,
                            body: controller.notifications[index].body,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
