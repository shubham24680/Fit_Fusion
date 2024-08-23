import 'package:flutter/material.dart';
import 'package:fit_fusion/theme.dart';
import 'package:fit_fusion/route.dart';

import 'package:fit_fusion/onboarding.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) => PageTransition(
        child: routes[settings.name!]!,
        type: PageTransitionType.rightToLeft,
      ),
      theme: theme(),
      home: const Onboarding(),
      debugShowCheckedModeBanner: false,
    );
  }
}
