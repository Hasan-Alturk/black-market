class IngotCompany {
  int? id;
  int? baseGoldItem;
  String? icon;
  String? name;
  String? karat;
  num? weight;
  int? sort;
  String? createdAt;
  String? updatedAt;
  int? companyId;
  num? workManShip;
  num? tax;
  num? returnFees;
  num? sellPrice;
  num? buyPrice;
  num? totalPriceIncludingtaxAndWorkmanship;
  num? difference;

  IngotCompany(
      {this.id,
      this.baseGoldItem,
      this.icon,
      this.name,
      this.karat,
      this.weight,
      this.sort,
      this.createdAt,
      this.updatedAt,
      this.companyId,
      this.workManShip,
      this.tax,
      this.returnFees,
      this.sellPrice,
      this.buyPrice,
      this.difference,
      this.totalPriceIncludingtaxAndWorkmanship});
}
