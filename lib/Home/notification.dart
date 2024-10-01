// import 'package:fit_fusion/main.dart';
import 'package:flutter/material.dart';
import 'package:fit_fusion/component.dart';
import 'package:intl/intl.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool isNotification = true;
  String now = DateFormat('dd MMM yyyy').format(DateTime.now());
  List<Map<String, String>> notifications = [
    {'title': 'New Workout Added', 'date': '15 Sep 2024'},
    {'title': 'Workout finished', 'date': '12 Sep 2024'},
    {'title': 'Workout finished', 'date': '12 Sep 2024'},
  ];

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
      body: isNotification
          ? Container(
              height: notifications.length * 80,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              padding: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                color: black,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  notifications.length,
                  (index) => GestureDetector(
                    // onTap: () => Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const NotificationDetails(),
                    //   ),
                    // ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (index != 0) Divider(color: grey),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Setting Title
                              Niramit(
                                text: "...",
                                weight: FontWeight.w500,
                                size: 16,
                                color: (index % 2 == 0) ? white : grey,
                              ),

                              // Date
                              Niramit(
                                text: notifications[index]['date']!,
                                color: (index % 2 == 0) ? white : grey,
                                // weight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : const Center(
              // child: SvgPicture.asset('assets/pictures/error.svg'),
              child: Niramit(text: "No notifications"),
            ),
    );
  }
}

class NotificationDetails extends StatelessWidget {
  const NotificationDetails({super.key, required this.message});
  final RemoteMessage message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        surfaceTintColor: background,
        leading: CIconButton(
          image: 'assets/icons/left.svg',
          onPressed: () => Navigator.pop(context),
          color: white,
        ),
      ),
      body: Center(
        child: Saira(text: "${message.notification?.title}"),
      ),
    );
  }
}

// Handle background incoming messages.
Future<void> handleBackgroundMessages(RemoteMessage message) async {
  print('title: ${message.notification?.title}');
  print('body: ${message.notification?.body}');
  print('payload: ${message.data}');
}

class FirebaseApi {
  // Instance of message
  final _firebaseMessaging = FirebaseMessaging.instance;

  // Initialize Notifications
  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print('Token: $fCMToken');
    initPushNotifications();
  }

  // Handle message route.
  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    // navigatorKey.currentState?.pushNamed('notificationsDetails', arguments: message);
    // navigatorKey.currentState?.push(MaterialPageRoute(
    //   builder: (context) => NotificationDetails(message: message),
    // ));
  }

  // Push Notifications.
  Future initPushNotifications() async {
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    _firebaseMessaging.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessages);
  }

  // Receive messages

  // Initialize forground and background settings
}
