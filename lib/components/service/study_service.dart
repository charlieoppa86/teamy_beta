import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudyService extends ChangeNotifier {
  final studyCollection = FirebaseFirestore.instance.collection('studyList');

  Future<QuerySnapshot> read(String uid) async {
    return studyCollection.where('uid', isEqualTo: uid).get();
  }

  void create(String study, String uid) async {
    await studyCollection.add({
      'uid': uid,
      'study': study,
      'isDone': false,
    });
    notifyListeners();
  }

  void update(String docId, bool isDone) async {
    await studyCollection.doc(docId).update({'isDone': isDone});
    notifyListeners();
  }

  void delete(String docId) async {
    await studyCollection.doc(docId).delete();
    notifyListeners();
  }
}
