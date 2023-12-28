import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../core/utils/helpers.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../controllers/detail_room_controller.dart';

class DetailRoomView extends GetView<DetailRoomController> {
  const DetailRoomView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          top: false,
          child: SingleChildScrollView(
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                CachedNetworkImage(
                  imageUrl: controller.roomData.image,
                  height: Get.height * 0.35,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
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
                Container(
                  margin: EdgeInsets.only(top: Get.height * 0.3),
                  decoration: const ShapeDecoration(
                    color: AppColors.pageBackground,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(AppValues.padding),
                        decoration: const ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.roomData.name,
                              style: const TextStyle(
                                color: Color(0xff2a2d35),
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFFFEDD7),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  child: Text(
                                    Helpers().capitalizeFirstLetter(
                                      controller.roomData.type,
                                    ),
                                    style: const TextStyle(
                                      color: Color(0xFFF37742),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                // Row(
                                //   children: [
                                //     const SizedBox(
                                //       width: 16,
                                //       height: 16,
                                //       child: Icon(
                                //         IconlyBold.user_3,
                                //         color: AppColors.textSubtitleColor,
                                //         size: 16,
                                //       ),
                                //     ),
                                //     const SizedBox(width: 8),
                                //     Text(
                                //       "${Helpers().generateRandomNumber()} Participants",
                                //       style: const TextStyle(
                                //         color: AppColors.textSubtitleColor,
                                //         fontSize: 14,
                                //         fontWeight: FontWeight.w400,
                                //       ),
                                //       maxLines: 2,
                                //       overflow: TextOverflow.ellipsis,
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: Icon(
                                    IconlyBold.calendar,
                                    color: AppColors.colorPrimary,
                                    size: 16,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  Helpers().formatDateTime(
                                    controller.roomData.date,
                                  ),
                                  style: const TextStyle(
                                    color: AppColors.textSubtitleColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(AppValues.padding),
                        decoration: const ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Mentor",
                              style: TextStyle(
                                color: Color(0xff2a2d35),
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                SizedBox(
                                  width: 48,
                                  height: 48,
                                  child: SvgPicture.asset(
                                    'assets/images/avatar.svg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.roomData.mentor,
                                      style: const TextStyle(
                                        color: AppColors.textSubtitleColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    const Text(
                                      "Psikolog | 5 Tahun Pengalaman",
                                      style: TextStyle(
                                        color: AppColors.textBodyColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(AppValues.padding),
                        decoration: const ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Deskripsi Konten",
                              style: TextStyle(
                                color: Color(0xff2a2d35),
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            // const SizedBox(height: 16),
                            Html(
                              data: controller.roomData.descriptions,
                              style: {
                                "body": Style(
                                  margin: Margins.zero,
                                  padding: HtmlPaddings.zero,
                                  color: AppColors.textBodyColor,
                                  fontSize: FontSize(14),
                                  fontWeight: FontWeight.w500,
                                ),
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: Get.height * 0.15,
          padding: const EdgeInsets.all(AppValues.padding),
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                width: Get.width,
                child: ElevatedButton(
                  onPressed: () => controller.buyTicket(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.colorPrimary,
                    elevation: 0,
                    padding: const EdgeInsets.fromLTRB(64, 16, 64, 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: controller.isLoading.value
                      ? const SizedBox(
                          height: 18,
                          width: 18,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          "Beli Sekarang",
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
          ),
        ),
      ),
    );
  }
}
