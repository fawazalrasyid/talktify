import 'package:carousel_slider/carousel_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:talktify/app/data/models/article_model.dart';

import '../../../data/models/room_model.dart';

class HomeController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  final isLoading = false.obs;

  final CarouselController promotionCarouselCtrl = CarouselController();

  final currPromotionIndex = 0.obs;

  final Rxn<List<Room>> promotionList = Rxn<List<Room>>();
  final Rxn<List<Room>> roomList = Rxn<List<Room>>();
  final Rxn<List<Article>> articleList = Rxn<List<Article>>();

  @override
  Future<void> onInit() async {
    user = auth.currentUser;
    getPromotions();
    getRooms();
    getArticles();
    super.onInit();
  }

  Future<void> getPromotions() async {
    isLoading.value = true;

    final roomRef = FirebaseFirestore.instance.collection('promotions');
    final roomData = await roomRef
        .withConverter<Room>(
          fromFirestore: (snapshot, _) => Room.fromJson(snapshot.data()!),
          toFirestore: (room, _) => room.toJson(),
        )
        .get();
    promotionList.value = roomData.docs.map((doc) => doc.data()).toList();

    isLoading.value = false;
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

  Future<void> getArticles() async {
    isLoading.value = true;

    final roomRef = FirebaseFirestore.instance.collection('articles');
    final roomData = await roomRef
        .withConverter<Article>(
          fromFirestore: (snapshot, _) => Article.fromJson(snapshot.data()!),
          toFirestore: (room, _) => room.toJson(),
        )
        .get();
    articleList.value = roomData.docs.map((doc) => doc.data()).toList();

    isLoading.value = false;
  }
}
