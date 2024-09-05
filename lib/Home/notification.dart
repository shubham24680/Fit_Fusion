import 'package:flutter/material.dart';
import 'package:fit_fusion/component.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

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
      body: Center(
        child: SvgPicture.asset('assets/pictures/error.svg'),
      ),
    );
  }
}
