import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store {
  @observable
  var times = ObservableList<String>();

  @observable
  var health = ObservableList<String>();

  @observable
  var temperature = ObservableList<String>();

  @action
  loadData(){
    times.add("01/10/2020 01:01:00");
    times.add("03/10/2020 01:01:00");
    times.add("05/10/2020 01:01:00");
    times.add("06/10/2020 01:01:00");

    health.add("NÃO SAUDÁVEL");
    health.add("SAUDÁVEL");
    health.add("SAUDÁVEL");
    health.add("NÃO SAUDÁVEL");

    temperature.add("-15");
    temperature.add("-12");
    temperature.add("-2");
    temperature.add("5");
  }
}