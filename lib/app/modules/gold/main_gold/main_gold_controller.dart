import 'dart:developer';

import 'package:black_market/app/core/model/alloy_coins_reponse.dart';
import 'package:black_market/app/core/model/coins.dart';
import 'package:black_market/app/core/model/gold.dart';
import 'package:black_market/app/core/model/gold_company.dart';
import 'package:black_market/app/core/model/ingot_company.dart';
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
  List<Ingots?> filteredIngotsByCompany = [];
  List<IngotCompany> btcInfo = [];

  @override
  void onInit() {
    super.onInit();
    getGold();
    getGoldCompanies();
    getAlloyAndCoins().then((_) => btcCompantInformation());
    // updateWidgetOnClickingOnCompany(1);
  }

  MainGoldController({
    required this.goldRepo,
  });

  void btcCompantInformation() {
    ingots.forEach((element) {
      for (var company in element.companiesData!) {
        if (company.companyId == 1) {
          btcInfo.add(IngotCompany(
              id: element.id,
              baseGoldItem: element.baseGoldItem,
              icon: element.icon,
              name: element.name,
              karat: element.karat,
              weight: element.weight,
              updatedAt: element.updatedAt,
              createdAt: element.createdAt,
              companyId: company.companyId,
              workManShip: company.workmanship,
              tax: company.tax,
              returnFees: company.returnFees));
        } else {
          continue;
        }
      }
    });
    // for (var ingot in ingots) {
    //   ingot.companiesData
    //       ?.where((element) => element.companyId == 1)
    //       .forEach((e1) {
    //     log(e1.workmanship.toString());
    //     if (ingot.id == e1.ingotId && e1.companyId == 1) {
    //       btcInfo.add(IngotCompany(
    //           id: ingot.id,
    //           baseGoldItem: ingot.baseGoldItem,
    //           icon: ingot.icon,
    //           name: ingot.name,
    //           karat: ingot.karat,
    //           weight: ingot.weight,
    //           updatedAt: ingot.updatedAt,
    //           createdAt: ingot.createdAt,
    //           companyId: e1.companyId,
    //           workManShip: e1.workmanship,
    //           tax: e1.tax,
    //           returnFees: e1.returnFees));
    //     }
    //   });
    // }
    log("length${btcInfo.length.toString()}");
    update(["ingotListView"]);
  }

  void updateWidgetOnClickingOnCompany(int companyID) {
    // update();
    filteredIngotsByCompany.clear();

    for (var element in ingots) {
      // if (element.companiesData != null) {
// this means we have companies

      element.companiesData
          ?.where((e) => e.companyId == companyID)
          .forEach((e1) {
        filteredIngotsByCompany.add(element);
      });
    }
    // filteredIngotsByCompany.forEach(
    //   (element) => print("TestFilter${element.}"),
    // );
    // log("TestFilter${filteredIngotsByCompany.length}");
    update(["ingotListView"]);
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
