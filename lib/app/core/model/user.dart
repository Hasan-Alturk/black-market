class MainUser {
  final User user;
  final String accessToken;
  final String expiresAt;

  MainUser({
    required this.user,
    required this.accessToken,
    required this.expiresAt,
  });

  factory MainUser.fromJson(Map<String, dynamic> json) => MainUser(
        user: User.fromJson(json['user']),
        accessToken: json['access_token'],
        expiresAt: json['expires_at'],
      );

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user'] = user;
    data['access_token'] = accessToken;
    data['expires_at'] = expiresAt;
    return data;
  }
}

class User {
  User({
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

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        roleId: json['role_id'],
        name: json['name'],
        email: json['email'],
        avatar: json['avatar'],
        emailVerifiedAt: json['email_verified_at'],
        token: json['token'],
        provider: json['provider'],
        settings: json['settings'],
        otp: json['otp'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
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

    return data;
  }
}
