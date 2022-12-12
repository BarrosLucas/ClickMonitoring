// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OrderModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      json['id'] as String,
      json['longitude_destiny'] as String,
      json['latitude_destiny'] as String,
      json['latitude_origin'] as String,
      json['longitude_origin'] as String,
      json['datetime_start'] as String,
      json['datetime_end'] as String,
      json['vehicle_id'] as String,
      json['description'] as String,
      json['business'] as String,
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'longitude_destiny': instance.longitude_destiny,
      'latitude_destiny': instance.latitude_destiny,
      'latitude_origin': instance.latitude_origin,
      'longitude_origin': instance.longitude_origin,
      'datetime_start': instance.datetime_start,
      'datetime_end': instance.datetime_end,
      'vehicle_id': instance.vehicle_id,
      'description': instance.description,
      'business': instance.business,
    };
