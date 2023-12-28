// import 'package:cached_network_image/cached_network_image.dart';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconly/iconly.dart';
// import 'package:intl/intl.dart';

// import '../../routes/app_pages.dart';
// import '../configs/constants.dart';
// import '../values/app_colors.dart';
// import '../values/app_values.dart';

// class VotingRoomCard extends StatelessWidget {
//   final String id;
//   final String title;
//   final String image;
//   final DateTime createdAt;
//   final bool isPublic;

//   const VotingRoomCard({
//     Key? key,
//     required this.id,
//     required this.title,
//     required this.image,
//     required this.createdAt,
//     required this.isPublic,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(
//         AppValues.largePadding,
//         0,
//         AppValues.largePadding,
//         16,
//       ),
//       child: Container(
//         width: Get.width,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: const [
//             BoxShadow(
//               color: Color(0x3fc8c8c8),
//               blurRadius: 8,
//               offset: Offset(0, 2),
//             ),
//           ],
//           color: Colors.white,
//         ),
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 CachedNetworkImage(
//                   imageUrl: "${Constants.cdnUrl}/$image",
//                   height: 115,
//                   imageBuilder: (context, imageProvider) => Container(
//                     decoration: BoxDecoration(
//                       borderRadius: const BorderRadius.only(
//                         topLeft: Radius.circular(12),
//                         topRight: Radius.circular(12),
//                       ),
//                       image: DecorationImage(
//                         image: imageProvider,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   placeholder: (context, url) => const Center(
//                     child: CircularProgressIndicator(),
//                   ),
//                   errorWidget: (context, url, error) => SizedBox(
//                     width: Get.width,
//                     child: Image.asset(
//                       "assets/images/placeholder.png",
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       isPublic
//                           ? Container()
//                           : Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(100),
//                                 border: Border.all(
//                                   color: const Color(0x70f35226),
//                                   width: 1,
//                                 ),
//                                 color: Colors.white,
//                               ),
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 8,
//                                 vertical: 4,
//                               ),
//                               child: Container(
//                                 width: 16,
//                                 height: 16,
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 2,
//                                   vertical: 1,
//                                 ),
//                                 child: const Icon(
//                                   IconlyBold.lock,
//                                   size: 14,
//                                   color: AppColors.errorColor,
//                                 ),
//                               ),
//                             )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: const TextStyle(
//                       color: AppColors.textSubtitleColor,
//                       fontSize: 18,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   const SizedBox(height: 24),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Row(
//                           children: [
//                             SizedBox(
//                               height: 24,
//                               child: ListView.builder(
//                                 itemCount: 2,
//                                 scrollDirection: Axis.horizontal,
//                                 padding: EdgeInsets.zero,
//                                 shrinkWrap: true,
//                                 itemBuilder: (context, index) {
//                                   return Container(
//                                     width: 24,
//                                     height: 24,
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       border: Border.all(
//                                         color: Colors.white,
//                                         width: 1,
//                                       ),
//                                       image: const DecorationImage(
//                                         image: AssetImage(
//                                           "assets/images/avatar.png",
//                                         ),
//                                         fit: BoxFit.cover,
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               ),
//                             ),
//                             const SizedBox(width: 8),
//                             const Expanded(
//                               child: Text(
//                                 "300 voters",
//                                 style: TextStyle(
//                                   color: AppColors.textSubtitleColor,
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       const SizedBox(width: 32),
//                       Expanded(
//                         child: Text(
//                           "Dibuat ${DateFormat('d MMM yyy').format(createdAt)}",
//                           textAlign: TextAlign.right,
//                           style: const TextStyle(
//                             color: AppColors.textSubtitleColor,
//                             fontSize: 12,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),
//                   const Divider(),
//                   const SizedBox(height: 8),
//                   Center(
//                     child: GestureDetector(
//                       onTap: () => Get.toNamed(
//                         Routes.DETAIL_VOTING_ROOM,
//                         arguments: id,
//                       ),
//                       child: const Text(
//                         "Lihat Perolehan",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: AppColors.textPrimaryColor,
//                           fontSize: 14,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
