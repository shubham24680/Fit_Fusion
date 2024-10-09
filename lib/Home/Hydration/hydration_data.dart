import 'package:hive/hive.dart';

part 'hydration_data.g.dart';

@HiveType(typeId: 1)
class HydrationData {
  @HiveField(0)
  final DateTime date;
  @HiveField(1)
  double value;

  HydrationData({required this.date, required this.value});
}
