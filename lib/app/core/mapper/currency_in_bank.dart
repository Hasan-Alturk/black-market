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
      this.blackMarketBuyPrice , required this.bankSort});

  // static List<CurrencyInBank> currencyInBankList(List data) => data
  //     .map((currencyInBank) => CurrencyInBank.fromJson(currencyInBank))
  //     .toList();
  // factory CurrencyInBank.fromJson(Map<String, dynamic> json) => CurrencyInBank(
  //       currencyId: json['id'],
  //       currencyIcon: json['icon'],
  //       currencyName: json['name'],
  //       currencyCode: json['code'],
  //       bankId: json['bank_id'],
  //       bankIcon: json['icon'],
  //       bankName: json['name'],
  //       sellPrice: json['sell_price'],
  //       buyPrice: json['buy_price'],
  //       createdAt: json['createdAt'],
  //       updatedAt: json['updated_at'],
  //     );

  // Map<String, dynamic> toJson() {
  //   final data = <String, dynamic>{};
  //   data['id'] = currencyId;
  //   data['icon'] = currencyIcon;
  //   data['name'] = currencyName;
  //   data['code'] = currencyCode;
  //   data['bank_id'] = bankId;
  //   data['sell_price'] = sellPrice;
  //   data['buy_price'] = buyPrice;
  //   data['created_at'] = createdAt;
  //   data['updated_at'] = updatedAt;
  //   return data;
  // }
}
