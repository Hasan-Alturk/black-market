import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/modules/gold/main_gold/main_gold_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class GoldCalculatorDialog extends GetView<MainGoldController> {
  List<String> karat;
  TextEditingController totalPaidAmount;
  TextEditingController totalGram;
  Function(String selectedKarat) selectKarat;
  void Function() calculate;
  String? workshipText;

  GoldCalculatorDialog(
      {Key? key,
      required this.karat,
      required this.totalPaidAmount,
      required this.totalGram,
      required this.selectKarat,
      required this.calculate,
      this.workshipText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 320.h,
        width: 380.w,
        decoration: BoxDecoration(
          color: AppColors.gray,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                      backgroundColor: AppColors.darkGrey,
                      child: Image.asset(AppAssetIcons.close),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Card(
                  elevation: 0,
                  color: AppColors.gray,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                      controller: totalPaidAmount,
                      keyboardType: TextInputType.number,
                      cursorColor: AppColors.yellowNormal,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: AppColors.yellowNormal),
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(12),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.yellowNormal),
                              borderRadius: BorderRadius.circular(12.r)),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.greyNormal),
                              borderRadius: BorderRadius.circular(12.r)),
                          labelText: AppStrings.totalPaidAmount,
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              color: AppColors.greyNormalActive)),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 180.w,
                      child: Card(
                          elevation: 0,
                          color: AppColors.gray,
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(16),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.yellowNormal),
                                    borderRadius: BorderRadius.circular(12.r)),
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.greyNormal),
                                    borderRadius: BorderRadius.circular(12.r)),
                              ),
                              hint: Text(AppStrings.caliber,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                      color: AppColors.greyNormalActive)),
                              focusColor: AppColors.yellowNormal,
                              value: null,
                              onChanged: (newValue) {
                                selectKarat(newValue!);
                              },
                              items: karat.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                          color: AppColors.yellowNormal),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          )),
                    ),
                    SizedBox(
                      width: 170.w,
                      child: Card(
                        elevation: 0,
                        color: AppColors.gray,
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextField(
                            controller: totalGram,
                            keyboardType: TextInputType.number,
                            cursorColor: AppColors.yellowNormal,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                                color: AppColors.yellowNormal),
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(12),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.yellowNormal),
                                    borderRadius: BorderRadius.circular(12.r)),
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.greyNormal),
                                    borderRadius: BorderRadius.circular(12.r)),
                                labelText: AppStrings.totalWeightInGram,
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: AppColors.greyNormalActive)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25.h),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(AppColors.yellowNormal),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        ),
                      ),
                    ),
                    onPressed: calculate,
                    child: Text(
                      AppStrings.calculateGoldManufacturing,
                      style: TextStyle(
                          color: AppColors.blackNormal,
                          fontWeight: FontWeight.w700),
                    )),
                const SizedBox(height: 10),
                GetBuilder<MainGoldController>(
                    id: "workshipContainer",
                    builder: (context) {
                      if (controller.totalWorkShip == 0) {
                        return const Visibility(
                          visible: false,
                          child: Text(
                            "",
                          ),
                        );
                      } else {
                        return Visibility(
                            visible: true,
                            child: Text(
                              "مصنعية الذهب ل ${controller.totalgramsController.value.text}جرام =  ${controller.totalWorkShip}  ج.م",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.yellowNormal,
                                  fontWeight: FontWeight.w700),
                            ));
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
