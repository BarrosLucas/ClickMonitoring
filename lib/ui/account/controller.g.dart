// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Controller on ControllerBase, Store {
  late final _$accountAtom =
      Atom(name: 'ControllerBase.account', context: context);

  @override
  BusinessModel? get account {
    _$accountAtom.reportRead();
    return super.account;
  }

  @override
  set account(BusinessModel? value) {
    _$accountAtom.reportWrite(value, super.account, () {
      super.account = value;
    });
  }

  late final _$pageAtom = Atom(name: 'ControllerBase.page', context: context);

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  late final _$loadInfoAccountAsyncAction =
      AsyncAction('ControllerBase.loadInfoAccount', context: context);

  @override
  Future<bool> loadInfoAccount() {
    return _$loadInfoAccountAsyncAction.run(() => super.loadInfoAccount());
  }

  late final _$ControllerBaseActionController =
      ActionController(name: 'ControllerBase', context: context);

  @override
  dynamic setPage(int p) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.setPage');
    try {
      return super.setPage(p);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
account: ${account},
page: ${page}
    ''';
  }
}
