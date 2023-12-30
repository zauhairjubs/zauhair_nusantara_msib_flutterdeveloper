import 'package:get/get.dart';
import 'package:dio/dio.dart';

import 'package:zauhair_nusantara_msib_flutterdeveloper/getX/controller/login_controller.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/models/books.dart';

class BookController extends GetxController {
  var book = Rx<Book?>(null);
  final Dio _dio = Dio();
  final LoginController _loginController = LoginController();

  @override
  void onInit() {
    super.onInit();
    fetchData(); // Panggil fetchData pada saat controller diinisialisasi.
  }

  Future<void> fetchData() async {
    try {
      final token = await _loginController.getTokenFromStorage();
      final response = await _dio.get(
        'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/books',
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
    }
  }
}
