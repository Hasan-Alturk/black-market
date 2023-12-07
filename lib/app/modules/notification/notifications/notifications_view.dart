import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/widgets/custom_container_notifications.dart';
import 'package:black_market/app/modules/notification/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsView extends GetView<NotificationController> {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackDark,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: GetBuilder<NotificationController>(
            id: "notifications",
            builder: (_) {
              return ListView.builder(
                physics: const ScrollPhysics(),
                itemCount: controller.notifications.length,
                itemBuilder: (context, index) {
                  return CustomContainerNotifications(
                    title: controller.notifications[index].title,
                    body: controller.notifications[index].body,
                    notificationDate:
                        controller.notifications[index].notificationDate,
                        
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
