class Currency {
  late String currencyName;
  late String currencyIcon;
  late int currencyId;
  late num sellPrice;
  late num buyPrice;

  Currency({
    required this.currencyId,
    required this.currencyIcon,
    required this.buyPrice,
    required this.currencyName,
    required this.sellPrice,
  });
}
