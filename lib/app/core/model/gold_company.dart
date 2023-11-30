class GoldCompany {
  GoldCompany({
    required this.id,
    required this.image,
    required this.name,
    required this.key,
    required this.active,
    this.createdAt,
    required this.updatedAt,
  });
  final int id;
  final String image;
  final String name;
  final String key;
  final int active;
  final String? createdAt;
  final String updatedAt;

  static List<GoldCompany> goldCompanyList(List data) =>
      data.map((goldCompany) => GoldCompany.fromJson(goldCompany)).toList();
  factory GoldCompany.fromJson(Map<String, dynamic> json) => GoldCompany(
        id: json['id'],
        image: json['image'],
        name: json['name'],
        key: json['key'],
        active: json['active'],
        createdAt: json['createdAt'],
        updatedAt: json['updated_at'],
      );

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['key'] = key;
    data['active'] = active;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
