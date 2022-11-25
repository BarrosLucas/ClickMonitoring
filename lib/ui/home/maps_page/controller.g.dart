// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Controller on ControllerBase, Store {
  late final _$visibleAtom =
      Atom(name: 'ControllerBase.visible', context: context);

  @override
  bool get visible {
    _$visibleAtom.reportRead();
    return super.visible;
  }

  @override
  set visible(bool value) {
    _$visibleAtom.reportWrite(value, super.visible, () {
      super.visible = value;
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

  late final _$ControllerBaseActionController =
      ActionController(name: 'ControllerBase', context: context);

  @override
  dynamic setDescription(String description) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.setDescription');
    try {
      return super.setDescription(description);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSpeed(double speed) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.setSpeed');
    try {
      return super.setSpeed(speed);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTemperature(double temperature) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.setTemperature');
    try {
      return super.setTemperature(temperature);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setHumidity(double humidity) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.setHumidity');
    try {
      return super.setHumidity(humidity);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setStatus(String status) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.setStatus');
    try {
      return super.setStatus(status);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setVisible(bool visible, String description, double speed,
      double temperature, double humidity, String status) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.setVisible');
    try {
      return super.setVisible(
          visible, description, speed, temperature, humidity, status);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
visible: ${visible},
description: ${description},
speed: ${speed},
temperature: ${temperature},
humidity: ${humidity},
status: ${status}
    ''';
  }
}
