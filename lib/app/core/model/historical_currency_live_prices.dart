class HistoricalCurrencyLivePrices {
  HistoricalCurrencyLivePrices({
    required this.livePrices,
  });

  final Map<String, List<LivePrices>> livePrices;

  factory HistoricalCurrencyLivePrices.fromJson(Map<String, dynamic> json) {
    return HistoricalCurrencyLivePrices(
      livePrices: Map.from(json["live_prices"]).map((k, v) => MapEntry<String,
              List<LivePrices>>(
          k,
          v == null
              ? []
              : List<LivePrices>.from(v!.map((x) => LivePrices.fromJson(x))))),
    );
  }

  Map<String, dynamic> toJson() => {
        "live_prices": Map.from(livePrices).map((k, v) =>
            MapEntry<String, dynamic>(k, v.map((x) => x?.toJson()).toList())),
      };
}

class LivePrices {
  LivePrices({
    required this.currencyId,
    required this.price,
    required this.date,
    required this.hour,
  });

  final int? currencyId;
  final dynamic price;
  final String date;
  final int? hour;

  factory LivePrices.fromJson(Map<String, dynamic> json) {
    return LivePrices(
      currencyId: json["currency_id"],
      price: json["price"],
      date: json["date"],
      hour: json["hour"],
    );
  }

  Map<String, dynamic> toJson() => {
        "currency_id": currencyId,
        "price": price,
        "date": date,
        "hour": hour,
      };
}
