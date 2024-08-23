import 'package:flutter/material.dart';
import 'package:fit_fusion/component.dart';

class Weight extends StatefulWidget {
  const Weight({super.key});

  @override
  State<Weight> createState() => _WeightState();
}

class _WeightState extends State<Weight> {
  @override
  Widget build(BuildContext context) {
    return const Saira(text: "Weight");
  }
}