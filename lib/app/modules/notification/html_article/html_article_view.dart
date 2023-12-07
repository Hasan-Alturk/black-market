import 'package:black_market/app/core/constants/app_colors.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 25.h,
            ),
            GetBuilder<HtmlArticleController>(
              id: "HtmlArticle",
              builder: (_) {
                return Expanded(
                  child: SingleChildScrollView(
                    child: HtmlWidget(
                      controller.text,
                      textStyle: TextStyle(
                        fontSize: 15.sp,
                        color: AppColors.lighterGrey,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
