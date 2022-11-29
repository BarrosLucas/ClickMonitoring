// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Controller on ControllerBase, Store {
  late final _$dateStartAtom =
      Atom(name: 'ControllerBase.dateStart', context: context);

  @override
  String get dateStart {
    _$dateStartAtom.reportRead();
    return super.dateStart;
  }

  @override
  set dateStart(String value) {
    _$dateStartAtom.reportWrite(value, super.dateStart, () {
      super.dateStart = value;
    });
  }

  late final _$dateFinishAtom =
      Atom(name: 'ControllerBase.dateFinish', context: context);

  @override
  String get dateFinish {
    _$dateFinishAtom.reportRead();
    return super.dateFinish;
  }

  @override
  set dateFinish(String value) {
    _$dateFinishAtom.reportWrite(value, super.dateFinish, () {
      super.dateFinish = value;
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
dateStart: ${dateStart},
dateFinish: ${dateFinish}
    ''';
  }
}
