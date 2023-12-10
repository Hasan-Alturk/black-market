class CurrencyInHome {
  late String currencyName;
  late String currencyIcon;
  late int currencyId;
  late num blackMarketBuyPrice;
  late String currencyCode;
  late int lastUpdate;
  late num livePrice;

  CurrencyInHome(
      {required this.currencyId,
      required this.currencyName,
      required this.currencyIcon,
      required this.currencyCode,
      required this.livePrice,
      required this.blackMarketBuyPrice,
      required this.lastUpdate});
}
