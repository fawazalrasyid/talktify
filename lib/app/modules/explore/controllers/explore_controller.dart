import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../data/models/room_model.dart';

class ExploreController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  final isLoading = false.obs;

  final Rxn<List<Room>> roomList = Rxn<List<Room>>();

  @override
  Future<void> onInit() async {
    user = auth.currentUser;
    getRooms();
    super.onInit();
  }

  Future<void> getRooms() async {
    isLoading.value = true;

    final roomRef = FirebaseFirestore.instance.collection('rooms');
    final roomData = await roomRef
        .withConverter<Room>(
          fromFirestore: (snapshot, _) => Room.fromJson(snapshot.data()!),
          toFirestore: (room, _) => room.toJson(),
        )
        .get();
    roomList.value = roomData.docs.map((doc) => doc.data()).toList();

    isLoading.value = false;
  }
}
