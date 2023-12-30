// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
import 'package:get/get.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/getX/controller/book_controller.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/getX/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:zauhair_nusantara_msib_flutterdeveloper/models/books.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/theme.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/widgets/item_widget_book.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final UserController userController = Get.put(UserController());
    final BookController bookController = Get.put(BookController());
    userController.getUser();
    bookController.fetchData();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [blueColor, yellowColor]),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                color: blueColor,
              ),
              child: SafeArea(
                child: Padding(
                  padding:
                      EdgeInsets.only(right: 20, left: 20, top: 14, bottom: 30),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: screenWidth * 0.13,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100)),
                            child: Image.network(
                                "https://randomuser.me/api/portraits/men/1.jpg"),
                          ),
                          SizedBox(
                            width: screenWidth * 0.04,
                          ),
                          Obx(
                            () => Text(
                              'Hai, ${userController.user.value.name.split(" ").first.capitalizeFirst} !',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                      color: whiteColor,
                                      fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      SearchBar(
                        side: const MaterialStatePropertyAll(
                          BorderSide(color: lightBlueColor, width: 2),
                        ),
                        backgroundColor:
                            const MaterialStatePropertyAll(bgEditTextColor),
                        onChanged: (value) {},
                        textStyle: MaterialStatePropertyAll(
                            Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w100,
                                  color: blueColor,
                                )),
                        hintText: "Cari Buku Anda",
                        hintStyle: MaterialStatePropertyAll(
                            Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w100,
                                  color: greyColor,
                                )),
                        elevation: const MaterialStatePropertyAll(0),
                        shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(45),
                            ), // Mengatur border radius menjadi 10
                          ),
                        ),
                        leading: Container(
                          padding: const EdgeInsets.all(10),
                          child: const Icon(
                            Icons.search,
                            color: blueColor,
                            size: 28,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Obx(
              () {
                final Book? book = bookController.book.value;
                final bool isLoading = bookController.isLoading.value;
                if (isLoading) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  if (book == null || book.data.isEmpty) {
                    return Center(
                        child: Text(
                            "List Buku Anda masih kosong, Unggah Segera!"));
                  } else {
                    return ListView.separated(
                      reverse: true,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.all(20),
                      itemCount: book.data.length,
                      itemBuilder: (context, index) {
                        final Datum data = book.data[index];
                        final String timeAgo =
                            timeago.format(data.published, locale: 'en');
                        return ItemBook(
                          id: data.id,
                          title: data.title,
                          subtitle: data.subtitle,
                          published: timeAgo,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: screenHeight * 0.014,
                        );
                      },
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
