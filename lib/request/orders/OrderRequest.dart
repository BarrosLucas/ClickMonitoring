import 'dart:convert';

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
        if(i.delivered==false){
          print("Entrega em aberto:");
          print(i.toJson());
          return i;
        }
      }
      return null;
    }catch(e){
      print("Response Open Order error");
      throw Exception('Unable to fetch products from the REST API');
    }
  }

  Future<bool> newOrder(OrderModel orderModel) async {
    print("Request: ${jsonEncode(orderModel.toJson())}");

    final response = await http.post(
      Uri.parse(ApiConstants.newOrder),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        "description":orderModel.description,
        "vehicle":1,
        "business":orderModel.business,
        "delivered":false,
        "latitude_origin":"123",
        "longitude_origin":"123",
        "latitude_destiny":"456",
        "longitude_destiny":"456"
      }),
    );

    if(response.statusCode == 200){
      print("New order success");
      return true;
    }
    print("New order fail - Request error: ${response.body}");
    print("New order fail - Request error: ${response.statusCode}");
    return false;
  }

  Future<bool> endOrder(OrderModel orderModel) async {
    print("Request: ${jsonEncode(orderModel.toJson())}");

    print("URL: ${ApiConstants.endOrder.replaceAll("id", "${orderModel.id}")}");

    final response = await http.put(
      Uri.parse(ApiConstants.endOrder.replaceAll("id", "${orderModel.id}")),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, bool>{
        "delivered":true
      }),
    );

    if(response.statusCode == 200){
      print("New order success");
      return true;
    }
    print("New order fail - Request error: ${response.body}");
    print("New order fail - Request error: ${response.statusCode}");
    return false;
  }
}