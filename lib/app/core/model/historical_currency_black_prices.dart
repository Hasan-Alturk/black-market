class HistoricalCurrencyBlackPrices {
  HistoricalCurrencyBlackPrices({
    required this.blackPrices,
  });

  final Map<String, List<BlackPrices>> blackPrices;

  factory HistoricalCurrencyBlackPrices.fromJson(Map<String, dynamic> json) {
    return HistoricalCurrencyBlackPrices(
      blackPrices: Map.from(json["black_market_prices"]).map((k, v) =>
          MapEntry<String, List<BlackPrices>>(
              k,
              v == null
                  ? []
                  : List<BlackPrices>.from(
                      v!.map((x) => BlackPrices.fromJson(x))))),
    );
  }

  Map<String, dynamic> toJson() => {
        "black_market_prices": Map.from(blackPrices).map((k, v) =>
            MapEntry<String, dynamic>(k, v.map((x) => x?.toJson()).toList())),
      };
}

class BlackPrices {
  BlackPrices({
    required this.currencyId,
    required this.buyPrice,
    required this.sellPrice,
    required this.date,
  });

  final int? currencyId;
  final dynamic buyPrice;
  final dynamic sellPrice;
  final String? date;

  factory BlackPrices.fromJson(Map<String, dynamic> json) {
    return BlackPrices(
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
