import 'package:embarcados/models/order/OrderModel.dart';
import 'package:embarcados/request/ApiConstants.dart';
import 'package:http/http.dart' as http;

class OrderRequest{
  Future<List<OrderModel>> fetchOrders() async {
    final response = await http.get(
      Uri.parse(ApiConstants.getOrders),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print("Response Order: ${response.body}");
    if (response.statusCode == 200) {
      print("Response Success: ${response.statusCode}");
      return OrderModel.parseOrders(response.body);
    } else {
      print("Response Order error: ${response.statusCode}");
      throw Exception('Unable to fetch products from the REST API');
    }
  }
  Future<OrderModel?> openOrder() async {
    try{
      List<OrderModel> allOrders = await fetchOrders();
      for(var i in allOrders){
        if(i.datetime_end != null){
          if(i.datetime_end.isNotEmpty){
            return i;
          }
        }
      }
      return null;
    }catch(e){
      print("Response Open Order error");
      throw Exception('Unable to fetch products from the REST API');
    }
  }

}