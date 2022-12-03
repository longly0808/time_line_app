import 'dart:js_util/js_util_wasm.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:time_line_app/model/model.dart';

class AppFireStoreCloud {
  static const String USER = 'users';

  static FirebaseFirestore get _fireStore => FirebaseFirestore.instance;

  static Future<void> addNewUser(UserModel user) async =>
      writeCollection(USER, user.toJson(), user.mail ?? '');

  static Future<void> writeCollection(
      String collection, Map<String, dynamic> data, String id) async {
    final docUser = _fireStore.collection(collection).doc(id);
    await docUser.set(data);
  }

  static Future<Stream<List<UserModel>>> readListCollections(
    String collections,
  ) async {

    return
      _fireStore
          .collection(collections)
          .snapshots()
          .map((snapshot) => snapshot.docs.map((e) => UserModel.fromJson(e.data())).toList());
  }
}
