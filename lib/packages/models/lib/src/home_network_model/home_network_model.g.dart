// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_network_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeNetworkModelAdapter extends TypeAdapter<HomeNetworkModel> {
  @override
  final int typeId = 0;

  @override
  HomeNetworkModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeNetworkModel(
      customName: fields[0] as String,
      nameHomeWifiNetwork: fields[1] as String,
      nameFromListListWifiName: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HomeNetworkModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.customName)
      ..writeByte(1)
      ..write(obj.nameHomeWifiNetwork)
      ..writeByte(2)
      ..write(obj.nameFromListListWifiName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeNetworkModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
