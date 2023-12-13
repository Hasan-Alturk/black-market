class HistoricalCurrencyLivePrices {
  HistoricalCurrencyLivePrices({
    required this.livePrices,
  });

  final Map<String, List<LivePrice>> livePrices;

  factory HistoricalCurrencyLivePrices.fromJson(Map<String, dynamic> json) {
    return HistoricalCurrencyLivePrices(
      livePrices: Map.from(json["live_prices"]).map((k, v) => MapEntry<String,
              List<LivePrice>>(
          k,
          v == null
              ? []
              : List<LivePrice>.from(v!.map((x) => LivePrice.fromJson(x))))),
    );
  }

    // static List<LatestCurrency> latestCurrencyList(List data) =>
    //   data.map((currency) => LatestCurrency.fromJson(currency)).toList();

  Map<String, dynamic> toJson() => {
        "live_prices": Map.from(livePrices).map((k, v) =>
            MapEntry<String, dynamic>(k, v.map((x) => x?.toJson()).toList())),
      };
}

class LivePrice {
  LivePrice({
    required this.currencyId,
    required this.price,
    required this.date,
  });

  final int? currencyId;
  final dynamic price;
  final String date;

  factory LivePrice.fromJson(Map<String, dynamic> json) {
    return LivePrice(
      currencyId: json["currency_id"],
      price: json["price"],
      date: json["date"],
    );
  }

  Map<String, dynamic> toJson() => {
        "currency_id": currencyId,
        "price": price,
        "date": date,
      };
}
