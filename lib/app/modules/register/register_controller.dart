import 'package:get/get.dart';

class RegisterController extends GetxController {
  Future<void> register() async {
    try {
      Get.offAllNamed("/home");
    } catch (e) {
      print(e);
    }

    ///storage.saveUser(user);
    // Get.to(Home());
  }
}
