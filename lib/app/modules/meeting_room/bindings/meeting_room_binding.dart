import 'package:get/get.dart';

import '../controllers/meeting_room_controller.dart';

class MeetingRoomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MeetingRoomController>(
      () => MeetingRoomController(),
    );
  }
}
