import 'dart:developer';

import 'package:black_market/app/core/model/gold.dart';
import 'package:black_market/app/core/model/gold_company.dart';
import 'package:black_market/app/core/repo/gold_repo.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:get/get.dart';

class MainGoldController extends GetxController {
  final GoldRepo goldRepo;
  String? error;
  List<Gold> goldList = [];
  List<GoldCompany> goldCompanyList = [];

  @override
  void onInit() {
    super.onInit();
    getGold();
    getGoldCompanies();
  }

  MainGoldController({
    required this.goldRepo,
  });
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
