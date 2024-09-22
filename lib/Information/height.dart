import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wheel_slider/wheel_slider.dart';
import 'package:fit_fusion/component.dart';

class Height extends StatefulWidget {
  const Height({super.key, required this.onChoice});

  final Function(String) onChoice;

  @override
  State<Height> createState() => _HeightState();
}

class _HeightState extends State<Height> {
  int selected = 0;
  int totalCount = 40;
  num _currentValue = 0;

  toogle(int key) {
    if (selected != key) {
      setState(() {
        selected = (selected + 1) % 2;
        if (_currentValue > 40) {
          _currentValue = 40;
        }
        totalCount = (selected == 0) ? 40 : 100;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Question
          const Align(
            child: Saira(text: "What is your height?", size: 24),
          ),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Measurement button
              GestureDetector(
                onTap: () => toogle(0),
                child:
                    MeasurementButton(selected: (selected == 0), text: "inch"),
              ),
              const SizedBox(width: 20),
              GestureDetector(
                onTap: () => toogle(1),
                child: MeasurementButton(selected: (selected == 1), text: "cm"),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Image
          Expanded(
            child: SvgPicture.asset(
              'assets/pictures/Jogging.svg',
            ),
          ),
          const SizedBox(height: 20),

          // WheelSlider
          WheelSlider(
            totalCount: totalCount,
            initValue: 0,
            isInfinite: false,
            lineColor: yellow.withOpacity(0.3),
            pointerColor: yellow,
            onValueChanged: (value) {
              setState(() {
                _currentValue = value;
                widget.onChoice(
                    "${_currentValue + ((selected == 0) ? 50 : 130)} ${(selected == 0) ? "inch" : "cm"}");
              });
            },
          ),

          // upward arrow
          SvgPicture.asset(
            'assets/icons/arrow_up.svg',
            colorFilter: ColorFilter.mode(yellow, BlendMode.srcIn),
          ),

          // Height
          Niramit(
            text: "${_currentValue + ((selected == 0) ? 50 : 130)}",
            size: 20,
            weight: FontWeight.bold,
            color: yellow,
          ),
        ],
      ),
    );
  }
}
