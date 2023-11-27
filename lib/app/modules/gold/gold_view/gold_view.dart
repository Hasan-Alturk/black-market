import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:black_market/app/modules/currencies/card_item.dart';
import 'package:black_market/app/modules/gold/gold_view/gold_card_item.dart';
import 'package:flutter/material.dart';

class GoldView extends StatefulWidget {
  const GoldView({super.key});

  @override
  State<GoldView> createState() => _GoldViewState();
}

class _GoldViewState extends State<GoldView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackNormal,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          physics: const ScrollPhysics(),
          children: [
            GridView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: 10,
              itemBuilder: (ctx, i) => GestureDetector(
                child: const GoldCardItem(),
                // onTap: () => controller.goToBankDetails(),
              ),
            )
          ],
        ),
      )),
    );
  }
}
