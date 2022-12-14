// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Controller on ControllerBase, Store {
  late final _$timesAtom = Atom(name: 'ControllerBase.times', context: context);

  @override
  ObservableList<String> get times {
    _$timesAtom.reportRead();
    return super.times;
  }

  @override
  set times(ObservableList<String> value) {
    _$timesAtom.reportWrite(value, super.times, () {
      super.times = value;
    });
  }

  late final _$healthAtom =
      Atom(name: 'ControllerBase.health', context: context);

  @override
  ObservableList<String> get health {
    _$healthAtom.reportRead();
    return super.health;
  }

  @override
  set health(ObservableList<String> value) {
    _$healthAtom.reportWrite(value, super.health, () {
      super.health = value;
    });
  }

  late final _$temperatureAtom =
      Atom(name: 'ControllerBase.temperature', context: context);

  @override
  ObservableList<String> get temperature {
    _$temperatureAtom.reportRead();
    return super.temperature;
  }

  @override
  set temperature(ObservableList<String> value) {
    _$temperatureAtom.reportWrite(value, super.temperature, () {
      super.temperature = value;
    });
  }

  late final _$measuresAtom =
      Atom(name: 'ControllerBase.measures', context: context);

  @override
  ObservableList<MeasureModel> get measures {
    _$measuresAtom.reportRead();
    return super.measures;
  }

  @override
  set measures(ObservableList<MeasureModel> value) {
    _$measuresAtom.reportWrite(value, super.measures, () {
      super.measures = value;
    });
  }

  late final _$loadDataHistoryAsyncAction =
      AsyncAction('ControllerBase.loadDataHistory', context: context);

  @override
  Future<bool> loadDataHistory(OrderModel order) {
    return _$loadDataHistoryAsyncAction.run(() => super.loadDataHistory(order));
  }

  @override
  String toString() {
    return '''
times: ${times},
health: ${health},
temperature: ${temperature},
measures: ${measures}
    ''';
  }
}
