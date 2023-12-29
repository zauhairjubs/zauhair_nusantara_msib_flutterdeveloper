import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/pages/login_page.dart';

class RegistController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final RxBool passToggle = false.obs;
  final RxBool confirmPassToggle = false.obs;
  final RxBool checkboxToggle = false.obs;
  late GlobalKey<FormState> formKeyRegister =
      GlobalKey<FormState>(debugLabel: '_register');
  final Dio _dio = Dio();

  void togglePasswordVisibility() {
    passToggle.value = !passToggle.value;
  }

  void toggleConfirmPasswordVisibility() {
    confirmPassToggle.value = !confirmPassToggle.value;
  }

  void toggleRememberMe() {
    checkboxToggle.value = !checkboxToggle.value;
  }

  Future<void> _performRegister() async {
    try {
      final response = await _dio.post(
          'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/register',
          data: {
            'name': nameController.text,
            'email': emailController.text,
            'password': passwordController.text,
            'password_confirmation': confirmPasswordController.text
          });
      if (response.statusCode == 200) {
        Get.snackbar("Akun berhasil dibuat",
            "sekarang lakukan login dengan akun yang telah terdaftar");
      }
    } catch (e) {
      print("Error : $e");
    }
  }

  Future<void> register() async {
    if (formKeyRegister.currentState!.validate()) {
      _performRegister();
      Get.off(() => const LoginPage());
    }
  }
}
