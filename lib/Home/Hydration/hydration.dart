import 'dart:math';
import 'package:fit_fusion/Home/Hydration/hydration_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fit_fusion/component.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

// MARK: HYDRATION
class Hydration extends StatefulWidget {
  const Hydration({super.key});

  @override
  State<Hydration> createState() => _HydrationState();
}

class _HydrationState extends State<Hydration> {
  // Add to local storage
  var hydrationBox = Hive.box('hydrationBox');
  int _water = 0;
  late int _target;
  int selectedTimeline = 0;
  // Current Date and Format
  final DateTime today = DateTime.now();
  final DateFormat dateFormat = DateFormat('dd MMM yy');
  // Week
  late DateTime _monday;
  late String _weekStart;
  late String _weekEnd;
  // Month
  late DateTime _currentMonth;
  late String _month;
  // Year
  late DateTime _currentYear;
  late String _year;

  @override
  void initState() {
    super.initState();
    _target = hydrationBox.get('hydrationTarget', defaultValue: 3000);
    _monday = today.subtract(Duration(days: today.weekday - 1));
    _currentMonth = DateTime(today.year, today.month, 1);
    _currentYear = DateTime(today.year, today.month, 1);
    changeDate();
    updateData(0);
  }

  void updateData(double waterAmount) async {
    String todayFormat = DateFormat('yyyy-MM-dd').format(today);
    var hydrationData = hydrationBox.get(todayFormat);
    if (hydrationData != null) {
      hydrationData.value += waterAmount;
      await hydrationBox.put(todayFormat, hydrationData);
      setState(() {
        _water = hydrationData.value.toInt();
      });
    } else {
      await hydrationBox.put(
          todayFormat, HydrationData(date: today, value: waterAmount));
    }
  }

  void changeDate() {
    // Week
    _weekStart = dateFormat.format(_monday);
    _weekEnd = dateFormat.format(_monday.add(const Duration(days: 6)));
    // Month
    _month = DateFormat('MMMM yyyy').format(_currentMonth);
    // Year
    _year = DateFormat('yyyy').format(_currentYear);
  }

  String showDate() {
    switch (selectedTimeline) {
      case 0:
        return "$_weekStart - $_weekEnd";
      case 1:
        return _month;
      case 2:
        return _year;
      default:
        return "...";
    }
  }

  void previousTimeline() {
    setState(() {
      switch (selectedTimeline) {
        case 0:
          _monday = _monday.subtract(const Duration(days: 7));
          break;
        case 1:
          _currentMonth = DateTime(today.year, _currentMonth.month - 1);
          break;
        case 2:
          _currentYear = DateTime(_currentYear.year - 1);
      }
      changeDate();
    });
  }

  void nextTimeline() {
    setState(() {
      switch (selectedTimeline) {
        case 0:
          _monday = _monday.add(const Duration(days: 7));
          break;
        case 1:
          _currentMonth = DateTime(today.year, _currentMonth.month + 1);
          break;
        case 2:
          _currentYear = DateTime(_currentYear.year + 1);
      }
      changeDate();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: CIconButton(
          image: 'assets/icons/left.svg',
          onPressed: () => Navigator.pop(context, _water),
        ),

        // Hydration
        title:
            const Niramit(text: "Hydration", size: 20, weight: FontWeight.bold),

        actions: [
          // Set target
          GestureDetector(
            onTap: () async {
              final newTarget =
                  await Navigator.pushNamed(context, 'hydrationTarget');
              if (mounted) {
                setState(() {
                  _target = newTarget as int;
                });
              }
            },
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
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.end,
                  children: [
                    // Show water level.
                    Niramit(
                      text: NumberFormat('#,###').format(_water),
                      size: 40,
                      weight: FontWeight.bold,
                    ),

                    // Hydration target.
                    Niramit(
                      text: "/ ${NumberFormat('#,###').format(_target)} ml",
                      size: 20,
                    ),
                  ],
                ),
                ElevatedButton(
                  // to add water.
                  onPressed: () {
                    updateData(250);
                    setState(() {
                      _water += 250;
                    });
                  },

                  // to remove water.
                  onLongPress: () {
                    updateData(-250);
                    setState(() {
                      _water -= 250;
                    });
                  },
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

            // Select timeline between WEEK, MONTH and YEAR.
            Timeline(
              onChanged: (value) {
                setState(() {
                  selectedTimeline = value;
                });
              },
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Previous.
                CIconButton(
                  image: 'assets/icons/left.svg',
                  onPressed: () => previousTimeline(),
                ),

                Niramit(
                  text: showDate(),
                  weight: FontWeight.bold,
                ),

                // Next.
                CIconButton(
                  image: 'assets/icons/right.svg',
                  onPressed: () => nextTimeline(),
                ),
              ],
            ),

            // Hydration data visualization.
            Container(
              height: size.height - 305,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: black,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Bar(
                selectedTimeline: selectedTimeline,
                target: (_water > _target) ? _water : _target,
                monday: _monday,
                month: _currentMonth,
                year: _currentYear,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// MARK: BAR
class Bar extends StatefulWidget {
  const Bar(
      {super.key,
      required this.selectedTimeline,
      required this.target,
      required this.monday,
      required this.month,
      required this.year});

  final int selectedTimeline;
  final int target;
  // Week
  final DateTime monday;
  // Month
  final DateTime month;
  // Year
  final DateTime year;

  @override
  State<Bar> createState() => _BarState();
}

class _BarState extends State<Bar> {
  var hydrationBox = Hive.box('hydrationBox');
  double _maxTargetWeek = 0;
  double _maxTargetMonth = 0;
  double _maxTargetYear = 0;
  List<int> col = [7, 6, 12];
  List<int> inc = [1, 7, 30];
  List<double> width = [35, 35, 15];

  @override
  void initState() {
    super.initState();
    updateData(0);
  }

  double getMaxY() {
    switch (widget.selectedTimeline) {
      case 0:
        return (widget.target > _maxTargetWeek.toInt())
            ? widget.target.toDouble()
            : _maxTargetWeek;
      case 1:
        return (widget.target > _maxTargetMonth.toInt())
            ? widget.target.toDouble()
            : _maxTargetMonth;
      case 2:
        return (widget.target > _maxTargetYear.toInt())
            ? widget.target.toDouble()
            : _maxTargetYear;
      default:
        return 1000000;
    }
  }

  double days(DateTime dateTime, int index) {
    // Week
    DateTime date = dateTime.add(Duration(days: index));
    String format = DateFormat('yyyy-MM-dd').format(date);
    var hydrationData = hydrationBox.get(format,
        defaultValue: HydrationData(date: date, value: 0));
    return hydrationData.value;
  }

  double updateData(int index) {
    switch (widget.selectedTimeline) {
      case 0:
        // Week
        double value = days(widget.monday, index);
        if (value > _maxTargetWeek) {
          setState(() {
            _maxTargetWeek = value;
          });
        }
        return value;
      case 1:
        // Month
        double sum = 0;
        for (int i = 5 * index; i < 5 * (index + 1); i++) {
          sum += days(widget.month, i);
        }
        if (sum > _maxTargetMonth) {
          setState(() {
            _maxTargetMonth = sum;
          });
        }
        return sum;
      case 2:
        // Year
        int noOfDays = 0;
        if (widget.year.month == DateTime.february) {
          final bool isLeapYear =
              (widget.year.year % 4 == 0) && (widget.year.year % 100 != 0) ||
                  (widget.year.year % 400 == 0);
          noOfDays = isLeapYear ? 29 : 28;
        } else {
          const List<int> daysInMonth = <int>[
            31,
            -1,
            31,
            30,
            31,
            30,
            31,
            31,
            30,
            31,
            30,
            31
          ];
          noOfDays = daysInMonth[widget.year.month - 1];
        }
        double sum = 0;
        for (int j = 0; j < noOfDays; j++) {
          sum += days(DateTime(widget.year.year, index + 1, 1), j);
        }
        if (sum > _maxTargetYear) {
          setState(() {
            _maxTargetYear = sum;
          });
        }
        return sum;
      default:
        return Random().nextInt(1000000).toDouble();
    }
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

  Widget getBottomTiles(double value, TitleMeta meta) {
    List<List<String>> days = [
      ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
      ['1-5', '6-10', '11-15', '16-20', '21-25', '26-30'],
      ['J', 'F', 'M', 'A', 'M', 'J', 'J', 'A', 'S', 'O', 'N', 'D']
    ];

    Widget text = Text(
      days[widget.selectedTimeline][value.toInt()],
      style: style,
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  AxisTitles axisTitles(dynamic getTitlesWidget, double size) {
    return AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        getTitlesWidget: getTitlesWidget,
        reservedSize: size,
      ),
    );
  }

  // Data
  BarChartData get data => BarChartData(
        maxY: getMaxY(),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: axisTitles(getBottomTiles, 30),
          leftTitles: axisTitles(getLeftTiles, 55),
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
          col[widget.selectedTimeline],
          (index) => makeGroupData(index, updateData(index)),
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

  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: (y >= widget.target) ? yellow : grey,
          borderRadius: BorderRadius.circular(10),
          width: width[widget.selectedTimeline],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(data);
  }
}
