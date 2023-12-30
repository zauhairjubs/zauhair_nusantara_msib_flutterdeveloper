import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/getX/controller/book_controller.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/getX/controller/login_controller.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/models/books.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/pages/home_page.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/pages/login_page.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/widgets/navbar.dart';

class AddBookController extends GetxController {
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

  late GlobalKey<FormState> formKeyAddbook =
      GlobalKey<FormState>(debugLabel: '_addBook');
  final Dio _dio = Dio();

  //input semuanya harus diisi, tidak boleh null, dan published = Datetime, pages = int

  Future<void> _performAdd() async {
    try {
      final token = await _loginController.getTokenFromStorage();

      final response = await _dio.post(
          'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/books/add',
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
        Get.snackbar("Buku berhasil ditambahkan", "");
        Get.off(() => const Navbar());
      } else {
        Get.snackbar("Buku gagal ditambahkan", "Cobalah dalam beberapa saat");
      }
    } catch (e) {
      print("Error : $e");
    }
  }

  Future<void> add() async {
    if (formKeyAddbook.currentState!.validate()) {
      _performAdd();
    }
  }
}
