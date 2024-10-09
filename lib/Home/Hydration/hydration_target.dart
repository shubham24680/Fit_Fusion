import 'package:fit_fusion/component.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:numberpicker/numberpicker.dart';

class HydrationTarget extends StatefulWidget {
  const HydrationTarget({super.key});

  @override
  State<HydrationTarget> createState() => _HydrationTargetState();
}

class _HydrationTargetState extends State<HydrationTarget> {
  var hydrationBox = Hive.box('hydrationBox');
  late int _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = hydrationBox.get('hydrationTarget', defaultValue: 3000);
  }

  TextStyle style(Color color) {
    return GoogleFonts.niramit(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: CIconButton(
          image: 'assets/icons/left.svg',
          onPressed: () {
            hydrationBox.put('hydrationTarget', _currentValue);
            Navigator.pop(context, _currentValue);
          },
        ),
        // Set target
        title: const Niramit(
            text: "Set target", size: 20, weight: FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Slogan
            const Align(
                child: Niramit(
              text:
                  "Good health starts with staying hydrated! Set a daily water intake target to stay on track.",
              align: TextAlign.center,
            )),
            const SizedBox(height: 20),

            Container(
              height: 203,
              width: size.width,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: black,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  const Niramit(
                    text: "Daily water intake (ml)",
                    size: 16,
                    weight: FontWeight.w500,
                  ),
                  const SizedBox(height: 10),

                  // Set target for water.
                  Align(
                    child: NumberPicker(
                      selectedTextStyle: style(yellow),
                      textStyle: style(grey),
                      step: 50,
                      minValue: 50,
                      maxValue: 25000,
                      value: _currentValue,
                      onChanged: (value) {
                        setState(() {
                          _currentValue = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
