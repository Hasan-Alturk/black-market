class HistoricalCurrency {
  HistoricalCurrency({
    required this.livePrices,
    required this.blackMarketPrices,
  });

  final Map<String, List<LivePrice>> livePrices;
  final Map<String, List<BlackMarketPrice>> blackMarketPrices;

  factory HistoricalCurrency.fromJson(Map<String, dynamic> json) {
    return HistoricalCurrency(
      livePrices: Map.from(json["live_prices"]).map((k, v) => MapEntry<String,
              List<LivePrice>>(
          k,
          v == null
              ? []
              : List<LivePrice>.from(v!.map((x) => LivePrice.fromJson(x))))),
      blackMarketPrices: Map.from(json["black_market_prices"]).map((k, v) =>
          MapEntry<String, List<BlackMarketPrice>>(
              k,
              v == null
                  ? []
                  : List<BlackMarketPrice>.from(
                      v!.map((x) => BlackMarketPrice.fromJson(x))))),
    );
  }

  Map<String, dynamic> toJson() => {
        "live_prices": Map.from(livePrices).map((k, v) =>
            MapEntry<String, dynamic>(k, v.map((x) => x?.toJson()).toList())),
        "black_market_prices": Map.from(blackMarketPrices).map((k, v) =>
            MapEntry<String, dynamic>(k, v.map((x) => x?.toJson()).toList())),
      };
}

class BlackMarketPrice {
  BlackMarketPrice({
    required this.currencyId,
    required this.buyPrice,
    required this.sellPrice,
    required this.date,
  });

  final int? currencyId;
  final double? buyPrice;
  final double? sellPrice;
  final DateTime? date;

  factory BlackMarketPrice.fromJson(Map<String, dynamic> json) {
    return BlackMarketPrice(
      currencyId: json["currency_id"],
      buyPrice: json["buy_price"],
      sellPrice: json["sell_price"],
      date: DateTime.tryParse(json["date"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "currency_id": currencyId,
        "buy_price": buyPrice,
        "sell_price": sellPrice,
        "date":
            "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
      };
}

class LivePrice {
  LivePrice({
    required this.currencyId,
    required this.price,
    required this.date,
  });

  final int? currencyId;
  final double? price;
  final DateTime? date;

  factory LivePrice.fromJson(Map<String, dynamic> json) {
    return LivePrice(
      currencyId: json["currency_id"],
      price: json["price"],
      date: DateTime.tryParse(json["date"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "currency_id": currencyId,
        "price": price,
        "date":
            "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
      };
}
