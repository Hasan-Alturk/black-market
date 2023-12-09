import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/widgets/custom_container_articles.dart';
import 'package:black_market/app/modules/notification/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ArticlesView extends GetView<NotificationController> {
  const ArticlesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackDark,
      body: SafeArea(
        child: GetBuilder<NotificationController>(
          id: "articles",
          builder: (_) {
            return ListView.builder(
              physics: const ScrollPhysics(),
              itemCount: controller.articles.length,
              itemBuilder: (context, index) {
                if (index == 0 ||
                    DateFormat('yyyy/MM/dd').format(DateTime.parse(
                            controller.articles[index].createdAt)) !=
                        DateFormat('yyyy/MM/dd').format(DateTime.parse(
                            controller.articles[index - 1].createdAt))) {
                  return Column(
                    children: [
                      Text(
                        DateFormat('yyyy/MM/dd').format(
                          DateTime.parse(controller.articles[index].createdAt),
                        ),
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.yellowDark,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => controller
                            .goToHtmlArticle(controller.articles[index].id),
                        child: CustomContainerArticles(
                          title: controller.articles[index].title,
                          body: controller.articles[index].shortDescription,
                          image: controller.articles[index].thumbnail,
                        ),
                      ),
                    ],
                  );
                } else {
                  // إذا كان التاريخ متطابقًا مع العنصر السابق، فقط عرض العنصر
                  return GestureDetector(
                    onTap: () => controller
                        .goToHtmlArticle(controller.articles[index].id),
                    child: Column(
                      children: [
                        CustomContainerArticles(
                          title: controller.articles[index].title,
                          body: controller.articles[index].shortDescription,
                          image: controller.articles[index].thumbnail,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}          