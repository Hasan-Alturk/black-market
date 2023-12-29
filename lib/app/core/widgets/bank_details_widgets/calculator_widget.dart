import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/widgets/bank_details_widgets/calculate_text.dart';
import 'package:black_market/app/core/widgets/bank_details_widgets/calculator_row.dart';
import 'package:black_market/app/core/widgets/bank_details_widgets/equality_row.dart';
import 'package:black_market/app/modules/bank_details/bank_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CalculatorWidget extends GetView<BankDetailsController> {
  const CalculatorWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: GetBuilder<BankDetailsController>(
          id: "calculatorView",
          builder: (_) {
            return Container(
              decoration: BoxDecoration(
                color: AppColors.gray,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const CalculatorRow(),
                    SizedBox(
                      height: 11.h,
                    ),
                    const CalculateText(),
                    SizedBox(
                      height: 11.h,
                    ),
                    const EqualityRow()
                  ],
                ),
              ),
            );
          }),
    );
  }
}
