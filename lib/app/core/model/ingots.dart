class Ingots {
  int? id;
  int? baseGoldItem;
  String? icon;
  String? name;
  String? karat;
  num? weight;
  int? sort;
  String? createdAt;
  String? updatedAt;
  List<IngotCompaniesData>? companiesData;
  GoldPrice? price;

  Ingots(
      {this.id,
      this.baseGoldItem,
      this.icon,
      this.name,
      this.karat,
      this.weight,
      this.sort,
      this.createdAt,
      this.updatedAt,
      this.companiesData,
      this.price});

  Ingots.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    baseGoldItem = json['base_gold_item'];
    icon = json['icon'];
    name = json['name'];
    karat = json['karat'];
    weight = json['weight'];
    sort = json['sort'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['companies_data'] != null) {
      companiesData = <IngotCompaniesData>[];
      json['companies_data'].forEach((v) {
        companiesData!.add(IngotCompaniesData.fromJson(v));
      });
    }
    price = json['price'] != null ? GoldPrice.fromJson(json['price']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['base_gold_item'] = baseGoldItem;
    data['icon'] = icon;
    data['name'] = name;
    data['karat'] = karat;
    data['weight'] = weight;
    data['sort'] = sort;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (companiesData != null) {
      data['companies_data'] = companiesData!.map((v) => v.toJson()).toList();
    }
    if (price != null) {
      data['price'] = price!.toJson();
    }
    return data;
  }
}

class IngotCompaniesData {
  int? id;
  int? companyId;
  int? ingotId;
  num? workmanship;
  num? tax;
  num? returnFees;
  String? createdAt;
  String? updatedAt;

  IngotCompaniesData(
      {this.id,
      this.companyId,
      this.ingotId,
      this.workmanship,
      this.tax,
      this.returnFees,
      this.createdAt,
      this.updatedAt});

  IngotCompaniesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    ingotId = json['ingot_id'];
    workmanship = json['workmanship'];
    tax = json['tax'];
    returnFees = json['return_fees'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_id'] = companyId;
    data['ingot_id'] = ingotId;
    data['workmanship'] = workmanship;
    data['tax'] = tax;
    data['return_fees'] = returnFees;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class GoldPrice {
  int? id;
  int? goldIngotId;
  num? buyPrice;
  num? sellPrice;
  String? createdAt;
  String? updatedAt;

  GoldPrice(
      {this.id,
      this.goldIngotId,
      this.buyPrice,
      this.sellPrice,
      this.createdAt,
      this.updatedAt});

  GoldPrice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    goldIngotId = json['gold_ingot_id'];
    buyPrice = json['buy_price'];
    sellPrice = json['sell_price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['gold_ingot_id'] = goldIngotId;
    data['buy_price'] = buyPrice;
    data['sell_price'] = sellPrice;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
