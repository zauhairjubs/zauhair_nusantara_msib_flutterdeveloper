import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/getX/controller/login_controller.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/widgets/navbar.dart';

class EditBookController extends GetxController {
  final isbnController = TextEditingController();
  final titleController = TextEditingController();
  final subtitleController = TextEditingController();
  final authorController = TextEditingController();
  final publishedController = TextEditingController();
  final publisherController = TextEditingController();
  final pagesController = TextEditingController();
  final descController = TextEditingController();
  final webController = TextEditingController();

  final LoginController _loginController = LoginController();

  late GlobalKey<FormState> formKeyEditBook =
      GlobalKey<FormState>(debugLabel: '_addBook');
  final Dio _dio = Dio();

  //input semuanya harus diisi, tidak boleh null, dan published = Datetime, pages = int

  Future<void> _performEdit(int id) async {
    try {
      final token = await _loginController.getTokenFromStorage();

      final response = await _dio.put(
          'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/books/$id/edit',
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ),
          data: {
            'isbn': isbnController.text,
            'title': titleController.text,
            'subtitle': subtitleController.text,
            'author': authorController.text,
            'published': publishedController.text,
            'publisher': publisherController.text,
            'pages': pagesController.text,
            'description': descController.text,
            'website': webController.text
          });

      if (response.statusCode == 200) {
        Get.snackbar("Buku Berhasil di edit", "");
        Get.off(() => const Navbar());
      }
    } catch (e) {
      print("Error : $e");
    }
  }

  Future<void> edit(int book_id) async {
    if (formKeyEditBook.currentState!.validate()) {
      _performEdit(book_id);
    }
  }

  Future<void> fetchBookbyID(int book_id) async {
    try {
      final token = await _loginController.getTokenFromStorage();
      final response = await _dio.get(
        'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/books/$book_id',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      final responseData = response.data;

      // Set nilai kontrol formulir dengan data yang diterima
      isbnController.text = responseData['isbn'];
      titleController.text = responseData['title'];
      subtitleController.text = responseData['subtitle'];
      authorController.text = responseData['author'];
      publishedController.text = responseData['published'];
      publisherController.text = responseData['publisher'];
      pagesController.text = responseData['pages'].toString();
      descController.text = responseData['description'];
      webController.text = responseData['website'];
    } catch (error) {
      print('Gagal mendapatkan atau menggunakan respons: $error');
    }
  }
}
