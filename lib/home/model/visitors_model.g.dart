// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitors_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VisitorsAdapter extends TypeAdapter<Visitors> {
  @override
  final int typeId = 0;

  @override
  Visitors read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Visitors(
      firstname: fields[0] as String,
      lastname: fields[1] as String,
      key: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Visitors obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.firstname)
      ..writeByte(1)
      ..write(obj.lastname)
      ..writeByte(2)
      ..write(obj.key);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VisitorsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
