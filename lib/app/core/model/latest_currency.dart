class LatestCurrency {
  int? id;
  dynamic banner;
  String? icon;
  String? name;
  String? code;
  int? canBeMain;
  int? sort;
  int? showNetworkImage;
  String? lastUpdate;
  dynamic createdAt;
  String? updatedAt;
  List<LivePrice>? livePrices;
  List<BlackMarketPrice>? blackMarketPrices;
  List<BankPrice>? bankPrices;

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
      livePrices = <LivePrice>[];
      json['live_prices'].forEach((v) {
        livePrices?.add(LivePrice.fromJson(v));
      });
    }
    if (json['black_market_prices'] != null) {
      blackMarketPrices = <BlackMarketPrice>[];
      json['black_market_prices'].forEach((v) {
        blackMarketPrices?.add(BlackMarketPrice.fromJson(v));
      });
    }
    if (json['bank_prices'] != null) {
      bankPrices = <BankPrice>[];
      json['bank_prices'].forEach((v) {
        bankPrices?.add(BankPrice.fromJson(v));
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
    if (livePrices!.isNotEmpty) {
      data['live_prices'] = livePrices?.map((v) => v.toJson()).toList();
    }
    if (blackMarketPrices!.isNotEmpty) {
      data['black_market_prices'] =
          blackMarketPrices?.map((v) => v.toJson()).toList();
    }
    if (bankPrices!.isNotEmpty) {
      data['bank_prices'] = bankPrices?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BlackMarketPrice {
  late int id;
  late int currencyId;
  late num buyPrice;
  late num sellPrice;
  late String date;
  late int hour;
  late String createdAt;
  late String updatedAt;
  BlackMarketPrice(
      {required this.id,
      required this.buyPrice,
      required this.createdAt,
      required this.currencyId,
      required this.date,
      required this.hour,
      required this.sellPrice,
      required this.updatedAt});

  BlackMarketPrice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    currencyId = json['currency_id'];
    buyPrice = json['buy_price'];
    sellPrice = json['sell_price'];
    hour = json['hour'];
    date = json['date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['currency_id'] = currencyId;
    data['buy_price'] = buyPrice;
    data['sell_price'] = sellPrice;
    data['hour'] = hour;
    data['date'] = date;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class LivePrice {
  late int id;
  late int currencyId;
  late num price;
  late String date;
  late int hour;
  late String createdAt;
  late String updatedAt;
  LivePrice(
      {required this.id,
      required this.createdAt,
      required this.currencyId,
      required this.date,
      required this.hour,
      required this.price,
      required this.updatedAt});

  LivePrice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    currencyId = json['currency_id'];
    price = json['price'];
    hour = json['hour'];
    date = json['date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['currency_id'] = currencyId;
    data['price'] = price;
    data['hour'] = hour;
    data['date'] = date;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class BankPrice {
  late int id;
  late int bankId;
  late int currencyId;
  late num buyPrice;
  late num sellPrice;
  late String date;
  late String createdAt;
  late String updatedAt;

  BankPrice({
    required this.id,
    required this.bankId,
    required this.currencyId,
    required this.buyPrice,
    required this.sellPrice,
    required this.date,
    required this.createdAt,
    required this.updatedAt,
  });
  BankPrice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bankId = json['bank_id'];
    currencyId = json['currency_id'];
    buyPrice = json['buy_price'];
    sellPrice = json['sell_price'];
    date = json['date'];
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
    data['date'] = date;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
