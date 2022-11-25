import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store{
  @observable
  bool visible = false;

  @observable
  String description = "";

  @observable
  double speed = 0.0;

  @observable
  double temperature = 0.0;

  @observable
  double humidity = 0.0;

  @observable
  String status = "Ativo";

  @action
  setDescription(String description){
    this.description = "Entrega de carne para o mercadinho";
  }

  @action
  setSpeed(double speed){
    this.speed = 10.0;
  }

  @action
  setTemperature(double temperature){
    this.temperature = -20;
  }

  @action
  setHumidity(double humidity){
    this.humidity = humidity;
  }

  @action
  setStatus(String status){
    this.status = status;
  }

  @action
  setVisible(bool visible, String description, double speed, double temperature,
      double humidity, String status){
    setDescription(description);
    setSpeed(speed);
    setTemperature(temperature);
    setHumidity(humidity);
    setStatus(status);
    this.visible = visible;
  }
}