class HistoricalCurrency {
  HistoricalCurrency({
    required this.livePrices,
    required this.blackMarketPrices,
  });
  HistoricalLivePrices? livePrices;
  HistoricalBlackMarketPrices? blackMarketPrices;

  HistoricalCurrency.fromJson(Map<String, dynamic> dataJson) {
    //  if (dataJson['live_prices'] != null) {
    //   livePrices = HistoricalLivePrices();
    //   dataJson['live_prices'].forEach((k , v) {
    //     livePrices!.add(Ingots.fromJson(v));
    //   });
    // }
    livePrices = HistoricalLivePrices.fromJson(dataJson["live_prices"]);
    blackMarketPrices =
        HistoricalBlackMarketPrices.fromJson(dataJson["black_market_prices"]);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["live_prices"] = livePrices;
    data["black_market_prices"] = blackMarketPrices;
    return data;
  }
}

class HistoricalBlackMarketPrices {
  HistoricalBlackMarketPrices({
    required this.blackMarketPrices,
  });
  Map<String, List<Currency>>? blackMarketPrices;

  HistoricalBlackMarketPrices.fromJson(Map<String, dynamic> json) {
    json.forEach((key, value) {
      blackMarketPrices?.addAll({key: value});
    });
    // json['black_market_prices'].forEach((v) {
    //   blackMarketPrices?.addAll(v);
    // });

    // blackMarketPrices = json["black_market_prices"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['black_market_prices'] = blackMarketPrices;
    return data;
  }
}

class HistoricalLivePrices {
  Map<String, List<Currency>>? livePrices;
  HistoricalLivePrices({
    required this.livePrices,
  });
  HistoricalLivePrices.fromJson(Map<String, dynamic> json) {
    json.forEach((key, value) {
      livePrices?.addAll({key: value});
    });
    // json['live_prices'].forEach((v) {
    //   livePrices?.addAll(v);
    // });

    // livePrices = json["live_prices"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['live_prices'] = livePrices;
    return data;
  }
}

class Currency {
  int? currencyId;
  num? price;
  String? date;
  Currency({required this.currencyId, required this.price, required this.date});
  Currency.fromJson(Map<String, dynamic> json) {
    currencyId = json["currency_id"];
    price = json["price"];
    date = json["date"];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["currency_id"] = currencyId;
    data["price"] = price;
    data["date"] = date;
    return data;
  }
}
