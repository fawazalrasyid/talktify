import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:talktify/app/core/values/app_colors.dart';

import '../controllers/meeting_room_controller.dart';

class MeetingRoomView extends GetView<MeetingRoomController> {
  const MeetingRoomView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.pageBackground,
        title: const Text('Meeting Room'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: Get.width,
        child: Image.asset(
          "assets/images/meeting.png",
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
