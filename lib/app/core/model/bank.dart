class Bank {
  int? id;
  dynamic banner;
  String? icon;
  String? name;
  String? hotline;
  int? calculateBasedOnBank;
  int? sort;
  int? showNetworkImage;
  int? isVirtual;
  String? shortname;
  int? active;
  dynamic createdAt;
  dynamic updatedAt;
  List<Branch>? branches;

  Bank({
    required this.id,
    required this.banner,
    required this.icon,
    required this.name,
    required this.hotline,
    required this.calculateBasedOnBank,
    required this.sort,
    required this.showNetworkImage,
    required this.isVirtual,
    required this.shortname,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.branches,
  });
  static List<Bank> bankList(List data) =>
      data.map((bank) => Bank.fromJson(bank)).toList();

  Bank.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    banner = json["banner"];

    icon = json['icon'];
    name = json['name'];
    hotline = json['hotline'];
    sort = json['sort'];
    showNetworkImage = json['show_network_image'];
    isVirtual = json['is_virtual'];
    shortname = json['shortname'];
    active = json['active'];
    calculateBasedOnBank = json['calculate_based_on_bank'];
    createdAt = json['createdAt'];
    updatedAt = json['updated_at'];
    if (json['branches'] != null) {
      branches = <Branch>[];
      json['branches'].forEach((v) {
        branches!.add(Branch.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['icon'] = icon;
    data['name'] = name;
    data['banner'] = banner;
    data['sort'] = sort;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['hotline'] = hotline;
    data['calculate_based_on_bank'] = calculateBasedOnBank;
    data['show_network_image'] = showNetworkImage;
    data['is_virtual'] = isVirtual;
    data['shortname'] = shortname;
    data['active'] = active;
    if (branches != null) {
      data['branches'] = branches!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Branch {
  int? id;
  int? bankId;
  String? name;
  String? address;
  dynamic createdAt;
  dynamic updatedAt;

  Branch({
    required this.id,
    required this.bankId,
    required this.name,
    required this.address,
    required this.createdAt,
    required this.updatedAt,
  });
  Branch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bankId = json['bank_id'];
    name = json['name'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['bank_id'] = bankId;
    data['name'] = name;
    data['address'] = address;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
