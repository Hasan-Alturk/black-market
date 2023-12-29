import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/constants/base_urls.dart';
import 'package:black_market/app/modules/bank_details/bank_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BankDetailsWidget extends GetView<BankDetailsController> {
  const BankDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.gray,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: GetBuilder<BankDetailsController>(
              id: "bankDetails",
              builder: (_) {
                return DataTable(
                    dividerThickness: 0,
                    showCheckboxColumn: false,
                    // Datatable widget that have the property columns and rows.
                    columns: [
                      // Set the name of the column
                      DataColumn(
                        label: Text(
                          AppStrings.coin,
                          style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      DataColumn(
                        label: Text(AppStrings.buy,
                            style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w700)),
                      ),

                      DataColumn(
                        label: Text(AppStrings.sell,
                            style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w700)),
                      ),
                    ],
                    rows: [
                      // Set the values to the columns
                      for (var i in controller.bankData)
                        DataRow(cells: [
                          DataCell(Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Image.network(
                                  BaseUrls.storageUrl + i.currencyIcon,
                                  height: 20.h,
                                  width: 20.w,
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  i.currencyName,
                                  style: TextStyle(
                                      fontSize: 9.sp,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          )),
                          DataCell(Text(i.buyPrice.toString(),
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.yellowNormal,
                                  fontWeight: FontWeight.w700))),
                          DataCell(Text(i.sellPrice.toString(),
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.yellowNormal,
                                  fontWeight: FontWeight.w700))),
                        ]),
                    ]);
              }),
        ),
      ),
    );
  }
}
