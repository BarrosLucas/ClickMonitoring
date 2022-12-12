import 'dart:convert';

import 'package:embarcados/models/businesses/BusinessModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'BusinessModel.g.dart';

@JsonSerializable()
class BusinessModel{
  final String id;
  final String name;
  final String cnpj;
  final String contact;
  final String razao_social;
  final String endereco_base;
  final String url_logo;
  final String email;
  final String password;
  final String updated;
  final String created;

  BusinessModel(this.id, this.name, this.cnpj, this.contact, this.razao_social,
      this.endereco_base, this.url_logo, this.email, this.password,
      this.updated, this.created);

  static List<BusinessModel> parseBusiness(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<BusinessModel>((json) => BusinessModel.fromJson(json)).toList();
  }

  factory BusinessModel.fromJson(Map<String,dynamic> data) => _$BusinessModelFromJson(data);

  Map<String,dynamic> toJson() => _$BusinessModelToJson(this);
}