class CurrencyInBank {
  final int currencyId;
  final String currencyIcon;
  final String currencyName;
  final String currencyCode;
  final int bankId;
  final String bankIcon;
  final String bankName;

  final num sellPrice;
  final num buyPrice;

  final String createdAt;
  final String updatedAt;

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
      required this.updatedAt});

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
