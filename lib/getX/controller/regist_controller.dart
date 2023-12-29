import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class RegistController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final RxBool passToggle = false.obs;
  final RxBool confirmPassToggle = false.obs;
  final RxBool checkboxToggle = false.obs;
  final formKey = GlobalKey<FormState>();
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
            'email': emailController.text,
            'password': passwordController.text,
            'password_confirmation': confirmPasswordController.text
          });
    } catch (e) {}
  }
}
