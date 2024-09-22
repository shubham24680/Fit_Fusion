import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:fit_fusion/theme.dart';
import 'package:fit_fusion/route.dart';
import 'package:fit_fusion/Authentication/authentication.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarIconBrightness: Brightness.light,
    // ));

    return MaterialApp(
      onGenerateRoute: (settings) => PageTransition(
        child: routes[settings.name!]!,
        type: PageTransitionType.rightToLeft,
      ),
      theme: theme(),
      home: const Authentication(),
      debugShowCheckedModeBanner: false,
    );
  }
}
