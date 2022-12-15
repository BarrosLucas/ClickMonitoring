import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'DeviceModel.g.dart';

@JsonSerializable()
class DeviceModel{
  final int id;
  final bool used;
  final String updated;
  final String created;
  final int business;

  DeviceModel(this.id, this.used, this.updated, this.created, this.business);

  static List<DeviceModel> parseDevices(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<DeviceModel>((json) => DeviceModel.fromJson(json)).toList();
  }

  factory DeviceModel.fromJson(Map<String,dynamic> data) => _$DeviceModelFromJson(data);

  Map<String,dynamic> toJson() => _$DeviceModelToJson(this);
}