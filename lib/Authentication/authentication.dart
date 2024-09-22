import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_fusion/component.dart';
import 'package:flutter/material.dart';

import 'package:fit_fusion/onboarding.dart';
import 'package:fit_fusion/Home/home.dart';
import 'package:fit_fusion/Information/information.dart';
import 'package:fit_fusion/splash.dart';

class Auth {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<User> signIn(String email, String password) async {
    UserCredential account = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final User user = account.user!;
    return user;
  }

  Future<User> createAccount(String email, String password) async {
    UserCredential account = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final User user = account.user!;
    return user;
  }
}

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  Future<User?> _checkLoginStatus() async {
    return FirebaseAuth.instance.currentUser;
  }

  Future<bool> _isProfileComplete(User user) async {
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    return doc.exists && doc.data()?['profileCompleted'] == true;
  }

  circularIndicator() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(color: yellow),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User?>(
      future: _checkLoginStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Splash();
        }

        if (snapshot.hasData && snapshot.data != null) {
          User? user = snapshot.data;

          return FutureBuilder(
            future: _isProfileComplete(user!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return circularIndicator();
              }

              if (snapshot.hasData && snapshot.data == true) {
                return const Home();
              } else {
                return const Information();
              }
            },
          );
        } else {
          return const Onboarding();
        }
      },
    );
  }
}
