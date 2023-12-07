import 'package:black_market/app/core/repo/notification_repo.dart';
import 'package:black_market/app/modules/notification/html_article/html_article_controller.dart';
import 'package:get/get.dart';

class HtmlArticleBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
        HtmlArticleController(notificationRepo: Get.find<NotificationRepo>()));
  }
}
