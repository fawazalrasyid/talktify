import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../routes/app_pages.dart';
import '../configs/constants.dart';
import '../utils/helpers.dart';
import '../values/app_colors.dart';
import '../values/app_values.dart';

class LargeCard extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final String quota;
  final String image;
  final DateTime endDate;
  final bool isPublic;

  const LargeCard({
    Key? key,
    required this.id,
    required this.title,
    required this.description,
    required this.quota,
    required this.image,
    required this.endDate,
    required this.isPublic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppValues.largePadding,
        0,
        AppValues.largePadding,
        16,
      ),
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color(0x3fc8c8c8),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
          color: Colors.white,
        ),
        child: Column(
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: "${Constants.cdnUrl}/$image",
                  height: 214,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => SizedBox(
                    width: Get.width,
                    child: Image.asset(
                      "assets/images/placeholder.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: const Color(0x6d2280fd),
                            width: 1,
                          ),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 16,
                              height: 16,
                              padding: const EdgeInsets.all(1),
                              child: const Icon(
                                IconlyBold.time_circle,
                                size: 14,
                                color: AppColors.textPrimaryColor,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "${Helpers().dayHourFunction(endDate.difference(DateTime.now()))} Lagi",
                              style: const TextStyle(
                                color: AppColors.textPrimaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      isPublic
                          ? Container()
                          : Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: const Color(0x70f35226),
                                  width: 1,
                                ),
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              child: Container(
                                width: 16,
                                height: 16,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 2,
                                  vertical: 1,
                                ),
                                child: const Icon(
                                  IconlyBold.lock,
                                  size: 14,
                                  color: AppColors.errorColor,
                                ),
                              ),
                            )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$title \n",
                    style: const TextStyle(
                      color: AppColors.textSubtitleColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "$description \n",
                    style: const TextStyle(
                      color: Color(0xffababab),
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            SizedBox(
                              height: 24,
                              child: Image.asset("assets/images/voters.png"),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                "$quota Voters",
                                style: const TextStyle(
                                  color: AppColors.textSubtitleColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 32),
                      Expanded(
                        // width: Get.width * 0.4,
                        child: ElevatedButton(
                          onPressed: () =>
                              Get.toNamed(Routes.MAIN, arguments: id),
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.colorPrimary,
                            elevation: 0,
                            padding: const EdgeInsets.all(16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            "Vote Sekarang",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.textColorWhite,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
