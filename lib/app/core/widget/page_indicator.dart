import 'package:flutter/material.dart';

import '../values/app_colors.dart';

class PageIndicator extends StatelessWidget {
  final int length;
  final int currentIndex;
  const PageIndicator({
    Key? key,
    required this.length,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8,
      child: ListView.builder(
        itemCount: length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.only(right: 4),
            decoration: BoxDecoration(
              color: currentIndex == index
                  ? AppColors.selectedIconColor
                  : AppColors.iconrColor,
              shape: BoxShape.circle,
            ),
          );
        },
      ),
    );
  }
}
