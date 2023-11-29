import 'package:black_market/app/core/constants/app_asset_image.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackDark,
      body: SafeArea(
          child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.builder(
          physics: const ScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              leading: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: Image.asset(
                  AppAssetImage.image,
                ),
              ),
              title: Text(
                "بنك فرنسي: دولار السوق السوداء في مصر سيواصل صعودة",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white),
              ),
              subtitle: Text(
                "لقد تم صعود الجنيه المصري",
                style: TextStyle(
                    fontWeight: FontWeight.w400, color: AppColors.greyWhite),
              ),
            );
          },
        ),
      )),
    );
  }
}
