import 'package:flutter/material.dart';
import 'package:fit_fusion/component.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wheel_slider/wheel_slider.dart';

class Weight extends StatefulWidget {
  const Weight({super.key});

  @override
  State<Weight> createState() => _WeightState();
}

class _WeightState extends State<Weight> {
  int selected = 0;
  int totalCount = 110;
  int _currentValue = 0;

  toogle(int key) {
    if (selected != key) {
      setState(() {
        selected = (selected + 1) % 2;
        if (_currentValue > 110) {
          _currentValue = 110;
        }
        totalCount = (selected == 0) ? 110 : 250;
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
          const Align(
            child: Saira(text: "What is your weight?", size: 24),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => toogle(0),
                child: MeasurementButton(selected: (selected == 0), text: "kg"),
              ),
              const SizedBox(width: 20),
              GestureDetector(
                onTap: () => toogle(1),
                child:
                    MeasurementButton(selected: (selected == 1), text: "lbs"),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Expanded(
            child: SvgPicture.asset(
              'assets/pictures/Ride_bicycle.svg',
            ),
          ),
          const SizedBox(height: 30),
          WheelSlider(
            totalCount: totalCount,
            initValue: 0,
            isInfinite: false,
            lineColor: yellow.withOpacity(0.3),
            pointerColor: yellow,
            onValueChanged: (value) {
              setState(() {
                _currentValue = value;
              });
            },
          ),
          SvgPicture.asset(
            'assets/icons/arrow_up.svg',
            colorFilter: ColorFilter.mode(yellow, BlendMode.srcIn),
          ),
          Niramit(
            text: "${_currentValue + ((selected == 0) ? 40 : 80)}",
            size: 20,
            weight: FontWeight.bold,
            color: yellow,
          ),
        ],
      ),
    );
  }
}
