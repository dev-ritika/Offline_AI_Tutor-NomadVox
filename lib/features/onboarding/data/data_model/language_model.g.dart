// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LanguageModelAdapter extends TypeAdapter<LanguageModel> {
  @override
  final typeId = 1;

  @override
  LanguageModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LanguageModel(
      langCode: fields[2] as String,
      langName: fields[0] as String,
      nativeName: fields[1] as String,
      speakers: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LanguageModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.langName)
      ..writeByte(1)
      ..write(obj.nativeName)
      ..writeByte(2)
      ..write(obj.langCode)
      ..writeByte(3)
      ..write(obj.speakers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LanguageModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
