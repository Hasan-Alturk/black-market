class LatestCurrency {
  int? id;
  dynamic banner;
  late final String icon;
  late final String name;
  String? code;
  int? canBeMain;
  int? sort;
  int? showNetworkImage;
  String? lastUpdate;
  dynamic createdAt;
  String? updatedAt;
  List<CurrencyPrice>? livePrices;
  List<CurrencyPrice>? blackMarketPrices;
  List<CurrencyPrice>? bankPrices;

  LatestCurrency({
    required this.id,
    required this.banner,
    required this.icon,
    required this.name,
    required this.code,
    required this.canBeMain,
    required this.sort,
    required this.showNetworkImage,
    required this.lastUpdate,
    required this.createdAt,
    required this.updatedAt,
    required this.livePrices,
    required this.blackMarketPrices,
    required this.bankPrices,
  });

  static List<LatestCurrency> latestCurrencyList(List data) =>
      data.map((currency) => LatestCurrency.fromJson(currency)).toList();

  LatestCurrency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    banner = json['banner'];
    icon = json['icon'];
    name = json['name'];
    code = json['code'];
    sort = json['sort'];
    canBeMain = json['can_be_main'];
    showNetworkImage = json['show_network_image'];
    lastUpdate = json['last_update'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    if (json['live_prices'] != null) {
      livePrices = <CurrencyPrice>[];
      json['live_prices'].forEach((v) {
        livePrices!.add(CurrencyPrice.fromJson(v));
      });
    }
    if (json['black_market_prices'] != null) {
      blackMarketPrices = <CurrencyPrice>[];
      json['black_market_prices'].forEach((v) {
        blackMarketPrices!.add(CurrencyPrice.fromJson(v));
      });
    }
    if (json['bank_prices'] != null) {
      bankPrices = <CurrencyPrice>[];
      json['bank_prices'].forEach((v) {
        bankPrices!.add(CurrencyPrice.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['banner'] = banner;
    data['icon'] = icon;
    data['name'] = name;
    data['code'] = code;
    data['sort'] = sort;
    data['can_be_main'] = canBeMain;
    data['show_network_image'] = showNetworkImage;
    data['last_update'] = lastUpdate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (livePrices != null) {
      data['live_prices'] = livePrices!.map((v) => v.toJson()).toList();
    }
    if (blackMarketPrices != null) {
      data['black_market_prices'] =
          blackMarketPrices!.map((v) => v.toJson()).toList();
    }
    if (bankPrices != null) {
      data['bank_prices'] = bankPrices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CurrencyPrice {
  int? id;
  int? bankId;
  int? currencyId;
  num? buyPrice;
  num? sellPrice;
  String? date;
  String? createdAt;
  String? updatedAt;
  int? hour;
  num? price;

  CurrencyPrice({
    required this.id,
    this.bankId,
    required this.currencyId,
    this.buyPrice,
    this.sellPrice,
    required this.date,
    required this.createdAt,
    required this.updatedAt,
    this.hour,
    this.price,
  });
  CurrencyPrice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bankId = json['bank_id'];
    currencyId = json['currency_id'];
    buyPrice = json['buy_price'];
    sellPrice = json['sell_price'];
    hour = json['hour'];
    date = json['date'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['bank_id'] = bankId;
    data['currency_id'] = currencyId;
    data['buy_price'] = buyPrice;
    data['sell_price'] = sellPrice;
    data['hour'] = hour;
    data['date'] = date;
    data['price'] = price;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
