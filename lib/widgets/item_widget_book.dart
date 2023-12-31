import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/getX/controller/book_controller.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/pages/detail_page.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/pages/edit_page.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/theme.dart';
import 'package:flutter_svg/svg.dart';

class ItemBook extends StatelessWidget {
  final int id;
  final String title;
  final String subtitle;
  final String published;

  const ItemBook({
    Key? key,
    required this.id,
    required this.title,
    required this.subtitle,
    required this.published,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BookController bookController = BookController();
    // final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        Get.to(() => DetailPage(
              book_id: id,
            ));
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: whiteColor,
          border: Border(
            top: BorderSide(color: greyLightColor, width: 1),
            right: BorderSide(color: greyLightColor, width: 1),
            left: BorderSide(color: greyLightColor, width: 1),
            bottom: BorderSide(color: greyLightColor, width: 1),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.network(
                      "https://st2.depositphotos.com/1105977/5461/i/450/depositphotos_54615585-stock-photo-old-books-on-wooden-table.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.w800),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Published :\n$published",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(
                                  fontSize: 16, color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(() => EditPage(
                                book_id: id,
                              ));
                        },
                        child: SvgPicture.asset(
                          "assets/images/edit_buku.svg",
                          height: 28,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      InkWell(
                        onTap: () {
                          bookController.confirmDelete(id);
                        },
                        child: SvgPicture.asset(
                          "assets/images/remove_buku.svg",
                          height: 28,
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
