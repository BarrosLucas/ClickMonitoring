import 'package:json_annotation/json_annotation.dart';
part 'DeviceModel.g.dart';

@JsonSerializable()
class DeviceModel{
  final String id;
  final bool used;
  final String updated;
  final String created;
  final String business;

  DeviceModel(this.id, this.used, this.updated, this.created, this.business);

  factory DeviceModel.fromJson(Map<String,dynamic> data) => _$DeviceModelFromJson(data);

  Map<String,dynamic> toJson() => _$DeviceModelToJson(this);
}