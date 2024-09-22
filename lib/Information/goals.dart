import 'package:flutter/material.dart';
import 'package:fit_fusion/component.dart';

class Goal extends StatefulWidget {
  const Goal({super.key, required this.onChoice});

  final Function(List<String>) onChoice;

  @override
  State<Goal> createState() => _GoalState();
}

class _GoalState extends State<Goal> {
  final List<String> _goals = [
    "Learn Techniques",
    "Loss Fat",
    "Build Muscle",
    "Build Strength",
  ];
  final Map<String, String> _choice = {
    "Build Strength": 'assets/pictures/strength.svg',
    "Build Muscle": 'assets/pictures/muscle.svg',
    "Loss Fat": 'assets/pictures/stationary-bicycle.svg',
    "Learn Techniques": 'assets/pictures/yogaa.svg',
  };
  final List<bool> _selected = List.generate(4, (value) => false);

  @override
  void initState() {
    super.initState();
    _selected[3] = true;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Question
          const Saira(
              text: "What are your goals?", size: 24, align: TextAlign.center),

          // Options
          SizedBox(
            height: size.height - 307,
            child: ListView.builder(
              itemCount: _goals.length,
              reverse: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    _selected[index] = !_selected[index];
                    List<String> temp = [];
                    for (int i = 0; i < _selected.length; i++) {
                      if (_selected[i]) {
                        temp.add(_goals[i]);
                      }
                    }
                    widget.onChoice(temp);
                  });
                },
                child: CCard(
                  text: _goals[index],
                  image: _choice[_goals[index]]!,
                  selected: _selected[index],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
