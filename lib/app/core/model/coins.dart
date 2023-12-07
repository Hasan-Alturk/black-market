class Coins {
  int? id;
  int? baseGoldItem;
  String? icon;
  String? name;
  String? karat;
  int? weight;
  int? sort;
  String? createdAt;
  String? updatedAt;
  List<CoinsCompaniesData>? companiesData;
  CoinPrice? price;

  Coins(
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

  Coins.fromJson(Map<String, dynamic> json) {
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
      companiesData = <CoinsCompaniesData>[];
      json['companies_data'].forEach((v) {
        companiesData!.add(CoinsCompaniesData.fromJson(v));
      });
    }
    price = json['price'] != null ? CoinPrice.fromJson(json['price']) : null;
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

class CoinsCompaniesData {
  int? id;
  int? companyId;
  int? coinId;
  num? workmanship;
  num? tax;
  num? returnFees;
  CoinPrice? price;
  String? createdAt;
  String? updatedAt;

  CoinsCompaniesData(
      {this.id,
      this.companyId,
      this.coinId,
      this.workmanship,
      this.tax,
      this.returnFees,
      this.price,
      this.createdAt,
      this.updatedAt});

  CoinsCompaniesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    coinId = json['coin_id'];
    workmanship = json['workmanship'];
    tax = json['tax'];
    returnFees = json['return_fees'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_id'] = companyId;
    data['coin_id'] = coinId;
    data['workmanship'] = workmanship;
    data['tax'] = tax;
    data['return_fees'] = returnFees;
    data['price'] = price;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class CoinPrice {
  int? id;
  int? goldCoinId;
  num? buyPrice;
  num? sellPrice;
  String? createdAt;
  String? updatedAt;

  CoinPrice(
      {this.id,
      this.goldCoinId,
      this.buyPrice,
      this.sellPrice,
      this.createdAt,
      this.updatedAt});

  CoinPrice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    goldCoinId = json['gold_coin_id'];
    buyPrice = json['buy_price'];
    sellPrice = json['sell_price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['gold_coin_id'] = goldCoinId;
    data['buy_price'] = buyPrice;
    data['sell_price'] = sellPrice;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
