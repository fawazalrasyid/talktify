import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../data/models/activity_model.dart';

class ActivityController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  final isLoading = false.obs;

  final Rxn<List<Activity>> activityList = Rxn<List<Activity>>();

  @override
  Future<void> onInit() async {
    user = auth.currentUser;
    getActivities();
    super.onInit();
  }

  Future<void> getActivities() async {
    isLoading.value = true;

    final activityRef = FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .collection('activities');

    final activityData = await activityRef
        .withConverter<Activity>(
          fromFirestore: (snapshot, _) => Activity.fromJson(snapshot.data()!),
          toFirestore: (activity, _) => activity.toJson(),
        )
        .get();
    activityList.value = activityData.docs.map((doc) => doc.data()).toList();

    isLoading.value = false;
  }
}
