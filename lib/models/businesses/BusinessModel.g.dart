// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BusinessModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessModel _$BusinessModelFromJson(Map<String, dynamic> json) =>
    BusinessModel(
      json['id'] as int,
      json['name'] as String,
      json['cnpj'] as String,
      json['contact'] as String,
      json['razao_social'] as String,
      json['endereco_base'] as String,
      json['url_logo'] as String,
      json['email'] as String,
      json['password'] as String,
      json['updated'] as String,
      json['created'] as String,
    );

Map<String, dynamic> _$BusinessModelToJson(BusinessModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cnpj': instance.cnpj,
      'contact': instance.contact,
      'razao_social': instance.razao_social,
      'endereco_base': instance.endereco_base,
      'url_logo': instance.url_logo,
      'email': instance.email,
      'password': instance.password,
      'updated': instance.updated,
      'created': instance.created,
    };
