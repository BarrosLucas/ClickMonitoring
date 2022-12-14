import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'OrderModel.g.dart';

@JsonSerializable()
class OrderModel{
  final int id;
  final String longitude_destiny;
  final String latitude_destiny;
  final String latitude_origin;
  final String longitude_origin;
  final String datetime_start;
  final String datetime_end;
  final int vehicle_id;
  final String description;
  final int business;
  final bool delivered;

  OrderModel(this.id, this.longitude_destiny, this.latitude_destiny,
      this.latitude_origin, this.longitude_origin, this.datetime_start,
      this.datetime_end, this.vehicle_id, this.description, this.business,this.delivered);

  static List<OrderModel> parseOrders(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<OrderModel>((json) => OrderModel.fromJson(json)).toList();
  }

  factory OrderModel.fromJson(Map<String,dynamic> data) => _$OrderModelFromJson(data);

  Map<String,dynamic> toJson() => _$OrderModelToJson(this);
}