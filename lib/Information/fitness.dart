import 'package:flutter/material.dart';
import 'package:fit_fusion/component.dart';

class Fitness extends StatefulWidget {
  const Fitness({super.key, required this.onChoice});

  final Function(String) onChoice;

  @override
  State<Fitness> createState() => _FitnessState();
}

class _FitnessState extends State<Fitness> {
  int selected = 3;
  List<String> fit = ["Advanced", "Intermediate", "Beginner", "Newbie"];
  Map<String, String> level = {
    "Newbie": 'assets/pictures/jumping-rope.svg',
    "Beginner": 'assets/pictures/dumbbell.svg',
    "Intermediate": 'assets/pictures/dumbbell-gym.svg',
    "Advanced": 'assets/pictures/gym.svg',
  };

  @override
  void initState() {
    super.initState();
    // It automatic return if user didn't select anything.
    widget.onChoice(fit[selected]);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // Question
          const Saira(
              text: "What is your current Fitness level?",
              size: 24,
              align: TextAlign.center),
          const Spacer(),

          // Options
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
                    widget.onChoice(fit[selected]);
                  });
                },
                // Option card.
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
