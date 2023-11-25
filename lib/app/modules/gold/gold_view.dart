import 'package:black_market/app/modules/main/main_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoldView extends GetView<MainHomeController> {
  const GoldView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Gold"),
    );
  }
}
