// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(26),
                  bottomRight: Radius.circular(26),
                ),
                color: blueColor,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 26),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Icon(
                      Icons.more_horiz,
                      color: whiteColor,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            decoration: const ShapeDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://randomuser.me/api/portraits/men/5.jpg"),
                                fit: BoxFit.fill,
                              ),
                              shape: OvalBorder(
                                side: BorderSide(width: 6, color: whiteColor),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 8,
                            bottom: 0,
                            child: Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(90),
                                ),
                              ),
                              child: Icon(
                                Icons.edit,
                                color: Color(0xFF3E83EB),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      'Nama User',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: whiteColor,
                          fontFamily: 'assets/fonts/Kampenies_App.ttf'),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      'KOPPIE',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: whiteColor,
                          fontFamily: 'assets/fonts/Kampenies_App.ttf'),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      'agusraisa@mail.com',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFFB7D0F7),
                          fontFamily: 'assets/fonts/Kampenies_App.ttf'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
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
                                  Icons.language,
                                  color: darkGreyColor,
                                ),
                                SizedBox(width: 12),
                                Text(
                                  'Bahasa',
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
                            Row(
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
    );
  }
}
