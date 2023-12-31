import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/getX/controller/editBook_controller.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/theme.dart';

class DetailPage extends StatefulWidget {
  final int book_id;
  const DetailPage({Key? key, required this.book_id}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late EditBookController bookController;

  @override
  void initState() {
    super.initState();
    bookController = Get.put(EditBookController());
    bookController.fetchBookbyID(widget.book_id);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Image.network(
                    'https://img.freepik.com/free-photo/book-composition-with-open-book_23-2147690555.jpg',
                    height: screenHeight * 0.336,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        bookController.titleController.text,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 24, fontWeight: FontWeight.w800),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      SizedBox(
                        height: screenHeight * 0.014,
                      ),
                      Text(
                        "ISBN ${bookController.isbnController.text}",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontSize: 16, color: Colors.grey.shade600),
                      ),
                      SizedBox(
                        height: screenHeight * 0.014,
                      ),
                      Text(
                        "${bookController.authorController.text} - ${bookController.publisherController.text}",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontSize: 15, color: Colors.grey.shade600),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Text(
                        bookController.descController.text,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 15, fontWeight: FontWeight.w100),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 100,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: SafeArea(
              child: FloatingActionButton(
                elevation: 7,
                splashColor: blueColor,
                onPressed: () {
                  Navigator.pop(context);
                },
                backgroundColor: whiteColor, // Sesuaikan warna sesuai keinginan
                child: const Icon(
                  Icons.close,
                  color: blackColor,
                  size: 26,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
