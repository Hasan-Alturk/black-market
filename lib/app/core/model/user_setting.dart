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


// class UserSetting {
//   UserSetting({
//     required this.id,
//     required this.roleId,
//     required this.name,
//     required this.email,
//     required this.avatar,
//     this.emailVerifiedAt,
//     this.token,
//     this.provider,
//     required this.settings,
//     this.otp,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.savings,
//     required this.favorites,
//   });
//   late final int id;
//   late final int roleId;
//   late final String name;
//   late final String email;
//   late final String avatar;
//   late final dynamic emailVerifiedAt;
//   late final dynamic token;
//   late final dynamic provider;
//   late final List<dynamic> settings;
//   late final dynamic otp;
//   late final String createdAt;
//   late final String updatedAt;
//   late final Savings savings;
//   late final List<dynamic> favorites;

//   UserSetting.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     roleId = json['role_id'];
//     name = json['name'];
//     email = json['email'];
//     avatar = json['avatar'];
//     emailVerifiedAt = json['email_verified_at'];
//     token = json['token'];
//     provider = json['avatar'];
//     settings = List.castFrom<dynamic, dynamic>(json['settings']);
//     otp = json['otp'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     savings = Savings.fromJson(json['savings']);
//     favorites = List.castFrom<dynamic, dynamic>(json['favorites']);
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['role_id'] = roleId;
//     data['name'] = name;
//     data['email'] = email;
//     data['avatar'] = avatar;
//     data['email_verified_at'] = emailVerifiedAt;
//     data['token'] = token;
//     data['provider'] = provider;
//     data['settings'] = settings;
//     data['otp'] = otp;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     data['savings'] = savings.toJson();
//     data['favorites'] = favorites;
//     return data;
//   }
// }

// class Savings {
//   Savings({
//     required this.currencyId,
//   });
//   late final List<ItemSetting> currencyId;

//   Savings.fromJson(Map<String, dynamic> json) {
//     currencyId = List.from(json['currenyId'])
//         .map((e) => ItemSetting.fromJson(e))
//         .toList();
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['currencyId'] = currencyId.map((e) => e.toJson()).toList();
//     return data;
//   }
// }

// class ItemSetting {
//   ItemSetting({
//     required this.id,
//     required this.userId,
//     required this.currencyId,
//     required this.purchaseDate,
//     required this.amount,
//     required this.conversionWhenSaved,
//     required this.type,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.conversion,
//   });
//   late final int id;
//   late final int userId;
//   late final int currencyId;
//   late final String purchaseDate;
//   late final int amount;
//   late final int conversionWhenSaved;
//   late final String type;
//   late final String createdAt;
//   late final String updatedAt;
//   late final int conversion;

//   ItemSetting.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     currencyId = json['currency_id'];
//     purchaseDate = json['purchase_date'];
//     amount = json['amount'];
//     conversionWhenSaved = json['conversion_when_saved'];
//     type = json['type'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     conversion = json['conversion'];
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['user_id'] = userId;
//     data['currency_id'] = currencyId;
//     data['purchase_date'] = purchaseDate;
//     data['amount'] = amount;
//     data['conversion_when_saved'] = conversionWhenSaved;
//     data['type'] = type;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     data['conversion'] = conversion;
//     return data;
//   }
// }

