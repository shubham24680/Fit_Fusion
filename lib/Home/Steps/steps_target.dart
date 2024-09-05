import 'package:fit_fusion/component.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';

class StepsTarget extends StatefulWidget {
  const StepsTarget({super.key});

  @override
  State<StepsTarget> createState() => _StepsTargetState();
}

class _StepsTargetState extends State<StepsTarget> {
  int _currentValue = 10000;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: CIconButton(
          image: 'assets/icons/left.svg',
          onPressed: () => Navigator.pop(context),
        ),
        title: const Niramit(
            text: "Set target", size: 20, weight: FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Align(
                child: Niramit(
              text: "Set a daily step to help you stay active and healthy.",
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
                  const Niramit(
                    text: "Daily steps",
                    size: 16,
                    weight: FontWeight.w500,
                  ),
                  const SizedBox(height: 10),
                  Align(
                    child: NumberPicker(
                      selectedTextStyle: GoogleFonts.niramit(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: yellow,
                      ),
                      textStyle: GoogleFonts.niramit(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: grey,
                      ),
                      step: 5,
                      minValue: 1000,
                      maxValue: 50000,
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
