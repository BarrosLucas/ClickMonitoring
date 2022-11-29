// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Controller on ControllerBase, Store {
  late final _$cnpjAtom = Atom(name: 'ControllerBase.cnpj', context: context);

  @override
  String get cnpj {
    _$cnpjAtom.reportRead();
    return super.cnpj;
  }

  @override
  set cnpj(String value) {
    _$cnpjAtom.reportWrite(value, super.cnpj, () {
      super.cnpj = value;
    });
  }

  late final _$socialReasonAtom =
      Atom(name: 'ControllerBase.socialReason', context: context);

  @override
  String get socialReason {
    _$socialReasonAtom.reportRead();
    return super.socialReason;
  }

  @override
  set socialReason(String value) {
    _$socialReasonAtom.reportWrite(value, super.socialReason, () {
      super.socialReason = value;
    });
  }

  late final _$headOfficeAtom =
      Atom(name: 'ControllerBase.headOffice', context: context);

  @override
  String get headOffice {
    _$headOfficeAtom.reportRead();
    return super.headOffice;
  }

  @override
  set headOffice(String value) {
    _$headOfficeAtom.reportWrite(value, super.headOffice, () {
      super.headOffice = value;
    });
  }

  late final _$ControllerBaseActionController =
      ActionController(name: 'ControllerBase', context: context);

  @override
  dynamic load() {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.load');
    try {
      return super.load();
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cnpj: ${cnpj},
socialReason: ${socialReason},
headOffice: ${headOffice}
    ''';
  }
}
