import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:talktify/app/modules/browser/browser_view.dart';

import '../../data/models/article_model.dart';
import '../values/app_colors.dart';
import '../values/app_values.dart';

class ArticleCard extends StatelessWidget {
  final Article articleData;
  final bool isFirst;
  final bool isLast;

  const ArticleCard({
    super.key,
    required this.articleData,
    required this.isFirst,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await BrowserView().open(
          url: Uri.parse(articleData.url),
          options: ChromeSafariBrowserClassOptions(
            android: AndroidChromeCustomTabsOptions(
              shareState: CustomTabsShareState.SHARE_STATE_OFF,
            ),
            ios: IOSSafariOptions(barCollapsingEnabled: true),
          ),
        );
      },
      child: Container(
        width: Get.width * 0.7,
        height: 210,
        margin: EdgeInsets.only(
          left: isFirst ? AppValues.margin : 4,
          right: isLast ? AppValues.margin : 4,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: articleData.image,
              height: 115,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    articleData.name,
                    style: const TextStyle(
                      color: AppColors.textSubtitleColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${articleData.descriptions} \n",
                    style: const TextStyle(
                      color: Color(0xffababab),
                      fontSize: 12,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
