import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/getX/controller/login_controller.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/models/user.dart';

class UserController extends GetxController {
  final Dio _dio = Dio();
  final LoginController _loginController = LoginController();

  Rx<User> user = User(
          id: 0,
          name: '',
          email: '',
          emailVerifiedAt: DateTime.now(),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now())
      .obs;

  Future<void> getUser() async {
    try {
      final token = await _loginController.getTokenFromStorage();
      final response = await _dio.get(
        "https://book-crud-service-6dmqxfovfq-et.a.run.app/api/user",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        final userData = User.fromJson(response.data);
        user.value = userData;
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
