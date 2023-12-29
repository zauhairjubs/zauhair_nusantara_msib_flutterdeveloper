import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/getX/controller/login_controller.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/pages/login_page.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/theme.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/widgets/navbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(LoginController());

  String initialRoute;
  if (await LoginController().checkTokenOnStart() == true) {
    initialRoute = '/home';
  } else {
    initialRoute = '/';
  }

  runApp(
    GetMaterialApp(
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      getPages: [
        GetPage(name: '/', page: () => const LoginPage()),
        GetPage(name: '/home', page: () => const Navbar()),
      ],
    ),
  );
}
