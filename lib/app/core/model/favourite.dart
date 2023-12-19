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
    final data = <String, dynamic>{};
    data['user_id'] = userId;
    data['currency_id'] = currencyId;
    data['bank_id'] = bankId;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}