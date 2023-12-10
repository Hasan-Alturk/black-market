class Favourite {
  Favourite({
    required this.userId,
    required this.currencyId,
    required this.bankId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });
  late final int userId;
  late final String currencyId;
  late final String bankId;
  late final String updatedAt;
  late final String createdAt;
  late final int id;
  
  Favourite.fromJson(Map<String, dynamic> json){
    userId = json['user_id'];
    currencyId = json['currency_id'];
    bankId = json['bank_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_id'] = userId;
    _data['currency_id'] = currencyId;
    _data['bank_id'] = bankId;
    _data['updated_at'] = updatedAt;
    _data['created_at'] = createdAt;
    _data['id'] = id;
    return _data;
  }
}