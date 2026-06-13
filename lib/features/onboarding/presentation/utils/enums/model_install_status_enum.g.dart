// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_install_status_enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelInstallStatusEnumAdapter
    extends TypeAdapter<ModelInstallStatusEnum> {
  @override
  final typeId = 4;

  @override
  ModelInstallStatusEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ModelInstallStatusEnum.Queued;
      case 1:
        return ModelInstallStatusEnum.Downloading;
      case 2:
        return ModelInstallStatusEnum.Downloaded;
      default:
        return ModelInstallStatusEnum.Queued;
    }
  }

  @override
  void write(BinaryWriter writer, ModelInstallStatusEnum obj) {
    switch (obj) {
      case ModelInstallStatusEnum.Queued:
        writer.writeByte(0);
      case ModelInstallStatusEnum.Downloading:
        writer.writeByte(1);
      case ModelInstallStatusEnum.Downloaded:
        writer.writeByte(2);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelInstallStatusEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
