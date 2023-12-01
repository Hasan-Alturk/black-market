import 'dart:developer';

import 'package:black_market/app/core/model/alloy_coins_reponse.dart';
import 'package:black_market/app/core/model/coins.dart';
import 'package:black_market/app/core/model/gold.dart';
import 'package:black_market/app/core/model/gold_company.dart';
import 'package:black_market/app/core/model/ingots.dart';
import 'package:black_market/app/core/repo/gold_repo.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:get/get.dart';

class MainGoldController extends GetxController {
  final GoldRepo goldRepo;
  String? error;
  List<Gold> goldList = [];
  List<GoldCompany> goldCompanyList = [];
  List<Ingots> ingots = [];
  List<Coins> coins = [];

  @override
  void onInit() {
    super.onInit();
    getGold();
    getGoldCompanies();
    getAlloyAndCoins();
  }

  MainGoldController({
    required this.goldRepo,
  });

  void updateWidgetOnClickingOnCompany(int companyID) {
    for (var element in ingots) {
      if (element.companiesData != null) {
// this means we have companies
        print(element.companiesData!
            .where((elementWithCompanies) =>
                elementWithCompanies.companyId == companyID)
            .firstOrNull
            ?.workmanship);
      }
    }
  }

  Future<void> getAlloyAndCoins() async {
    try {
      error = null;
      update(["ingotListView"]);
      AlloyCoinResponse alloyCoinResponse = await goldRepo.getAlloyCoin();

      ingots.addAll(alloyCoinResponse.ingots as Iterable<Ingots>);
      coins.addAll(alloyCoinResponse.coins as Iterable<Coins>);

      // log(ingots[0].id.toString());
      update(["ingotListView"]);
    } on ExceptionHandler catch (e) {
      log("Error: $e");
      error = e.error;
      log(error!);

      update(["goldCompany"]);
    }
  }

  Future<void> getGoldCompanies() async {
    try {
      error = null;
      update(["goldCompany"]);
      List<GoldCompany> goldCompany = await goldRepo.getGoldCompanies();

      goldCompanyList.addAll(goldCompany);
      update(["goldCompany"]);
    } on ExceptionHandler catch (e) {
      log("Error: $e");
      error = e.error;
      log(error!);

      update(["goldCompany"]);
    }
  }

  Future<void> getGold() async {
    try {
      error = null;
      update(["goldCard"]);
      List<Gold> gold = await goldRepo.getGold();

      goldList.addAll(gold);
      update(["goldCard"]);
    } on ExceptionHandler catch (e) {
      log("Error: $e");
      error = e.error;
      log(error!);

      update(["goldCard"]);
    }
  }
}
