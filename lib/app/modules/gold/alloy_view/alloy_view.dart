import 'package:black_market/app/core/constants/app_asset_image.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:flutter/material.dart';

class AlloyView extends StatefulWidget {
  const AlloyView({super.key});

  @override
  State<AlloyView> createState() => _AlloyViewState();
}

class _AlloyViewState extends State<AlloyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackNormal,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            SizedBox(
              height: context.screenHeight * 0.12,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage(AppAssetImage.goldImage),
                          ),
                          SizedBox(
                            height: context.screenHeight * 0.005,
                          ),
                          Text(
                            "Gold Era",
                            style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.gray,
                          borderRadius: BorderRadius.circular(12)),
                      child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: ExpansionTile(
                              shape: RoundedRectangleBorder(
                                  side:
                                      BorderSide(color: AppColors.yellowNormal),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12))),
                              iconColor: AppColors.white,
                              collapsedIconColor: AppColors.white,
                              title: Text(
                                "${(index + 1) * 5} جرام ",
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                              children: [
                                _buildTileDetails(AppStrings.gramPrice,
                                    "2500 ج.م", AppColors.white),
                                _buildTileDetails(AppStrings.gramManufacturing,
                                    "2500 ج.م", AppColors.white),
                                _buildTileDetails(AppStrings.totalTax,
                                    "2500 ج.م", AppColors.white),
                                _buildTileDetails(
                                    AppStrings
                                        .totalPriceWithManufacturingAndTax,
                                    "2500 ج.م",
                                    AppColors.yellowNormal),
                                _buildTileDetails(AppStrings.importAmount,
                                    "2500 ج.م", AppColors.white),
                                _buildTileDetails(AppStrings.difference,
                                    "2500 ج.م", AppColors.white),
                              ]))),
                );
              },
              itemCount: 10,
            ),
          ],
        ),
      )),
    );
  }

  Widget _buildTileDetails(String text, String price, Color textColor) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(color: textColor, fontWeight: FontWeight.w700),
          ),
          Text(
            price,
            style: TextStyle(color: textColor, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
