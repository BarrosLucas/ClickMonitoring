// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Controller on ControllerBase, Store {
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

  late final _$newDeliveryPageVisibleAtom =
      Atom(name: 'ControllerBase.newDeliveryPageVisible', context: context);

  @override
  bool get newDeliveryPageVisible {
    _$newDeliveryPageVisibleAtom.reportRead();
    return super.newDeliveryPageVisible;
  }

  @override
  set newDeliveryPageVisible(bool value) {
    _$newDeliveryPageVisibleAtom
        .reportWrite(value, super.newDeliveryPageVisible, () {
      super.newDeliveryPageVisible = value;
    });
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
  dynamic setPageVisibleNewDelivery(bool newValue) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.setPageVisibleNewDelivery');
    try {
      return super.setPageVisibleNewDelivery(newValue);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
page: ${page},
newDeliveryPageVisible: ${newDeliveryPageVisible}
    ''';
  }
}
