class Notifications {
  Notifications({
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
  late final List<DataNotifications> data;
  late final String firstPageUrl;
  late final int from;
  late final String nextPageUrl;
  late final String path;
  late final int perPage;
  late final dynamic prevPageUrl;
  late final int to;

  Notifications.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    data = List.from(json['data'])
        .map((e) => DataNotifications.fromJson(e))
        .toList();
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

class DataNotifications {
  DataNotifications({
    required this.id,
    required this.topic,
    required this.title,
    required this.body,
    this.scheduleAt,
    this.appId,
    required this.showToUsers,
    this.articleId,
    required this.createdAt,
    required this.updatedAt,
    required this.readsCount,
    required this.notificationDate,
  });
  late final int id;
  late final String topic;
  late final String title;
  late final String body;
  late final String? scheduleAt;
  late final dynamic appId;
  late final int showToUsers;
  late final dynamic articleId;
  late final String createdAt;
  late final String updatedAt;
  late final int readsCount;
  late final String notificationDate;

  DataNotifications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    topic = json['topic'];
    title = json['title'];
    body = json['body'];
    scheduleAt = json['schedule_at'];
    appId = json['app_id'];
    showToUsers = json['show_to_users'];
    articleId = json['article_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    readsCount = json['reads_count'];
    notificationDate = json['notification_date'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['topic'] = topic;
    data['title'] = title;
    data['body'] = body;
    data['schedule_at'] = scheduleAt;
    data['app_id'] = appId;
    data['show_to_users'] = showToUsers;
    data['article_id'] = articleId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['reads_count'] = readsCount;
    data['notification_date'] = notificationDate;
    return data;
  }
}
