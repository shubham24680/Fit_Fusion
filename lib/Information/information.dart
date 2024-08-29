import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:fit_fusion/component.dart';

import 'package:fit_fusion/Information/fitness.dart';
import 'package:fit_fusion/Information/gender.dart';
import 'package:fit_fusion/Information/goals.dart';
import 'package:fit_fusion/Information/height.dart';
import 'package:fit_fusion/Information/weight.dart';

class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  int selected = 0;
  bool canPop = true;
  // bool loading = false;
  late TextEditingController _nameControllor;
  List<Widget> info = const [
    Fitness(),
    Goal(),
    Gender(),
    Height(),
    Weight(),
  ];

  @override
  void initState() {
    super.initState();
    _nameControllor = TextEditingController();
  }

  back() {
    setState(() {
      if (selected == 1) {
        canPop = true;
      }
      if (selected != 0) {
        selected -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool keyboardVisible = MediaQuery.of(context).viewInsets.bottom == 0;

    return PopScope(
      canPop: canPop,
      onPopInvoked: (didPop) => back(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: background,
          surfaceTintColor: background,
          automaticallyImplyLeading: false,
          leading: selected != 0
              ? CIconButton(
                  image: 'assets/icons/left.svg',
                  onPressed: () => back(),
                  color: white,
                )
              : const SizedBox(),
          title: Column(
            children: [
              LinearPercentIndicator(
                alignment: MainAxisAlignment.center,
                padding: const EdgeInsets.all(0),
                barRadius: const Radius.circular(15),
                backgroundColor: yellow.withOpacity(0.3),
                progressColor: yellow,
                lineHeight: 8,
                width: 120,
                percent: selected * 0.2,
              ),
              const SizedBox(height: 10),
              Niramit(text: "Step ${selected + 1}/6"),
            ],
          ),
          actions: const [
            SizedBox(width: 60),
          ],
        ),
        body: (selected == 0)
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Align(
                      child: Saira(text: "What is your name?", size: 24),
                    ),
                    if (keyboardVisible)
                      Expanded(
                          child: SvgPicture.asset('assets/pictures/yoga.svg')),
                    TextEditor(controller: _nameControllor, hintText: "Name"),
                  ],
                ),
              )
            : info[selected - 1],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed:
                // loading ? null
                () {
              if (selected != info.length) {
                setState(() {
                  selected += 1;
                  canPop = false;
                });
              }
               else {
              //   setState(() {
              //     loading = true;
              //   });
              //   Timer(const Duration(seconds: 2), () {
              //     setState(() {
              //       loading = false;
              //     });
                  Navigator.pushNamed(context, 'home');
              //   });
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: yellow,
                foregroundColor: black,
                minimumSize: const Size.fromHeight(63),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                )),
            child:
                // loading ? CircularProgressIndicator(color: yellow)
                Saira(
              text: (selected == info.length) ? "Finish" : "Next",
              size: 20,
              color: black,
            ),
          ),
        ),
      ),
    );
  }
}
