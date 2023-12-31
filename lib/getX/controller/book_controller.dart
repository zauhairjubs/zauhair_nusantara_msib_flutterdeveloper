import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

import 'package:zauhair_nusantara_msib_flutterdeveloper/getX/controller/login_controller.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/models/books.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/theme.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/widgets/navbar.dart';

class BookController extends GetxController {
  var book = Rx<Book?>(null);
  var isLoading = RxBool(false);

  final Dio _dio = Dio();
  final LoginController _loginController = LoginController();

  Future<void> fetchData() async {
    try {
      final token = await _loginController.getTokenFromStorage();
      final response = await _dio.get(
        'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/books/',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      final responseData = response.data;
      final bookData = Book.fromJson(Map<String, dynamic>.from(responseData));
      book(bookData);
    } catch (error) {
      print('Gagal mendapatkan atau menggunakan respons: $error');
    } finally {
      isLoading(false);
    }
  }

  Future<void> deleteBook(int book_id) async {
    try {
      final token = await _loginController.getTokenFromStorage();
      final response = await _dio.delete(
        'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/books/$book_id',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        Get.snackbar("Berhasil Menghapus Buku", "");
      }
    } catch (e) {
      print("Error : $e");
    }
  }

  Future<void> confirmDelete(int book_id) async {
    Get.defaultDialog(
        buttonColor: error,
        titlePadding: const EdgeInsets.all(16),
        contentPadding: const EdgeInsets.all(20),
        confirmTextColor: whiteColor,
        cancelTextColor: blackColor,
        title: 'Konfirmasi Hapus',
        middleText: 'Apakah Anda yakin ingin menghapus buku ini?',
        textConfirm: 'Hapus',
        textCancel: 'Batal',
        onConfirm: () async {
          await deleteBook(book_id);
          Get.offAll(() => const Navbar());
        });
  }
}
