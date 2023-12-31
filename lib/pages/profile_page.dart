// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/getX/controller/book_controller.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/getX/controller/login_controller.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/getX/controller/user_controller.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final UserController userController = Get.put(UserController());
    final BookController bookController = Get.put(BookController());
    final LoginController _loginController = Get.put(LoginController());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => Text(
                            'Halo, ${userController.user.value.name.split(" ").first.capitalizeFirst} !',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    color: blueColor,
                                    fontWeight: FontWeight.w700),
                          ),
                        ),
                        Text(
                          'Gresik, Jawa Timur',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: blackColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Container(
                      width: screenWidth * 0.13,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100)),
                      child: Image.network(
                          "https://randomuser.me/api/portraits/men/1.jpg"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFEAECF0)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: whiteColor,
                    shadows: [
                      BoxShadow(
                        color: greyLightColor,
                        blurRadius: 12,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Aktivitas Profil',
                        style: TextStyle(
                          fontFamily: 'assets/fonts/Kampenies_App.ttf',
                          fontWeight: FontWeight.w500,
                          color: blackColor,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.book_outlined,
                                    color: darkGreyColor,
                                  ),
                                  SizedBox(width: 12),
                                  Row(
                                    children: [
                                      Obx(
                                        () => Text(
                                          '${bookController.book.value!.data.length}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              color: darkGreyColor,
                                              fontSize: 16),
                                        ),
                                      ),
                                      Text(
                                        ' Buku telah ditambahkan',
                                        style: TextStyle(
                                            color: darkGreyColor, fontSize: 16),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Container(
                            height: 1,
                            width: double.infinity,
                            decoration: BoxDecoration(color: greyLightColor),
                          )
                        ],
                      ),
                      SizedBox(height: 16),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.email_outlined,
                                    color: darkGreyColor,
                                  ),
                                  SizedBox(width: 12),
                                  Text(
                                    '${userController.user.value.email}',
                                    style: TextStyle(
                                        color: darkGreyColor, fontSize: 16),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Container(
                            height: 1,
                            width: double.infinity,
                            decoration: BoxDecoration(color: greyLightColor),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 24, 24, 24),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFEAECF0)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: whiteColor,
                    shadows: [
                      BoxShadow(
                        color: greyLightColor,
                        blurRadius: 12,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Akun dan Layanan',
                        style: TextStyle(
                          fontFamily: 'assets/fonts/Kampenies_App.ttf',
                          fontWeight: FontWeight.w500,
                          color: blackColor,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.edit_document,
                                    color: darkGreyColor,
                                  ),
                                  SizedBox(width: 12),
                                  Text(
                                    'Ubah Data Akun',
                                    style: TextStyle(
                                        color: darkGreyColor, fontSize: 14),
                                  )
                                ],
                              ),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: darkGreyColor,
                              )
                            ],
                          ),
                          SizedBox(height: 8),
                          Container(
                            height: 1,
                            width: double.infinity,
                            decoration: BoxDecoration(color: greyLightColor),
                          )
                        ],
                      ),
                      SizedBox(height: 16),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.star_border,
                                    color: darkGreyColor,
                                  ),
                                  SizedBox(width: 12),
                                  Text(
                                    'Beri Rating',
                                    style: TextStyle(
                                        color: darkGreyColor, fontSize: 14),
                                  )
                                ],
                              ),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: darkGreyColor,
                              )
                            ],
                          ),
                          SizedBox(height: 8),
                          Container(
                            height: 1,
                            width: double.infinity,
                            decoration: BoxDecoration(color: greyLightColor),
                          )
                        ],
                      ),
                      SizedBox(height: 16),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.privacy_tip_outlined,
                                    color: darkGreyColor,
                                  ),
                                  SizedBox(width: 12),
                                  Text(
                                    'Kebijakan Privasi',
                                    style: TextStyle(
                                        color: darkGreyColor, fontSize: 14),
                                  )
                                ],
                              ),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: darkGreyColor,
                              )
                            ],
                          ),
                          SizedBox(height: 8),
                          Container(
                            height: 1,
                            width: double.infinity,
                            decoration: BoxDecoration(color: greyLightColor),
                          )
                        ],
                      ),
                      SizedBox(height: 16),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.help_outline,
                                    color: darkGreyColor,
                                  ),
                                  SizedBox(width: 12),
                                  Text(
                                    'Pusat Bantuan',
                                    style: TextStyle(
                                        color: darkGreyColor, fontSize: 14),
                                  )
                                ],
                              ),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: darkGreyColor,
                              )
                            ],
                          ),
                          SizedBox(height: 8),
                          Container(
                            height: 1,
                            width: double.infinity,
                            decoration: BoxDecoration(color: greyLightColor),
                          )
                        ],
                      ),
                      SizedBox(height: 16),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.settings,
                                    color: darkGreyColor,
                                  ),
                                  SizedBox(width: 12),
                                  Text(
                                    'Pengaturan',
                                    style: TextStyle(
                                        color: darkGreyColor, fontSize: 14),
                                  )
                                ],
                              ),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: darkGreyColor,
                              )
                            ],
                          ),
                          SizedBox(height: 8),
                          Container(
                            height: 1,
                            width: double.infinity,
                            decoration: BoxDecoration(color: greyLightColor),
                          )
                        ],
                      ),
                      SizedBox(height: 16),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                splashColor: blueColor,
                                highlightColor: blueColor,
                                onTap: () {
                                  _loginController.confirmLogout();
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.logout,
                                      color: Colors.red,
                                    ),
                                    SizedBox(width: 12),
                                    Text(
                                      'Keluar',
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 14),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Container(
                            height: 1,
                            width: double.infinity,
                            decoration: BoxDecoration(color: greyLightColor),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
