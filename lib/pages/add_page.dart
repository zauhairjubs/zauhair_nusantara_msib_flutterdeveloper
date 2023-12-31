// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/getX/controller/addBook_controller.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/theme.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  late AddBookController addBookController;

  @override
  void initState() {
    super.initState();
    addBookController = Get.put(AddBookController());
    addBookController.formKeyAddbook = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparentColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: blackColor,
          onPressed: () => Navigator.pop(context),
          highlightColor: transparentColor,
          splashColor: transparentColor,
        ),
        title: Center(
          child: Text(
            'Upload Buku',
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
                  key: addBookController.formKeyAddbook,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ISBN',
                          style: Theme.of(context).textTheme.bodyMedium),
                      const SizedBox(height: 8),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: addBookController.isbnController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          hintText: "ISBN",
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
                            return 'Silahkan isi ISBN Buku';
                          } else if (!value.isNum) {
                            return 'Isi hanya dengan angka';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      Text('Judul Buku',
                          style: Theme.of(context).textTheme.bodyMedium),
                      const SizedBox(height: 8),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: addBookController.titleController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          hintText: "Judul",
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
                          if (email!.isEmpty) {
                            return 'Silahkan isi judul Buku';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Sub Judul Buku',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: addBookController.subtitleController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          hintText: "Sub Judul",
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
                            return 'Silahkan isi Sub judul Buku';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Penulis',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: addBookController.authorController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          hintText: "Penulis",
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
                            return 'Silahkan isi Penulis Buku';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Waktu diterbitkan',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                          keyboardType: TextInputType.datetime,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: addBookController.publishedController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            hintText: "Cth : 2022-12-02 00:00:00",
                            hintStyle: TextStyle(color: greyColor),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              borderSide: BorderSide(color: softGreyColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: blueColor)),
                            filled: true,
                            fillColor: greyLightColor,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Silahkan isi Waktu Penerbitan';
                            }

                            try {
                              DateTime.parse(value);
                              // Lakukan validasi tambahan jika diperlukan
                            } catch (e) {
                              return 'Tulis dalam format yang benar (yyyy-MM-dd H:m:s)';
                            }

                            return null;
                          }),
                      const SizedBox(height: 16),
                      Text(
                        'Penerbit',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: addBookController.publisherController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          hintText: "Penerbit",
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
                            return 'Silahkan isi penerbit Buku';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Jumlah Halaman',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: addBookController.pagesController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          hintText: "Jumlah Halaman",
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
                            return 'Silahkan isi jumlah halaman Buku';
                          } else if (!value.isNum) {
                            return 'Isi Hanya Angka';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Deskripsi Buku',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        maxLines: 5,
                        controller: addBookController.descController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          hintText: "Deskripsi Buku",
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
                            return 'Silahkan isi deskripsi Buku';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Website',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: addBookController.webController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          hintText: "Website",
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
                            return 'Silahkan isi website Buku';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(
              Size(double.infinity, 48),
            ),
          ),
          onPressed: () {
            addBookController.add();
          },
          child: Text(
            'Submit',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w500, color: whiteColor),
          ),
        ),
      ),
    );
  }
}
