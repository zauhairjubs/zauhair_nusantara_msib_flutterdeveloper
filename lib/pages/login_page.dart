// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/getX/controller/login_controller.dart';
import 'regist_page.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController _loginController;

  @override
  void initState() {
    super.initState();
    _loginController = Get.put(LoginController());
    _loginController.formKeyLogin = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparentColor,
        title: Center(
          child: Text(
            'Masuk',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: screenHeight * 0.036, fontWeight: FontWeight.w500),
          ),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: _loginController.formKeyLogin,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: screenHeight * 0.024),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _loginController.emailController,
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
                            return 'Silahkan gunakan email yang sesuai';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Kata Sandi',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: screenHeight * 0.024),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _loginController.passwordController,
                        obscureText: !_loginController.passToggle.value,
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
                                _loginController.togglePasswordVisibility();
                              });
                            },
                            child: Icon(
                                _loginController.passToggle.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: greyColor),
                          ),
                        ),
                        validator: (password) => password!.isEmpty
                            ? 'Silahkan isi kata sandi'
                            : null,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: _loginController.checkboxToggle.value,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _loginController.toggleRememberMe();
                            });
                          },
                          checkColor: whiteColor,
                          fillColor: MaterialStateProperty.all(Colors.blue),
                        ),
                        Text(
                          'Ingat Saya',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Text(
                      'Lupa password?',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: darkBlueColor),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                      Size(double.infinity, 48),
                    ),
                  ),
                  onPressed: () {
                    _loginController.login();
                  },
                  child: _loginController.isLoading.value
                      ? CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color?>(Colors.white),
                        )
                      : Text(
                          'Masuk',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                        ),
                ),
                const SizedBox(height: 28),
                InkWell(
                  splashColor: transparentColor,
                  highlightColor: transparentColor,
                  onTap: () {
                    Get.off(() => RegisterPage());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Belum mempunyai akun?',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: screenHeight * 0.024),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Daftar',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: screenHeight * 0.021,
                              fontWeight: FontWeight.w500,
                              color: darkBlueColor,
                            ),
                      ),
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
