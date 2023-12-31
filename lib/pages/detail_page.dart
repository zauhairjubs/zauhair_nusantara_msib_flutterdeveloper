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
  final EditBookController bookController = Get.put(EditBookController());

  @override
  void initState() {
    super.initState();
    bookController.fetchBookbyID(widget.book_id);
    print("InitState Detail Page");
  }

  Future<void> _refreshData() async {
    await bookController.fetchBookbyID(widget.book_id);
    Get.off(() => DetailPage(book_id: widget.book_id));
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: screenWidth,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(24)),
                    ),
                    child: Image.network(
                      'https://img.freepik.com/free-photo/book-composition-with-open-book_23-2147690555.jpg',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => Text(
                            bookController.title.value,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    fontSize: 24, fontWeight: FontWeight.w800),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.014,
                        ),
                        Obx(
                          () => Text(
                            "ISBN ${bookController.isbn.value}",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                    fontSize: 16, color: Colors.grey.shade600),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.014,
                        ),
                        Obx(
                          () => Text(
                            "${bookController.author.value} - ${bookController..publisher.value}",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                    fontSize: 15, color: Colors.grey.shade600),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        Obx(
                          () => Text(
                            bookController.description.value,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    fontSize: 15, fontWeight: FontWeight.w100),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 100,
                            textAlign: TextAlign.justify,
                          ),
                        )
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
                  backgroundColor: whiteColor,
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
      ),
    );
  }
}
