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
import 'package:get/get.dart';

class MainGoldController extends GetxController {
  final GoldRepo goldRepo;
  String? error;
  List<Gold> goldList = [];
  List<GoldCompany> goldCompanyList = [];
  List<Ingots> ingots = [];
  List<Coins> coins = [];
  List<IngotCompany?> filteredIngotsByCompany = [];
  List<IngotCompany?> filteredCoinsByCompany = [];

  List<IngotCompany> btcIngotInfo = [];
  List<IngotCompany> btcCoinsInfo = [];

  int selected = -1;
  int isSelected = -1;
  int isCompanySelected = -1;

  void selectCoinCompany(bool value, int i) {
    if (value) {
      isCompanySelected = i;
    } else {
      isCompanySelected = -1;
    }
    update(["goldCompanyInCoins"]);
  }

  void selectCompany(bool value, int i) {
    if (value) {
      isSelected = i;
    } else {
      isSelected = -1;
    }
    update(["goldCompanyInIngots"]);
  }

// To allow Expanding one Tile at the same time and collapsing the others
  void selectTile(bool value, int i) {
    if (value) {
      selected = i;
    } else {
      selected = -1;
    }
    update(["ingotListView"]);
    update(["coinsListView"]);
  }

  @override
  void onInit() {
    super.onInit();
    getGold();
    getGoldCompanies();
    getAlloyAndCoins().then((_) {
      btcCompanyIngotInformation();
      btcCompanyCoinsInformation();
    });
  }

  MainGoldController({
    required this.goldRepo,
  });

// To filter ingots to get the btc company Info
  void btcCompanyIngotInformation() {
    btcIngotInfo.clear();
    for (var element in ingots) {
      for (var company in element.companiesData!) {
        if (company.companyId == 1) {
          log("elements ${element.name}");
          btcIngotInfo.add(IngotCompany(
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
    }
    // for (var element in btcIngotInfo) {
    //   log(element.name.toString());
    // }
    // log("length${btcIngotInfo.length}");
    update(["ingotListView"]);
  }

// to filter the coins to get the btc info
  void btcCompanyCoinsInformation() {
    btcCoinsInfo.clear();
    for (var element in coins) {
      for (var company in element.companiesData!) {
        if (company.companyId == 1) {
          log("elements ${element.name}");
          btcCoinsInfo.add(IngotCompany(
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
    }
    // for (var element in btcCoinsInfo) {
    //   log(element.name.toString());
    // }
    // log("length${btcCoinsInfo.length}");
    update(["coinsListView"]);
  }

// To update ingot list view on clicking on a specific company
  void updateIngotWidgetOnClickingOnCompany(int companyID) {
    filteredIngotsByCompany.clear();
    for (var element in ingots) {
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
    }
    for (var element in filteredIngotsByCompany) {
      log("TestFilter${element!.name}");
    }
    log("TestFilter${filteredIngotsByCompany.length}");
    update(["ingotListView"]);
  }
// To update coins list view on clicking on a specific company

  void updateCoinsWidgetOnClickingOnCompany(int companyID) {
    filteredCoinsByCompany.clear();
    for (var element in coins) {
      for (var company in element.companiesData!) {
        if (company.companyId == companyID) {
          log("elements ${element.name}");
          filteredCoinsByCompany.add(IngotCompany(
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
    }
    for (var element in filteredCoinsByCompany) {
      log("TestFilter${element!.name}");
    }
    log("TestFilter${filteredCoinsByCompany.length}");
    update(["coinsListView"]);
  }

  Future<void> getAlloyAndCoins() async {
    try {
      error = null;
      update(["ingotListView"]);
      AlloyCoinResponse alloyCoinResponse = await goldRepo.getAlloyCoin();

      ingots.addAll(alloyCoinResponse.ingots as Iterable<Ingots>);
      coins.addAll(alloyCoinResponse.coins as Iterable<Coins>);

      update(["ingotListView"]);
    } on ExceptionHandler catch (e) {
      log("Error: $e");
      error = e.error;
      log(error!);
    }
  }

  Future<void> getGoldCompanies() async {
    try {
      error = null;
      update(["goldCompanyInCoins"]);
      update(["goldCompanyInIngots"]);

      List<GoldCompany> goldCompany = await goldRepo.getGoldCompanies();

      goldCompanyList.addAll(goldCompany);
      update(["goldCompanyInCoins"]);
      update(["goldCompanyInIngots"]);
    } on ExceptionHandler catch (e) {
      log("Error: $e");
      error = e.error;
      log(error!);

      update(["goldCompanyInCoins"]);
      update(["goldCompanyInIngots"]);
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
