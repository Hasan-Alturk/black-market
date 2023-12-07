class Gold {
  Gold({
    required this.id,
    required this.icon,
    required this.name,
    required this.karat,
    required this.sort,
    this.createdAt,
    required this.updatedAt,
    required this.price,
  });
   final int id;
   final String icon;
   final String name;
   final String karat;
   final int sort;
   final String? createdAt;
   final String updatedAt;
   final Price price;

  static List<Gold> goldList(List data) =>
      data.map((gold) => Gold.fromJson(gold)).toList();
  factory Gold.fromJson(Map<String, dynamic> json) => Gold(
        id: json['id'],
        icon: json['icon'],
        name: json['name'],
        karat: json['karat'],
        sort: json['sort'],
        createdAt: json['createdAt'],
        updatedAt: json['updated_at'],
        price: Price.fromJson(json['price']),
      );

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['icon'] = icon;
    data['name'] = name;
    data['karat'] = karat;
    data['sort'] = sort;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['price'] = price.toJson();
    return data;
  }
}

class Price {
  Price({
    required this.id,
    required this.goldId,
    required this.currencyId,
    required this.date,
    required this.hour,
    required this.price,
    required this.buyPrice,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int goldId;
  late final int currencyId;
  late final String date;
  late final int hour;
  late final num price;
  late final num buyPrice;
  late final String createdAt;
  late final String updatedAt;

  Price.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    goldId = json['gold_id'];
    currencyId = json['currency_id'];
    date = json['date'];
    hour = json['hour'];
    price = json['price'];
    buyPrice = json['buy_price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['gold_id'] = goldId;
    data['currency_id'] = currencyId;
    data['date'] = date;
    data['hour'] = hour;
    data['price'] = price;
    data['buy_price'] = buyPrice;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
