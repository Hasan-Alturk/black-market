import 'package:black_market/app/modules/gold/gold_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoldView extends GetView<GoldController> {
  const GoldView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Gold")),
    );
  }
}
