class HtmlArticle {
  HtmlArticle({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
  });
  late final int currentPage;
  late final List<HtmlArticleData> data;
  late final String firstPageUrl;
  late final int from;
  late final dynamic nextPageUrl;
  late final String path;
  late final int perPage;
  late final dynamic prevPageUrl;
  late final int to;

  HtmlArticle.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    data = List.from(json['data'])
        .map((e) => HtmlArticleData.fromJson(e))
        .toList();
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = ['prev_page_url'];
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

class HtmlArticleData {
  HtmlArticleData({
    required this.id,
    required this.thumbnail,
    required this.banner,
    required this.title,
    required this.shortDescription,
    required this.description,
    required this.draft,
    required this.createdAt,
    required this.updatedAt,
    required this.comments,
    required this.readsCount,
  });
  late final int id;
  late final String thumbnail;
  late final String banner;
  late final String title;
  late final String shortDescription;
  late final String description;
  late final int draft;
  late final String createdAt;
  late final String updatedAt;
  late final List<dynamic> comments;
  late final int readsCount;

  HtmlArticleData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    thumbnail = json['thumbnail'];
    banner = json['banner'];
    title = json['title'];
    shortDescription = json['short_description'];
    description = json['description'];
    draft = json['draft'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    comments = List.castFrom<dynamic, dynamic>(json['comments']);
    readsCount = json['reads_count'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['thumbnail'] = thumbnail;
    data['banner'] = banner;
    data['title'] = title;
    data['short_description'] = shortDescription;
    data['description'] = description;
    data['draft'] = draft;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['comments'] = comments;
    data['reads_count'] = readsCount;
    return data;
  }
}
