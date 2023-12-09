import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/base_urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainerArticles extends StatelessWidget {
  final String title;
  final String body;
  final String image;

  const CustomContainerArticles({
    super.key,
    required this.title,
    required this.body,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.gray,
              borderRadius: BorderRadius.all(
                Radius.circular(20.r),
              ),
            ),
            width: 350.w,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Image.network(
                          BaseUrls.storageUrl + image,
                          fit: BoxFit.fill,
                          width: 60.w,
                          height: 60.h,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            body,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.greyWhite,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
