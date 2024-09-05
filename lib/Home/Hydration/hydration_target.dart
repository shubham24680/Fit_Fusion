import 'package:fit_fusion/component.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';

class HydrationTarget extends StatefulWidget {
  const HydrationTarget({super.key});

  @override
  State<HydrationTarget> createState() => _HydrationTargetState();
}

class _HydrationTargetState extends State<HydrationTarget> {
  int _currentValue = 3000;

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
              text: "Good health starts with staying hydrated! Set a daily water intake target to stay on track.",
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
                  const Niramit(
                    text: "Daily water intake (ml)",
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
