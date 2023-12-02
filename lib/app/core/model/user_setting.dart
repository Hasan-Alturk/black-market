class UserSetting {
  UserSetting({
    required this.id,
    required this.roleId,
    required this.name,
    required this.email,
    required this.avatar,
    this.emailVerifiedAt,
    this.token,
    this.provider,
    required this.settings,
    this.otp,
    required this.createdAt,
    required this.updatedAt,
    required this.savings,
    required this.favorites,
  });
  final int id;
  final int roleId;
  final String name;
  final String email;
  final String avatar;
  final dynamic emailVerifiedAt;
  final dynamic token;
  final dynamic provider;
  final List<dynamic> settings;
  final dynamic otp;
  final String createdAt;
  final String updatedAt;
  final Savings? savings;
  final List<dynamic> favorites;

  factory UserSetting.fromJson(Map<String, dynamic> json) => UserSetting(
        id: json['id'],
        roleId: json['role_id'],
        name: json['name'],
        email: json['email'],
        avatar: json['avatar'],
        emailVerifiedAt: ['email_verified_at'],
        token: ['token'],
        provider: ['provider'],
        settings: json['settings'],
        otp: ['otp'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        favorites: json['favorites'],
        savings: null,
      );

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['role_id'] = roleId;
    data['name'] = name;
    data['email'] = email;
    data['avatar'] = avatar;
    data['email_verified_at'] = emailVerifiedAt;
    data['token'] = token;
    data['provider'] = provider;
    data['settings'] = settings;
    data['otp'] = otp;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['savings'] = savings;
    data['favorites'] = favorites;
    return data;
  }
}

class Savings {
  // Map<String, List<SavingItem>> currencies;

  // Savings({
  //   required this.currencies,
  // });

  // factory Savings.fromJson(Map<String, dynamic> json) {

  //   Map<String, dynamic> currenciesJson = json['21'];
  //   List<SavingItem> savingItems = List<SavingItem>.from(
  //     currenciesJson.map(
  //       (key, value) => MapEntry(
  //         key,
  //         SavingItem.fromJson(value),
  //       ),
  //     ) as Iterable,
  //   );

  //   return Savings(
  //     currencies: {'21': savingItems},
  //   );
  // }
}

class SavingItem {
  SavingItem({
    required this.id,
    required this.userId,
    required this.currencyId,
    required this.purchaseDate,
    required this.amount,
    required this.conversionWhenSaved,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    required this.conversion,
  });
  final int id;
  final int userId;
  final int currencyId;
  final String purchaseDate;
  final int amount;
  final int conversionWhenSaved;
  final String type;
  final String createdAt;
  final String updatedAt;
  final int conversion;

  factory SavingItem.fromJson(Map<String, dynamic> json) => SavingItem(
        id: json['id'],
        userId: json['user_id'],
        currencyId: json['currency_id'],
        purchaseDate: json['purchase_date'],
        amount: json['amount'],
        conversionWhenSaved: json['conversion_when_saved'],
        type: json['type'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        conversion: json['conversion'],
      );

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['currency_id'] = currencyId;
    data['purchase_date'] = purchaseDate;
    data['amount'] = amount;
    data['conversion_when_saved'] = conversionWhenSaved;
    data['type'] = type;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['conversion'] = conversion;
    return data;
  }
}
