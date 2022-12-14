import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'MeasureModel.g.dart';

@JsonSerializable()
class MeasureModel{
  final String id;
  final String order;
  final String latitude;
  final String longitude;
  final String timestamp;
  final DateTime updated;
  final DateTime created;
  final double temperature;
  final double speed;
  final double umidity;

  MeasureModel(this.id, this.order, this.latitude, this.longitude,
      this.timestamp, this.updated, this.created, this.temperature,
      this.speed, this.umidity);

  static List<MeasureModel> parseMeasures(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<MeasureModel>((json) => MeasureModel.fromJson(json)).toList();
  }

  factory MeasureModel.fromJson(Map<String,dynamic> data) => _$MeasureModelFromJson(data);

  Map<String,dynamic> toJson() => _$MeasureModelToJson(this);
}