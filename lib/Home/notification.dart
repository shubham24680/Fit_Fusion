// import 'package:fit_fusion/main.dart';
import 'package:flutter/material.dart';
import 'package:fit_fusion/component.dart';
// import 'package:intl/intl.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CIconButton(
          image: 'assets/icons/left.svg',
          onPressed: () => Navigator.pop(context),
        ),
        title: const Niramit(
            text: "Notifications", size: 20, weight: FontWeight.bold),
      ),
      body: const Center(
        child: Niramit(text: "No notifications"),
      ),
    );
  }
}
