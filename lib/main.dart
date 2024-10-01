import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:fit_fusion/component.dart';

import 'package:fit_fusion/theme.dart';
import 'package:fit_fusion/route.dart';
import 'package:fit_fusion/Authentication/authentication.dart';
// import 'package:fit_fusion/Home/notification.dart';

// final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseApi().initNotifications();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: background,
      ),
    );

    return MaterialApp(
      onGenerateRoute: (settings) => PageTransition(
        child: routes[settings.name!]!,
        type: PageTransitionType.rightToLeft,
      ),
      theme: theme(),
      // navigatorKey: navigatorKey,
      home: const Authentication(),
      debugShowCheckedModeBanner: false,
    );
  }
}
