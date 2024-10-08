import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:fit_fusion/theme.dart';
import 'package:fit_fusion/route.dart';
import 'package:fit_fusion/Authentication/authentication.dart';
import 'package:fit_fusion/component.dart';
import 'package:fit_fusion/Home/Hydration/hydration_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  Hive.registerAdapter(HydrationDataAdapter());
  await Hive.openBox('hydrationBox');
  await Hive.openBox('user');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Design for status bar and navigation bar.
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: background,
      ),
    );

    // Potrait only.
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

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
