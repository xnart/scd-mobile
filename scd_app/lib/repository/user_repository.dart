import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scd_app/models/meal_model.dart';

class UserRepository {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  Future saveMeal(MealModel mealModel) {
    return firestore.collection("users").doc(auth.currentUser.uid).collection("meals").add(mealModel.toJson());
  }
}
