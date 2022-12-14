// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Controller on ControllerBase, Store {
  late final _$measuresAtom =
      Atom(name: 'ControllerBase.measures', context: context);

  @override
  ObservableList<MeasureModel>? get measures {
    _$measuresAtom.reportRead();
    return super.measures;
  }

  @override
  set measures(ObservableList<MeasureModel>? value) {
    _$measuresAtom.reportWrite(value, super.measures, () {
      super.measures = value;
    });
  }

  late final _$coordinatesAtom =
      Atom(name: 'ControllerBase.coordinates', context: context);

  @override
  ObservableList<gMap.LatLng> get coordinates {
    _$coordinatesAtom.reportRead();
    return super.coordinates;
  }

  @override
  set coordinates(ObservableList<gMap.LatLng> value) {
    _$coordinatesAtom.reportWrite(value, super.coordinates, () {
      super.coordinates = value;
    });
  }

  late final _$centerAtom =
      Atom(name: 'ControllerBase.center', context: context);

  @override
  gMap.LatLng get center {
    _$centerAtom.reportRead();
    return super.center;
  }

  @override
  set center(gMap.LatLng value) {
    _$centerAtom.reportWrite(value, super.center, () {
      super.center = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: 'ControllerBase.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$speedAtom = Atom(name: 'ControllerBase.speed', context: context);

  @override
  double get speed {
    _$speedAtom.reportRead();
    return super.speed;
  }

  @override
  set speed(double value) {
    _$speedAtom.reportWrite(value, super.speed, () {
      super.speed = value;
    });
  }

  late final _$temperatureAtom =
      Atom(name: 'ControllerBase.temperature', context: context);

  @override
  double get temperature {
    _$temperatureAtom.reportRead();
    return super.temperature;
  }

  @override
  set temperature(double value) {
    _$temperatureAtom.reportWrite(value, super.temperature, () {
      super.temperature = value;
    });
  }

  late final _$humidityAtom =
      Atom(name: 'ControllerBase.humidity', context: context);

  @override
  double get humidity {
    _$humidityAtom.reportRead();
    return super.humidity;
  }

  @override
  set humidity(double value) {
    _$humidityAtom.reportWrite(value, super.humidity, () {
      super.humidity = value;
    });
  }

  late final _$driverAtom =
      Atom(name: 'ControllerBase.driver', context: context);

  @override
  String get driver {
    _$driverAtom.reportRead();
    return super.driver;
  }

  @override
  set driver(String value) {
    _$driverAtom.reportWrite(value, super.driver, () {
      super.driver = value;
    });
  }

  late final _$statusAtom =
      Atom(name: 'ControllerBase.status', context: context);

  @override
  String get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(String value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$updateAsyncAction =
      AsyncAction('ControllerBase.update', context: context);

  @override
  Future update(OrderModel order) {
    return _$updateAsyncAction.run(() => super.update(order));
  }

  late final _$loadDataAsyncAction =
      AsyncAction('ControllerBase.loadData', context: context);

  @override
  Future<bool> loadData(OrderModel order) {
    return _$loadDataAsyncAction.run(() => super.loadData(order));
  }

  @override
  String toString() {
    return '''
measures: ${measures},
coordinates: ${coordinates},
center: ${center},
description: ${description},
speed: ${speed},
temperature: ${temperature},
humidity: ${humidity},
driver: ${driver},
status: ${status}
    ''';
  }
}
