import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/constants/base_urls.dart';
import 'package:black_market/app/core/plugin/data_format.dart';
import 'package:black_market/app/core/widgets/custom_app_bar.dart';
import 'package:black_market/app/modules/notification/html_article/html_article_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

class HtmlArticleView extends GetView<HtmlArticleController> {
  const HtmlArticleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackNormalHover,
      appBar: CustomAppBar(
        onTap: () => Get.back(),
        text: AppStrings.articles,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 25.h,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: GetBuilder<HtmlArticleController>(
                    id: "HtmlArticle",
                    builder: (_) {
                      if (controller.articlesData.isNotEmpty) {
                        return Column(
                          children: [
                            Image.network(
                                "${BaseUrls.storageUrl}${controller.articlesData[0].banner}"),
                            SizedBox(height: 25.h),
                            Text(
                              controller.articlesData[0].title,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: AppColors.yellowDark,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 25.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: 40.h,
                                  width: 80.w,
                                  decoration: BoxDecoration(
                                    color: AppColors.gray,
                                    border: Border.all(color: AppColors.gray),
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        controller.articlesData[0].readsCount
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Icon(Icons.visibility,
                                          color: AppColors.yellowDark),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 25.w,
                                ),
                                Container(
                                  height: 40.h,
                                  width: 120.w,
                                  decoration: BoxDecoration(
                                    color: AppColors.gray,
                                    border: Border.all(color: AppColors.gray),
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        DataFormat.getDataTime(controller
                                            .articlesData[0].createdAt),
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Icon(Icons.create,
                                          color: AppColors.yellowDark),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 25.h),
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: HtmlWidget(
                                controller.articlesData[0].description,
                                textStyle: TextStyle(
                                  fontSize: 15.sp,
                                  color: AppColors.lighterGrey,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        // Handle the case when articlesData is empty
                        return const Text('No articles available.');
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
