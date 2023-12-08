// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';

class GoldCalculatorDialog extends StatelessWidget {
  List<String> karat;
  TextEditingController totalPaidAmount;
  TextEditingController totalGram;
  Function(String selectedKarat) selectKarat;
  void Function() calculate;

  GoldCalculatorDialog({
    Key? key,
    required this.karat,
    required this.totalPaidAmount,
    required this.totalGram,
    required this.selectKarat,
    required this.calculate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: context.screenHeight * 0.35,
        width: context.screenWidth * 0.92,
        decoration: BoxDecoration(
          color: AppColors.gray,
          borderRadius: BorderRadius.circular(20),
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
                  height: context.screenHeight * 0.015,
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
                          fontSize: 14,
                          color: AppColors.yellowNormal),
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(12),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.yellowNormal),
                              borderRadius: BorderRadius.circular(12)),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.greyNormal),
                              borderRadius: BorderRadius.circular(12)),
                          labelText: AppStrings.totalPaidAmount,
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: AppColors.greyNormalActive)),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: context.screenWidth * 0.4,
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
                                    borderRadius: BorderRadius.circular(12)),
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.greyNormal),
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              hint: Text(AppStrings.caliber,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
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
                      width: context.screenWidth * 0.45,
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
                                fontSize: 14,
                                color: AppColors.yellowNormal),
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(12),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.yellowNormal),
                                    borderRadius: BorderRadius.circular(12)),
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.greyNormal),
                                    borderRadius: BorderRadius.circular(12)),
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
                SizedBox(
                  height: context.screenHeight * 0.02,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(AppColors.yellowNormal),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8)),
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
                // Container(
                //   decoration: BoxDecoration(
                //       color: AppColors.yellowNormal,
                //       borderRadius: BorderRadius.circular(12)),
                //       child: Text("data"),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
