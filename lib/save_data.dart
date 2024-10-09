import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> saveUserData(Map<String, dynamic> data) async {
    User user = _auth.currentUser!;

    try {
      await _firestore
          .collection('user')
          .doc(user.uid)
          .set(data, SetOptions(merge: true));
    } catch (e) {
      // print(e);
      throw Exception('Failed to save user data: $e');
    }
  }

  Future<DocumentSnapshot> getUserData() async {
    User user = _auth.currentUser!;
    DocumentSnapshot doc =
        await _firestore.collection('user').doc(user.uid).get();
    return doc;
  }
}
