class Currency {
  late String currencyName;
  late String currencyIcon;
  late int currencyId;
  late num sellPrice;
  late num buyPrice;
  late num blackMarketBuyPrice;
  late String currencyCode;
  late int lastUpdate;

  Currency(
      {required this.currencyId,
      required this.currencyIcon,
      required this.buyPrice,
      required this.currencyName,
      required this.sellPrice,
      required this.currencyCode,
      required this.blackMarketBuyPrice,
      required this.lastUpdate});
}
