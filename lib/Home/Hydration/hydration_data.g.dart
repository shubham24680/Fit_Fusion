// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hydration_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HydrationDataAdapter extends TypeAdapter<HydrationData> {
  @override
  final int typeId = 1;

  @override
  HydrationData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HydrationData(
      date: fields[0] as DateTime,
      value: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, HydrationData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HydrationDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}