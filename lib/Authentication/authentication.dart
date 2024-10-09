// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_fusion/component.dart';
// import 'package:fit_fusion/save_data.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:fit_fusion/onboarding.dart';
import 'package:fit_fusion/Home/home.dart';

// MARK: AUTHENTICATION
class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  var userBox = Hive.box('user');
  // User login check
  Future<bool> _checkLoginStatus() async {
    return userBox.get('profileCompleted', defaultValue: false);
  }
  // Future<User?> _checkLoginStatus() async {
  //   return FirebaseAuth.instance.currentUser;
  // }

  // // User profile complete check
  // Future<bool> _isProfileComplete(User user) async {
  //   final doc =
  //       await FirebaseFirestore.instance.collection('user').doc(user.uid).get();

  //   return doc.exists && doc.data()?['profileCompleted'] == true;
  // }

  Center circularIndicator() {
    return Center(
      child: CircularProgressIndicator(color: yellow),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: _checkLoginStatus(),
      builder: (context, snapshot) {
        // Waiting states
        if (snapshot.connectionState == ConnectionState.waiting) {
          return circularIndicator();
        }

        // If user exists.
        if (snapshot.hasData && snapshot.data == true) {
          return const Home();
        } else {
          // If user not exists or logout.
          return const Onboarding();
        }
      },
    );
  }
}

// return FutureBuilder(
          //   future: _isProfileComplete(user!),
          //   builder: (context, snapshot) {
          //     // Waiting.
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return circularIndicator();
          //     }

          //     // If user exists and provided information.
          //     if (snapshot.hasData && snapshot.data == true) {
          //       return const Home();
          //     } else {
          //       // If user exists and doesn't provided information.
          //       return const Information();
          //     }
          //   },
          // );

// class Auth {
//   FirebaseAuth auth = FirebaseAuth.instance;

//   // MARK: SIGN IN
//   Future<User> signIn(String email, String password) async {
//     try {
//       final account = await auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       return account.user!;
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

//   // MARK: CREATE ACCOUNT
//   Future<User> createAccount(String email, String password) async {
//     try {
//       final account = await auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       FirestoreServices firestoreServices = FirestoreServices();
//       await firestoreServices.saveUserData({
//         'email': email,
//         'uid': auth.currentUser!.uid,
//       });

//       return account.user!;
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
// }
