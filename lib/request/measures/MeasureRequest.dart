import 'package:embarcados/models/measure/MeasureModel.dart';
import 'package:embarcados/request/ApiConstants.dart';
import 'package:embarcados/request/orders/OrderRequest.dart';
import 'package:http/http.dart' as http;

class MeasureRequest{
  Future<List<MeasureModel>> fetchMeasures() async {
    final response = await http.get(
      Uri.parse(ApiConstants.getMeasures),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print("Response Measure: ${response.body}");
    if (response.statusCode == 200) {
      print("Response Measure Success: ${response.statusCode}");
      return MeasureModel.parseMeasures(response.body);
    } else {
      print("Response Measure error: ${response.statusCode}");
      throw Exception('Unable to fetch products from the REST API');
    }
  }

  Future<List<MeasureModel>> getMeasuresByOrder(String order)async{
    try{
      List<MeasureModel> allMeasures = await fetchMeasures();
      List<MeasureModel> measuresOrder = [];
      for(var i in allMeasures){
        if(i.order == order){
          measuresOrder.add(i);
        }
      }
      return measuresOrder;
    }catch(e){
      print(e.toString());
      print("Measure by order error");
      throw Exception('Unable to fetch products from the REST API');
    }
  }

  Future<MeasureModel?> getLastMeasureOpenOrder()async{
    try{
      String order = "";
      await OrderRequest().openOrder().then((value){
        if(value != null){
          order = value.id;
        }
      });
      if(order.isNotEmpty){
        List<MeasureModel> allMeasures = await getMeasuresByOrder(order);
        if(allMeasures.isNotEmpty){
          MeasureModel lastMeasure = allMeasures.first;
          for(var i in allMeasures){
            if(i.created.compareTo(lastMeasure.created) > 0){
              lastMeasure = i;
            }
          }
          return lastMeasure;
        }
      }
      return null;
    }catch(e){
      print("last measure open order");
      throw Exception('Unable to fetch products from the REST API');
    }
  }
}