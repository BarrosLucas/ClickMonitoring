import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store {
  @observable
  var startsList = ObservableList<String>();
  
  @observable
  var finishesList = ObservableList<String>();

  @observable
  var stopsList = ObservableList<int>();
  
  @action 
  loadData(){
    startsList.add("01/10/2020 01:01:00");
    startsList.add("03/10/2020 01:01:00");
    startsList.add("05/10/2020 01:01:00");
    startsList.add("06/10/2020 01:01:00");
    
    finishesList.add("02/10/2020 01:01:00");
    finishesList.add("EM TRÂNSITO");
    finishesList.add("06/10/2020 01:01:00");
    finishesList.add("06/10/2020 02:01:00");

    stopsList.add(15);
    stopsList.add(13);
    stopsList.add(10);
    stopsList.add(2);
  }
}