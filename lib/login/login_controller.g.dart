// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on ControllerBase, Store {
  late final _$loadingAtom =
      Atom(name: 'ControllerBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$successAtom =
      Atom(name: 'ControllerBase.success', context: context);

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  late final _$userInputControllerAtom =
      Atom(name: 'ControllerBase.userInputController', context: context);

  @override
  TextEditingController get userInputController {
    _$userInputControllerAtom.reportRead();
    return super.userInputController;
  }

  @override
  set userInputController(TextEditingController value) {
    _$userInputControllerAtom.reportWrite(value, super.userInputController, () {
      super.userInputController = value;
    });
  }

  late final _$passInputControllerAtom =
      Atom(name: 'ControllerBase.passInputController', context: context);

  @override
  TextEditingController get passInputController {
    _$passInputControllerAtom.reportRead();
    return super.passInputController;
  }

  @override
  set passInputController(TextEditingController value) {
    _$passInputControllerAtom.reportWrite(value, super.passInputController, () {
      super.passInputController = value;
    });
  }

  late final _$doLoginAsyncAction =
      AsyncAction('ControllerBase.doLogin', context: context);

  @override
  Future doLogin() {
    return _$doLoginAsyncAction.run(() => super.doLogin());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
success: ${success},
userInputController: ${userInputController},
passInputController: ${passInputController}
    ''';
  }
}
