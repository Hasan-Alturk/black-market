import 'package:black_market/app/modules/notifications/notifications_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        children: const [
          // CurrenciesView(),
          // GoldView(),
        ],
      ),
      
      bottomNavigationBar: GetBuilder<NotificationsController>(
        id: " NotificationsViewGetBuilder",
        builder: (_) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.blue,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: const Center(
                  child: Text("Page 1"),
                ),
              ),
              Container(
                color: Colors.green,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: const Center(
                  child: Text("Page 2"),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
