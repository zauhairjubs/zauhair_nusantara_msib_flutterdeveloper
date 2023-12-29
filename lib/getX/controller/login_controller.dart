import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/pages/login_page.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/theme.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/widgets/navbar.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final RxBool passToggle = false.obs;
  final RxBool checkboxToggle = false.obs;
  final Dio _dio = Dio();
  final formKey = GlobalKey<FormState>();
  RxBool isLoggedIn = false.obs;

  void togglePasswordVisibility() {
    passToggle.value = !passToggle.value;
  }

  void toggleRememberMe() {
    checkboxToggle.value = !checkboxToggle.value;
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      try {
        final token = await _performLogin();
        await _saveTokenToStorage(token);

        Get.to(() => const Navbar());
      } catch (error) {
        // Tangani kesalahan
        print('Error: $error');
      }
    }
  }

  Future<String> _performLogin() async {
    // Lakukan login dan dapatkan token
    final response = await _dio.post(
        'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/login',
        data: {
          'email': emailController.text,
          'password': passwordController.text,
        });

    // Tangani respons sesuai kebutuhan
    final token = response.data['token'];
    return token;
  }

  Future<void> _saveTokenToStorage(String token) async {
    // Simpan token ke SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  Future<String?> getTokenFromStorage() async {
    // Ambil token dari SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<bool> checkTokenOnStart() async {
    final token = await getTokenFromStorage();
    if (token != null) {
      isLoggedIn.value = true;
    }
    return isLoggedIn.value;
  }

  Future<void> logout() async {
    await clearTokenFromStorage();
    isLoggedIn.value = false;
    Get.offAll(() => const LoginPage());
  }

  Future<void> clearTokenFromStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }

  Future<void> confirmLogout() async {
    // Tampilkan dialog konfirmasi
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(20),
      confirmTextColor: whiteColor,
      title: 'Konfirmasi Logout',
      middleText: 'Apakah Anda yakin ingin logout?',
      textConfirm: 'Ya',
      textCancel: 'Batal',
      onConfirm: () async {
        await logout();
      },
    );
  }
}
