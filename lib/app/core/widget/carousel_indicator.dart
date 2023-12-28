import 'package:flutter/material.dart';

class CarouselIndicator extends StatelessWidget {
  final int length;
  final int currentIndex;
  const CarouselIndicator({
    super.key,
    required this.length,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      child: ListView.builder(
        itemCount: length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            height: 8,
            width: currentIndex == index ? 24 : 8,
            margin: const EdgeInsets.only(right: 8),
            decoration: ShapeDecoration(
              color: currentIndex == index
                  ? const Color(0xFFFF8787)
                  : const Color(0xffF2F2F2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          );
        },
      ),
    );
  }
}
