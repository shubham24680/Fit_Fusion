import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> saveUserData(Map<String, dynamic> data) async {
    String userId = _auth.currentUser!.uid;

    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .set(data, SetOptions(merge: true));
    } catch (e) {
      print(e);
    }
  }

  Future<DocumentSnapshot> getUserData() async {
    String userId = _auth.currentUser!.uid;
    return await _firestore.collection('users').doc(userId).get();
  }
}
