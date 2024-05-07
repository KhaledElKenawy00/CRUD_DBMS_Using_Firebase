import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethod {
  static Future addUserData(String id, Map<String, dynamic> userMap) async {
    var userRef = await FirebaseFirestore.instance.collection('Users');
    userRef.doc(id).set(userMap);
  }

  static Future<Stream<QuerySnapshot>> getUserData() async {
    return await FirebaseFirestore.instance.collection('Users').snapshots();
  }

  static updateUserData(
      String userId, Map<String, dynamic> userMapUpdated) async {
    return await FirebaseFirestore.instance
        .collection('Users')
        .doc(userId)
        .update(userMapUpdated);
  }

  static delteUser(String userId) async {
    await FirebaseFirestore.instance.collection('Users').doc(userId).delete();
  }
}
