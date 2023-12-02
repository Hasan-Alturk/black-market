import 'dart:developer';

import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/model/alloy_coins_reponse.dart';
import 'package:black_market/app/core/model/coins.dart';
import 'package:black_market/app/core/model/gold.dart';
import 'package:black_market/app/core/model/gold_company.dart';
import 'package:black_market/app/core/model/ingot_company.dart';
import 'package:black_market/app/core/model/ingots.dart';
import 'package:black_market/app/core/repo/gold_repo.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MainGoldController extends GetxController {
  final GoldRepo goldRepo;
  String? error;
  List<Gold> goldList = [];
  List<GoldCompany> goldCompanyList = [];
  List<Ingots> ingots = [];
  List<Coins> coins = [];
  List<IngotCompany?> filteredIngotsByCompany = [];
  List<IngotCompany> btcInfo = [];
  var defaultColor = AppColors.white;
  @override
  void onInit() {
    super.onInit();
    getGold();
    getGoldCompanies();
    getAlloyAndCoins().then((_) => btcCompanyInformation());
  }

  MainGoldController({
    required this.goldRepo,
  });

  void btcCompanyInformation() {
    btcInfo.clear();
    ingots.forEach((element) {
      for (var company in element.companiesData!) {
        if (company.companyId == 1) {
          log("elements ${element.name}");
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
              returnFees: company.returnFees,
              totalPriceIncludingtaxAndWorkmanship: element.price!.sellPrice! +
                  company.tax! +
                  company.workmanship!,
              sellPrice: element.price?.sellPrice,
              difference: company.workmanship! - company.returnFees!,
              buyPrice: element.price?.buyPrice));
        } else {
          continue;
        }
      }
    });
    changeTextColor(1);
    btcInfo.forEach(
      (element) => log(element.name.toString()),
    );
    log("length${btcInfo.length}");
    update(["ingotListView"]);
  }

  void updateWidgetOnClickingOnCompany(int companyID) {
    // update();
    filteredIngotsByCompany.clear();
    ingots.forEach((element) {
      for (var company in element.companiesData!) {
        if (company.companyId == companyID) {
          log("elements ${element.name}");
          filteredIngotsByCompany.add(IngotCompany(
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
              returnFees: company.returnFees,
              totalPriceIncludingtaxAndWorkmanship: element.price!.sellPrice! +
                  company.tax! +
                  company.workmanship!,
              sellPrice: element.price?.sellPrice,
              difference: company.workmanship! - company.returnFees!,
              buyPrice: element.price?.buyPrice));
        } else {
          continue;
        }
      }
    });
    changeTextColor(companyID);
    filteredIngotsByCompany.forEach(
      (element) => log("TestFilter${element!.name}"),
    );
    log("TestFilter${filteredIngotsByCompany.length}");
    update(["ingotListView"]);
  }

  void changeTextColor(int companyId) {
    goldCompanyList.forEach((element) {
      if (element.id == companyId) {
        defaultColor = AppColors.yellowNormal;
      } else {
        defaultColor = AppColors.white;
      }
    });
    update(["goldCompany"]);
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
