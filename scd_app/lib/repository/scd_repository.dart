import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scd_app/models/scd_list_model.dart';

class SCDRepository {
  Future<List<SCDListModel>> fetchSCDFoods() async {
    List<SCDListModel> list = [];
    var snapshot = await FirebaseFirestore.instance.collection("scd-foods").get();
    snapshot.docs.forEach((element) {
      list.add(SCDListModel.fromJson(element.data()));
    });
    return list;
  }
}
