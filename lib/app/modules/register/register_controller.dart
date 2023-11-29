import 'package:black_market/app/core/repo/auth_repo.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final AuthRepo authRepo;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  bool isLoading = false;

  RegisterController({required this.authRepo});

  Future<void> register() async {
    try {
      isLoading = true;
      update(["ElevatedButton"]);
      //   User user =
      await authRepo.register(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
          passwordConfirmation: passwordConfirmationController.text);
      isLoading = false;
      update(["ElevatedButton"]);
      // await storageService.saveUser(user);
      Get.offAllNamed("/main_home");
    } on ExceptionHandler catch (e) {
      print(e);
      isLoading = false;
      update(["ElevatedButton"]);
    }
  }
}
