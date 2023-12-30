// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/getX/controller/login_controller.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/getX/controller/user_controller.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/theme.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final UserController userController = Get.put(UserController());
    final LoginController _loginController = Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(
        title: Text("add page"),
      ),
      body: SingleChildScrollView(
        child: Column(),
      ),
    );
  }
}
