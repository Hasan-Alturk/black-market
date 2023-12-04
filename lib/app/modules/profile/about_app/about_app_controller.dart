import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AboutAppController extends GetxController {
  String text = "";

  @override
  void onInit() {
    getTextAboutApp();

    super.onInit();
  }

  getTextAboutApp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? aboutText = prefs.getString('aboutText');
    text = aboutText!;
  }
}
