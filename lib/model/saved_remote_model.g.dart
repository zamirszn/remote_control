// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_remote_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SavedRemoteModelAdapter extends TypeAdapter<SavedRemoteModel> {
  @override
  final int typeId = 0;

  @override
  SavedRemoteModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SavedRemoteModel(
      customName: fields[0] as String,
      icon: fields[1] as String,
      remote: (fields[2] as Map).cast<String, dynamic>(),
      type: fields[3] as String,
      id: fields[4] as String?,
      brand: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SavedRemoteModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.customName)
      ..writeByte(1)
      ..write(obj.icon)
      ..writeByte(2)
      ..write(obj.remote)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.brand);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SavedRemoteModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
