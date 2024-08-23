import 'package:fit_fusion/component.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Niramit(text: "Terms and Conditions", size: 24),
          Niramit(text: "Terms and Conditions"),
        ],
      ),
    );
  }
}