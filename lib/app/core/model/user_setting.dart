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
    this.savings,
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
  final dynamic savings;
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
        otp: json['otp'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        savings: json['savings'],
        favorites: json['favorites'],
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

