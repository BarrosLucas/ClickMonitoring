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

  late final _$emailAtom = Atom(name: 'ControllerBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$enableButtonAtom =
      Atom(name: 'ControllerBase.enableButton', context: context);

  @override
  bool get enableButton {
    _$enableButtonAtom.reportRead();
    return super.enableButton;
  }

  @override
  set enableButton(bool value) {
    _$enableButtonAtom.reportWrite(value, super.enableButton, () {
      super.enableButton = value;
    });
  }

  late final _$currentPasswordAtom =
      Atom(name: 'ControllerBase.currentPassword', context: context);

  @override
  String get currentPassword {
    _$currentPasswordAtom.reportRead();
    return super.currentPassword;
  }

  @override
  set currentPassword(String value) {
    _$currentPasswordAtom.reportWrite(value, super.currentPassword, () {
      super.currentPassword = value;
    });
  }

  late final _$currentPAtom =
      Atom(name: 'ControllerBase.currentP', context: context);

  @override
  TextEditingController get currentP {
    _$currentPAtom.reportRead();
    return super.currentP;
  }

  @override
  set currentP(TextEditingController value) {
    _$currentPAtom.reportWrite(value, super.currentP, () {
      super.currentP = value;
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
email: ${email},
enableButton: ${enableButton},
currentPassword: ${currentPassword},
currentP: ${currentP},
newP: ${newP},
confirmNewP: ${confirmNewP}
    ''';
  }
}
