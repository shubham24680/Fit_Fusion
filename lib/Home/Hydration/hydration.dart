import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fit_fusion/component.dart';
import 'package:google_fonts/google_fonts.dart';

class Hydration extends StatefulWidget {
  const Hydration({super.key});

  @override
  State<Hydration> createState() => _HydrationState();
}

class _HydrationState extends State<Hydration> {
  List<String> units = ["km", "kcal", "minutes"];
  Map<String, Map<String, String>> measurement = {
    'km': {
      'icon': 'assets/icons/distance.svg',
      'count': "10,675",
    },
    'kcal': {
      'icon': 'assets/icons/calories.svg',
      'count': "2,156",
    },
    'minutes': {
      'icon': 'assets/icons/time.svg',
      'count': "56",
    },
  };
  List<String> time = ["Day", "Week", "Month", "Year"];
  int selected = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: CIconButton(
          image: 'assets/icons/left.svg',
          onPressed: () => Navigator.pop(context),
        ),
        title:
            const Niramit(text: "Hydration", size: 20, weight: FontWeight.bold),
        actions: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'hydrationTarget'),
            child: Niramit(
              text: "Set target",
              size: 12,
              weight: FontWeight.bold,
              color: yellow,
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Wrap(
                  crossAxisAlignment: WrapCrossAlignment.end,
                  children: [
                    Niramit(text: "1,500", size: 40, weight: FontWeight.bold),
                    Niramit(text: "/ 2,500 ml", size: 20),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: black,
                    foregroundColor: white,
                    fixedSize: const Size(120, 35),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Niramit(
                    text: "+ 250 ml",
                    size: 18,
                    weight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: yellow, strokeAlign: BorderSide.strokeAlignOutside),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  time.length,
                  (index) => GestureDetector(
                    onTap: () => setState(() {
                      selected = index;
                    }),
                    child: Container(
                      height: 40,
                      width: size.width / time.length - 10,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color:
                            (selected == index) ? yellow : Colors.transparent,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Niramit(
                        text: time[index],
                        weight: FontWeight.w500,
                        color: (selected == index) ? black : white,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: size.height - 260,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: black,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Bar(),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Bar extends StatefulWidget {
  const Bar({super.key});

  @override
  State<Bar> createState() => _BarState();
}

class _BarState extends State<Bar> {
  BarChartData get data => BarChartData(
        maxY: 35000.0,
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: getBottomTiles,
              reservedSize: 40,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: getLeftTiles,
              reservedSize: 40,
            ),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: true, reservedSize: 10),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        barGroups: List.generate(
          7,
          (i) => makeGroupData(
            i,
            Random().nextInt(35000).toDouble(),
          ),
        ),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          getDrawingHorizontalLine: (value) => FlLine(
            color: grey,
            strokeWidth: 1,
            dashArray: [5, 5],
          ),
        ),
      );

  TextStyle style = GoogleFonts.niramit(
    fontSize: 14,
    fontWeight: FontWeight.w100,
    color: white,
  );
  Widget getBottomTiles(double value, TitleMeta meta) {
    List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    Widget text = Text(
      days[value.toInt()],
      style: style,
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  Widget getLeftTiles(double value, TitleMeta meta) {
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        meta.formattedValue,
        style: style,
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: (y >= 17000) ? yellow : grey,
          borderRadius: BorderRadius.circular(10),
          width: 35,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(data);
  }
}
