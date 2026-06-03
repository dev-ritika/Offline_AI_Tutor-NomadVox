// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LevelDataModelAdapter extends TypeAdapter<LevelDataModel> {
  @override
  final typeId = 2;

  @override
  LevelDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LevelDataModel(
      code: fields[0] as String,
      title: fields[1] as String,
      subTitle: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LevelDataModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.subTitle);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LevelDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
