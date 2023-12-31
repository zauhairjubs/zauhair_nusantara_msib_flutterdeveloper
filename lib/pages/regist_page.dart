// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/getX/controller/regist_controller.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/pages/login_page.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/theme.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late RegistController _registController;

  @override
  void initState() {
    super.initState();
    _registController = Get.put(RegistController());
    _registController.formKeyRegister = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparentColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: blackColor,
          onPressed: () => Get.off(() => LoginPage()),
          highlightColor: transparentColor,
          splashColor: transparentColor,
        ),
        title: Center(
          child: Text(
            'Daftar',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        actions: [
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.menu,
            color: transparentColor,
          )
        ],
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 25, left: 20, right: 20),
            child: Column(
              children: [
                Form(
                  key: _registController.formKeyRegister,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nama',
                          style: Theme.of(context).textTheme.bodyMedium),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _registController.nameController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          hintText: "Nama",
                          hintStyle: TextStyle(color: greyColor),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            borderSide: BorderSide(color: softGreyColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: blueColor)),
                          filled: true,
                          fillColor: greyLightColor,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Silahkan isi nama Anda';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      Text('Email',
                          style: Theme.of(context).textTheme.bodyMedium),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _registController.emailController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          hintText: "Email",
                          hintStyle: TextStyle(color: greyColor),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            borderSide: BorderSide(color: softGreyColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: blueColor)),
                          filled: true,
                          fillColor: greyLightColor,
                        ),
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return 'Silahkan isi email';
                          }
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(email)) {
                            return 'Silahkan gunakan email yang benar';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Kata Sandi',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _registController.passwordController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: !_registController.passToggle.value,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          hintText: "Kata Sandi",
                          hintStyle: TextStyle(color: greyColor),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            borderSide: BorderSide(color: softGreyColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: blueColor)),
                          filled: true,
                          fillColor: greyLightColor,
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                _registController.togglePasswordVisibility();
                              });
                            },
                            child: Icon(
                                _registController.passToggle.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: greyColor),
                          ),
                        ),
                        validator: (password) =>
                            password!.isEmpty ? 'Silahkan isi password' : null,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Konfirmasi Kata Sandi',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _registController.confirmPasswordController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: !_registController.confirmPassToggle.value,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          hintText: "Konfirmasi Kata Sandi",
                          hintStyle: TextStyle(color: greyColor),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            borderSide: BorderSide(color: softGreyColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: blueColor)),
                          filled: true,
                          fillColor: greyLightColor,
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                _registController
                                    .toggleConfirmPasswordVisibility();
                              });
                            },
                            child: Icon(
                                _registController.confirmPassToggle.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: greyColor),
                          ),
                        ),
                        validator: (password) => password!.isEmpty
                            ? 'Silahkan isi konfirmasi password'
                            : null,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(blueColor),
                    minimumSize: MaterialStateProperty.all(
                      Size(double.infinity, 48),
                    ),
                  ),
                  onPressed: () {
                    _registController.register();
                  },
                  child: Text(
                    'Daftar',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.w500,
                        color: whiteColor),
                  ),
                ),
                const SizedBox(height: 24),
                InkWell(
                  splashColor: transparentColor,
                  highlightColor: transparentColor,
                  onTap: () => Get.off(() => LoginPage()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sudah mempunyai akun?',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Masuk',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: darkBlueColor,
                            ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
