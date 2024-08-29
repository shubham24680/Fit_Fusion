import 'package:flutter/material.dart';
import 'package:fit_fusion/component.dart';

class Fitness extends StatefulWidget {
  const Fitness({super.key});

  @override
  State<Fitness> createState() => _FitnessState();
}

class _FitnessState extends State<Fitness> {
  List<String> fit = ["Advanced", "Intermediate", "Beginner", "Newbie"];
  Map<String, String> level = {
    "Newbie": 'assets/pictures/jumping-rope.svg',
    "Beginner": 'assets/pictures/dumbbell.svg',
    "Intermediate": 'assets/pictures/dumbbell-gym.svg',
    "Advanced": 'assets/pictures/gym.svg',
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
              text: "What is your current Fitness level?",
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
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
