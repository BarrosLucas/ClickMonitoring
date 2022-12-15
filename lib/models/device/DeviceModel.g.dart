// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DeviceModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceModel _$DeviceModelFromJson(Map<String, dynamic> json) => DeviceModel(
      json['id'] as int,
      json['used'] as bool,
      json['updated'] as String,
      json['created'] as String,
      json['business'] as int,
    );

Map<String, dynamic> _$DeviceModelToJson(DeviceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'used': instance.used,
      'updated': instance.updated,
      'created': instance.created,
      'business': instance.business,
    };
