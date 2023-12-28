import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../values/app_colors.dart';

class SmallCard extends StatelessWidget {
  final int index;
  SmallCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  final List img = [
    "assets/images/tips1.png",
    "assets/images/tips2.png",
    "assets/images/tips3.png"
  ];

  final List color = [
    const Color(0xffE7EBFF),
    const Color(0xffFFEDE7),
    const Color(0xffFFE4D0),
  ];

  final List text = [
    "Tata Cara\nMemilih",
    "Laporan\nPengaduan",
    "Agenda \nVoting Kamu",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: index.isEqual(0) ? 24 : 4,
        right: index.isEqual(2) ? 24 : 4,
      ),
      child: Container(
        width: Get.width * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color[index],
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 42,
          vertical: 19,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(img[index]),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: Text(
                text[index],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.textSubtitleColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
