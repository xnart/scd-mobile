import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scd_app/models/bm_model.dart';
import 'package:scd_app/models/meal_model.dart';

class UserRepository {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  Future saveMeal(MealModel mealModel) {
    return firestore.collection("users").doc(auth.currentUser.uid).collection("meals").add(mealModel.toJson());
  }

  Future saveBM(BMModel model) {
    return firestore.collection("users").doc(auth.currentUser.uid).collection("bms").add(model.toJson());
  }

  Future<List<BMModel>> fetchBMs() async {
    var snapshot = await firestore.collection("users").doc(auth.currentUser.uid).collection("bms").get();
    return snapshot.docs.map((element) => BMModel.fromJson(element.data())).toList();
  }

  Future<List<MealModel>> fetchMealHistory() async {
    var snapshot = await firestore.collection("users").doc(auth.currentUser.uid).collection("meals").get();
    return snapshot.docs.map((element) => MealModel.fromJson(element.data())).toList();
  }
}
