import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethod {
  static Future addUserData(String id, Map<String, dynamic> userMap) async {
    var userRef = await FirebaseFirestore.instance.collection('Users');
    userRef.doc(id).set(userMap);
  }

  static Future<Stream<QuerySnapshot>> getUserData() async {
    return await FirebaseFirestore.instance.collection('Users').snapshots();
  }
}
