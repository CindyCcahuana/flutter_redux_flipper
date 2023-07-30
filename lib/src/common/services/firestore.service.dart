import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  Future<List<Map<String, dynamic>>> get(
    String collection, {
    Map<String, dynamic>? params,
  }) async {
    CollectionReference collectionReference = firestore.collection(collection);
    QuerySnapshot querySnapshot;
    if (params?.isNotEmpty == true) {
      Query<Object?> query = collectionReference;
      params?.forEach((key, value) {
        query = query.where(key, isEqualTo: params[key]);
      });
      querySnapshot = await query.get();
    } else {
      querySnapshot = await collectionReference.get();
    }
    List<Map<String, dynamic>> response = [];
    for (var document in querySnapshot.docs) {
      response.add(document.data() as Map<String, dynamic>);
    }
    return Future.value(List<Map<String, dynamic>>.from(response));
  }

  Future<String> post(
    String collection,
    object, {
    Map<String, dynamic>? params,
  }) async {
    CollectionReference collectionReference = firestore.collection(collection);
    if (params?["id"] != null) {
      String documentId = params?["id"];
      await collectionReference
          .doc(documentId)
          .set(json.decode(object) as Map<String, dynamic>);
      return Future.value(documentId);
    } else {
      var result = await collectionReference
          .add(json.decode(object) as Map<String, dynamic>);
      result.update({...jsonDecode(object), "id": result.id});
      return Future.value(result.id);
    }
  }

  Future patch(
    String collection, {
    Map<String, dynamic>? params,
    required String body,
  }) async {
    CollectionReference collectionReference = firestore.collection(collection);
    QuerySnapshot querySnapshot =
        await collectionReference.where("id", isEqualTo: params?["id"]).get();
    for (var document in querySnapshot.docs) {
      await collectionReference.doc(document.id).update(json.decode(body));
    }
    return Future.value();
  }

  Future<dynamic> putFile(String collection, File object) async {
    Reference reference =
        storage.ref().child(collection + object.path.split('/').last);
    UploadTask uploadTask = reference.putFile(object);
    final snapshot = await uploadTask.whenComplete(() => null);
    final url = await snapshot.ref.getDownloadURL();
    return Future.value(url);
  }
}
