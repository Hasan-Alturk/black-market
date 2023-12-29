import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/widgets/bank_details_widgets/bank_details_widget.dart';
import 'package:black_market/app/core/widgets/bank_details_widgets/bank_prices_widget.dart';
import 'package:black_market/app/core/widgets/bank_details_widgets/bank_top_container.dart';
import 'package:black_market/app/core/widgets/bank_details_widgets/calculator_widget.dart';
import 'package:black_market/app/core/widgets/bank_details_widgets/currencies_in_bank_container.dart';
import 'package:black_market/app/modules/bank_details/bank_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BankDetailsView extends GetView<BankDetailsController> {
  const BankDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackDarkActive,
      body: SafeArea(
        child: ListView(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            children: [
              const BankTopContainer(),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.w),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.yellowNormal,
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 12.h,
                      ),
                      const CurrenciesInBankContainer(),
                      SizedBox(
                        height: 10.h,
                      ),
                      const BankPricesWidget()
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              const CalculatorWidget(),
              SizedBox(
                height: 20.h,
              ),
              const BankDetailsWidget()
            ]),
      ),
    );
  }
}
