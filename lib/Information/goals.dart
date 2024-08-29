import 'package:flutter/material.dart';
import 'package:fit_fusion/component.dart';

class Goal extends StatefulWidget {
  const Goal({super.key});

  @override
  State<Goal> createState() => _GoalState();
}

class _GoalState extends State<Goal> {
  List<String> goals = [
    "Learn Techniques",
    "Loss Fat",
    "Build Muscle",
    "Build Strength",
  ];
  Map<String, String> choice = {
    "Build Strength": 'assets/pictures/strength.svg',
    "Build Muscle": 'assets/pictures/muscle.svg',
    "Loss Fat": 'assets/pictures/stationary-bicycle.svg',
    "Learn Techniques": 'assets/pictures/yogaa.svg',
  };
  List<bool> selected = List.generate(4, (value) => false);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Saira(
              text: "What are your goals?", size: 24, align: TextAlign.center),
          SizedBox(
            height: size.height - 307,
            child: ListView.builder(
              itemCount: goals.length,
              reverse: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selected[index] = !selected[index];
                  });
                },
                child: CCard(
                  text: goals[index],
                  image: choice[goals[index]]!,
                  selected: selected[index],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
