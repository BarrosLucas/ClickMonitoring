// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Controller on ControllerBase, Store {
  late final _$successChangedPassAtom =
      Atom(name: 'ControllerBase.successChangedPass', context: context);

  @override
  bool get successChangedPass {
    _$successChangedPassAtom.reportRead();
    return super.successChangedPass;
  }

  @override
  set successChangedPass(bool value) {
    _$successChangedPassAtom.reportWrite(value, super.successChangedPass, () {
      super.successChangedPass = value;
    });
  }

  late final _$requestsOKAtom =
      Atom(name: 'ControllerBase.requestsOK', context: context);

  @override
  bool get requestsOK {
    _$requestsOKAtom.reportRead();
    return super.requestsOK;
  }

  @override
  set requestsOK(bool value) {
    _$requestsOKAtom.reportWrite(value, super.requestsOK, () {
      super.requestsOK = value;
    });
  }

  late final _$passEqualsAtom =
      Atom(name: 'ControllerBase.passEquals', context: context);

  @override
  bool get passEquals {
    _$passEqualsAtom.reportRead();
    return super.passEquals;
  }

  @override
  set passEquals(bool value) {
    _$passEqualsAtom.reportWrite(value, super.passEquals, () {
      super.passEquals = value;
    });
  }

  late final _$newPAtom = Atom(name: 'ControllerBase.newP', context: context);

  @override
  TextEditingController get newP {
    _$newPAtom.reportRead();
    return super.newP;
  }

  @override
  set newP(TextEditingController value) {
    _$newPAtom.reportWrite(value, super.newP, () {
      super.newP = value;
    });
  }

  late final _$confirmNewPAtom =
      Atom(name: 'ControllerBase.confirmNewP', context: context);

  @override
  TextEditingController get confirmNewP {
    _$confirmNewPAtom.reportRead();
    return super.confirmNewP;
  }

  @override
  set confirmNewP(TextEditingController value) {
    _$confirmNewPAtom.reportWrite(value, super.confirmNewP, () {
      super.confirmNewP = value;
    });
  }

  late final _$ControllerBaseActionController =
      ActionController(name: 'ControllerBase', context: context);

  @override
  dynamic isPassEquals() {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.isPassEquals');
    try {
      return super.isPassEquals();
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validate() {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.validate');
    try {
      return super.validate();
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword() {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.setPassword');
    try {
      return super.setPassword();
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSuccessEnable(bool value) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.setSuccessEnable');
    try {
      return super.setSuccessEnable(value);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
successChangedPass: ${successChangedPass},
requestsOK: ${requestsOK},
passEquals: ${passEquals},
newP: ${newP},
confirmNewP: ${confirmNewP}
    ''';
  }
}
