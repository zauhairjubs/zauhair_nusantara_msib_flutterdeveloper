import 'package:flutter/material.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/pages/login_page.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/pages/regis_page.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      theme: lightTheme,
      routes: {
        RegisterPage.routeName: (context) => const RegisterPage(),
      },
    );
  }
}
