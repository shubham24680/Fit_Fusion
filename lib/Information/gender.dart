import 'package:flutter/material.dart';
import 'package:fit_fusion/component.dart';

class Gender extends StatefulWidget {
  const Gender({super.key});

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  List<String> fit = ["Female", "Male"];
  Map<String, String> level = {
    "Male": 'assets/pictures/Man.svg',
    "Female": 'assets/pictures/Woman.svg',
  };
  int selected = -1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const Saira(
              text: "What is your gender?",
              size: 24,
              align: TextAlign.center),
          const Spacer(),
          SizedBox(
            height: size.height - 307,
            child: ListView.builder(
              itemCount: fit.length,
              reverse: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selected = index;
                  });
                },
                child: CCard(
                  text: fit[index],
                  image: level[fit[index]]!,
                  selected: (selected == index),
                  cardSize: 0.48,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
