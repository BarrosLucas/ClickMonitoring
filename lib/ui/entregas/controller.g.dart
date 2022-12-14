// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Controller on ControllerBase, Store {
  late final _$startsListAtom =
      Atom(name: 'ControllerBase.startsList', context: context);

  @override
  ObservableList<String> get startsList {
    _$startsListAtom.reportRead();
    return super.startsList;
  }

  @override
  set startsList(ObservableList<String> value) {
    _$startsListAtom.reportWrite(value, super.startsList, () {
      super.startsList = value;
    });
  }

  late final _$finishesListAtom =
      Atom(name: 'ControllerBase.finishesList', context: context);

  @override
  ObservableList<String> get finishesList {
    _$finishesListAtom.reportRead();
    return super.finishesList;
  }

  @override
  set finishesList(ObservableList<String> value) {
    _$finishesListAtom.reportWrite(value, super.finishesList, () {
      super.finishesList = value;
    });
  }

  late final _$stopsListAtom =
      Atom(name: 'ControllerBase.stopsList', context: context);

  @override
  ObservableList<int> get stopsList {
    _$stopsListAtom.reportRead();
    return super.stopsList;
  }

  @override
  set stopsList(ObservableList<int> value) {
    _$stopsListAtom.reportWrite(value, super.stopsList, () {
      super.stopsList = value;
    });
  }

  late final _$loadDataAsyncAction =
      AsyncAction('ControllerBase.loadData', context: context);

  @override
  Future loadData() {
    return _$loadDataAsyncAction.run(() => super.loadData());
  }

  @override
  String toString() {
    return '''
startsList: ${startsList},
finishesList: ${finishesList},
stopsList: ${stopsList}
    ''';
  }
}
