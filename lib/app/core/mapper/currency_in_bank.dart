class CurrencyInBank {
  late int currencyId;
  late String currencyIcon;
  late String currencyName;
  late String currencyCode;
  late int bankId;
  late String bankIcon;
  late String bankName;
  late num sellPrice;
  late num buyPrice;
  late String createdAt;
  late String updatedAt;
  late dynamic blackMarketBuyPrice;
  late String lastUpdate;
  late int bankSort;

  CurrencyInBank(
      {required this.currencyId,
      required this.currencyIcon,
      required this.currencyName,
      required this.currencyCode,
      required this.bankId,
      required this.bankIcon,
      required this.bankName,
      required this.sellPrice,
      required this.buyPrice,
      required this.createdAt,
      required this.updatedAt,
      required this.lastUpdate,
      this.blackMarketBuyPrice,
      required this.bankSort});

  static List<CurrencyInBank> currencyInBankList(List data) => data
      .map((currencyInBank) => CurrencyInBank.fromJson(currencyInBank))
      .toList();
  factory CurrencyInBank.fromJson(Map<String, dynamic> json) => CurrencyInBank(
        currencyId: json['currency_id'],
        currencyIcon: json['currency_icon'],
        currencyName: json['currency_name'],
        currencyCode: json['currency_code'],
        bankId: json['bank_id'],
        bankIcon: json['bank_icon'],
        bankName: json['bank_name'],
        sellPrice: json['sell_price'],
        buyPrice: json['buy_price'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        lastUpdate: json['last_update'],
        bankSort: json['bank_sort'],
        blackMarketBuyPrice: json['black_market_buy_price'],
      );

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['currency_id'] = currencyId;
    data['currency_icon'] = currencyIcon;
    data['currency_name'] = currencyName;
    data['currency_code'] = currencyCode;
    data['bank_id'] = bankId;
    data['bank_icon'] = bankIcon;
    data['bank_name'] = bankName;
    data['sell_price'] = sellPrice;
    data['buy_price'] = buyPrice;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['last_update'] = lastUpdate;
    data['bank_sort'] = bankSort;
    data['black_market_buy_price'] = blackMarketBuyPrice;
    return data;
  }
}
