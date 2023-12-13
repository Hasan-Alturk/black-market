class HistoricalCurrencyBlackPrices {
  HistoricalCurrencyBlackPrices({
    required this.blackMarketPrices,
  });

  final Map<String, List<BlackMarketPrice>> blackMarketPrices;

  factory HistoricalCurrencyBlackPrices.fromJson(Map<String, dynamic> json) {
    return HistoricalCurrencyBlackPrices(
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
  final dynamic buyPrice;
  final dynamic sellPrice;
  final String? date;

  factory BlackMarketPrice.fromJson(Map<String, dynamic> json) {
    return BlackMarketPrice(
      currencyId: json["currency_id"],
      buyPrice: json["buy_price"],
      sellPrice: json["sell_price"],
      date: json["date"],
    );
  }

  Map<String, dynamic> toJson() => {
        "currency_id": currencyId,
        "buy_price": buyPrice,
        "sell_price": sellPrice,
        "date": date,
      };
}
