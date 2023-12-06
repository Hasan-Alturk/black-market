class Articles {
  Articles({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
  });
  late final int currentPage;
  late final List<DataArticles> data;
  late final String firstPageUrl;
  late final int from;
  late final String nextPageUrl;
  late final String path;
  late final int perPage;
  late final dynamic prevPageUrl;
  late final int to;

  Articles.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    data =
        List.from(json['data']).map((e) => DataArticles.fromJson(e)).toList();
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['data'] = data;
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    return data;
  }
}

class DataArticles {
  DataArticles({
    required this.id,
    required this.thumbnail,
    required this.banner,
    required this.title,
    required this.shortDescription,
    required this.createdAt,
  });
  late final int id;
  late final String thumbnail;
  late final String banner;
  late final String title;
  late final String shortDescription;
  late final String createdAt;

  DataArticles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    thumbnail = json['thumbnail'];
    banner = json['banner'];
    title = json['title'];
    shortDescription = json['short_description'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['thumbnail'] = thumbnail;
    data['banner'] = banner;
    data['title'] = title;
    data['short_description'] = shortDescription;
    data['created_at'] = createdAt;
    return data;
  }
}
