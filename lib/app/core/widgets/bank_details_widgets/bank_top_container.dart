import 'package:black_market/app/core/widgets/bank_details_widgets/bank_info_container.dart';
import 'package:black_market/app/core/widgets/bank_details_widgets/basic_container.dart';
import 'package:black_market/app/modules/bank_details/bank_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BankTopContainer extends GetView<BankDetailsController> {
  const BankTopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.bottomCenter,
      children: [BasicContainer(), BankInfoContainer()],
    );
  }
}
