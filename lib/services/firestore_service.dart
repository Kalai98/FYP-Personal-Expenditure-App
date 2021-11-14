import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fyp/models/category_data.dart';
import 'package:fyp/models/UserProfile.dart';

class FirestoreService {
  static final FirestoreService _firestoreService =
  FirestoreService._internal();
  Firestore _db = Firestore.instance;

  FirestoreService._internal();

  factory FirestoreService() {
    return _firestoreService;
  }

  Future <void> addData(Category category) {
    return _db.collection('Category').add(category.toMap());
  }
  Future <void> updateData(Category category) {
    return _db.collection('Category').document(category.id).updateData(category.toMap());
  }
  Future<void> deleteData(String id) {
    return _db.collection('Category').document(id).delete();
  }
  Future <void> addProfile(UserProfile userProfile) {
    return _db.collection('userData').add(userProfile.toMap());
  }
  Future <void> updateProfile(UserProfile userProfile) {
    return _db.collection('userData').document(userProfile.id).updateData(userProfile.toMap());
  }


}