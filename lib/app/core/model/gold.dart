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
  late final int id;
  late final String icon;
  late final String name;
  late final String karat;
  late final int sort;
  late final String? createdAt;
  late final String updatedAt;
  late final Price price;

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
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['icon'] = icon;
    _data['name'] = name;
    _data['karat'] = karat;
    _data['sort'] = sort;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['price'] = price.toJson();
    return _data;
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
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['gold_id'] = goldId;
    _data['currency_id'] = currencyId;
    _data['date'] = date;
    _data['hour'] = hour;
    _data['price'] = price;
    _data['buy_price'] = buyPrice;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
