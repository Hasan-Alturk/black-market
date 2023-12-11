import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/mapper/currency_in_bank.dart';
import 'package:black_market/app/core/model/latest_currency.dart';
import 'package:black_market/app/core/widgets/currency_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectCurrencyDialog extends StatelessWidget {
  const SelectCurrencyDialog({
    this.currencyList,
    this.latestCurrencyList,
    required this.onTap,
    super.key,
  });
  final Function(int currencyId) onTap;
  final List<LatestCurrency>? latestCurrencyList;
  final List<CurrencyInBank>? currencyList;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 500.h,
        width: 300.w,
        decoration: BoxDecoration(
          color: AppColors.gray,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: currencyList == null
                  ? latestCurrencyList?.length
                  : currencyList?.length,
              // controller.latestCurrencyList.length,
              itemBuilder: (ctx, index) => GestureDetector(
                onTap: () {
                  currencyList == null
                      ? onTap(latestCurrencyList![index].id!)
                      : onTap(currencyList![index].currencyId);
                },
                child: CurrencyItem(
                  currencyName: currencyList == null
                      ? latestCurrencyList![index].name.toString()
                      : currencyList![index].currencyName.toString(),
                  //  controller.latestCurrencyList[index].name
                  //     .toString(),
                  currenyImage: currencyList == null
                      ? latestCurrencyList![index].icon!
                      : currencyList![index].currencyIcon,
                  // controller.latestCurrencyList[index].icon
                  //     .toString(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
