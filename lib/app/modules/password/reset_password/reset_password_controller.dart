import 'package:black_market/app/core/repo/auth_repo.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
    final AuthRepo authRepo;
  bool isLoading = false;

  ResetPasswordController({required this.authRepo});
  

  void goToNewPasswordSuccessfully() {
    Get.toNamed("/new_password_successfully");
  }

  Future<void> goToHmoe() async {
    try {
      Get.offAllNamed("/home");
    } catch (e) {
      print(e);
    }

    ///storage.saveUser(user);
    // Get.to(Home());
  }
}
