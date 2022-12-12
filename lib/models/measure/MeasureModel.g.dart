// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MeasureModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeasureModel _$MeasureModelFromJson(Map<String, dynamic> json) => MeasureModel(
      json['id'] as String,
      json['order'] as String,
      json['latitude'] as String,
      json['longitude'] as String,
      json['timestamp'] as String,
      json['updated'] as String,
      json['created'] as String,
      (json['temperature'] as num).toDouble(),
      (json['speed'] as num).toDouble(),
      (json['umidity'] as num).toDouble(),
    );

Map<String, dynamic> _$MeasureModelToJson(MeasureModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'timestamp': instance.timestamp,
      'updated': instance.updated,
      'created': instance.created,
      'temperature': instance.temperature,
      'speed': instance.speed,
      'umidity': instance.umidity,
    };
