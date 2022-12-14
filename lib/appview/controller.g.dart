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

  late final _$userAtom = Atom(name: 'ControllerBase.user', context: context);

  @override
  BusinessModel? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(BusinessModel? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$measuresAtom =
      Atom(name: 'ControllerBase.measures', context: context);

  @override
  List<MeasureModel>? get measures {
    _$measuresAtom.reportRead();
    return super.measures;
  }

  @override
  set measures(List<MeasureModel>? value) {
    _$measuresAtom.reportWrite(value, super.measures, () {
      super.measures = value;
    });
  }

  late final _$orderAtom = Atom(name: 'ControllerBase.order', context: context);

  @override
  OrderModel? get order {
    _$orderAtom.reportRead();
    return super.order;
  }

  @override
  set order(OrderModel? value) {
    _$orderAtom.reportWrite(value, super.order, () {
      super.order = value;
    });
  }

  late final _$lastMeasureAtom =
      Atom(name: 'ControllerBase.lastMeasure', context: context);

  @override
  MeasureModel? get lastMeasure {
    _$lastMeasureAtom.reportRead();
    return super.lastMeasure;
  }

  @override
  set lastMeasure(MeasureModel? value) {
    _$lastMeasureAtom.reportWrite(value, super.lastMeasure, () {
      super.lastMeasure = value;
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

  late final _$loadingInfoAtom =
      Atom(name: 'ControllerBase.loadingInfo', context: context);

  @override
  bool get loadingInfo {
    _$loadingInfoAtom.reportRead();
    return super.loadingInfo;
  }

  @override
  set loadingInfo(bool value) {
    _$loadingInfoAtom.reportWrite(value, super.loadingInfo, () {
      super.loadingInfo = value;
    });
  }

  late final _$visibleDialogAtom =
      Atom(name: 'ControllerBase.visibleDialog', context: context);

  @override
  bool get visibleDialog {
    _$visibleDialogAtom.reportRead();
    return super.visibleDialog;
  }

  @override
  set visibleDialog(bool value) {
    _$visibleDialogAtom.reportWrite(value, super.visibleDialog, () {
      super.visibleDialog = value;
    });
  }

  late final _$originAtom =
      Atom(name: 'ControllerBase.origin', context: context);

  @override
  TextEditingController get origin {
    _$originAtom.reportRead();
    return super.origin;
  }

  @override
  set origin(TextEditingController value) {
    _$originAtom.reportWrite(value, super.origin, () {
      super.origin = value;
    });
  }

  late final _$destinyAtom =
      Atom(name: 'ControllerBase.destiny', context: context);

  @override
  TextEditingController get destiny {
    _$destinyAtom.reportRead();
    return super.destiny;
  }

  @override
  set destiny(TextEditingController value) {
    _$destinyAtom.reportWrite(value, super.destiny, () {
      super.destiny = value;
    });
  }

  late final _$newOrderAsyncAction =
      AsyncAction('ControllerBase.newOrder', context: context);

  @override
  Future newOrder() {
    return _$newOrderAsyncAction.run(() => super.newOrder());
  }

  late final _$verifyOrderAsyncAction =
      AsyncAction('ControllerBase.verifyOrder', context: context);

  @override
  Future verifyOrder() {
    return _$verifyOrderAsyncAction.run(() => super.verifyOrder());
  }

  late final _$loadInfoAsyncAction =
      AsyncAction('ControllerBase.loadInfo', context: context);

  @override
  Future loadInfo() {
    return _$loadInfoAsyncAction.run(() => super.loadInfo());
  }

  late final _$ControllerBaseActionController =
      ActionController(name: 'ControllerBase', context: context);

  @override
  dynamic setVisibilityDialog(bool visibility) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.setVisibilityDialog');
    try {
      return super.setVisibilityDialog(visibility);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

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
user: ${user},
measures: ${measures},
order: ${order},
lastMeasure: ${lastMeasure},
newDeliveryPageVisible: ${newDeliveryPageVisible},
loadingInfo: ${loadingInfo},
visibleDialog: ${visibleDialog},
origin: ${origin},
destiny: ${destiny}
    ''';
  }
}
