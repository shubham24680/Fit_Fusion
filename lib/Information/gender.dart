import 'package:flutter/material.dart';
import 'package:fit_fusion/component.dart';

class Gender extends StatefulWidget {
  const Gender({super.key});

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  @override
  Widget build(BuildContext context) {
    return const Saira(text: "Gender");
  }
}