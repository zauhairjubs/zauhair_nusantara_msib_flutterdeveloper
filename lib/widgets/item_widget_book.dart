import 'package:flutter/material.dart';
import 'package:zauhair_nusantara_msib_flutterdeveloper/theme.dart';
import 'package:flutter_svg/svg.dart';

class ItemBook extends StatelessWidget {
  final String title;
  final String subtitle;
  final String published;

  const ItemBook({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.published,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {},
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: whiteColor,
          border: Border(
            top: BorderSide(color: greyLightColor, width: 3),
            right: BorderSide(color: greyLightColor, width: 3),
            left: BorderSide(color: greyLightColor, width: 3),
            bottom: BorderSide(color: greyLightColor, width: 3),
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Image.network(
                      "https://randomuser.me/api/portraits/men/1.jpg",
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
                        Text(
                          published,
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
                      SvgPicture.asset(
                        "assets/images/edit_buku.svg",
                        height: 28,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SvgPicture.asset(
                        "assets/images/remove_buku.svg",
                        height: 28,
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
