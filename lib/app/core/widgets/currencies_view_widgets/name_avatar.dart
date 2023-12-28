import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/constants/base_urls.dart';
import 'package:black_market/app/modules/currencies/currencies_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NameAndAvatar extends GetView<CurrenciesController> {
  const NameAndAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CurrenciesController>(
        id: "name_and_avatar",
        builder: (_) {
          return Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    AppStrings.hello,
                    style: TextStyle(
                      color: AppColors.blackLightActive,
                    ),
                  ),
                  Text(
                    controller.name,
                    style: TextStyle(
                      color: AppColors.white,
                    ),
                  )
                ],
              ),
              SizedBox(
                width: 8.w,
              ),
              controller.avatar == ""
                  ? const SizedBox()
                  : CircleAvatar(
                      radius: 24.r,
                      child: Image.network(
                        BaseUrls.storageUrl + controller.avatar,
                      ),
                    )
            ],
          );
        });
  }
}
