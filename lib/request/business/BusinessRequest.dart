import 'package:embarcados/models/businesses/BusinessModel.dart';
import 'package:embarcados/request/ApiConstants.dart';
import 'package:http/http.dart' as http;

class BusinessRequest{
  Future<List<BusinessModel>> fetchBusiness() async {
    final response = await http.get(
      Uri.parse(ApiConstants.getBusiness),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 202) {
      return BusinessModel.parseBusiness(response.body);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }

  Future<BusinessModel> getBusinessUser() async{
    List<BusinessModel> users = await fetchBusiness();
    return users.elementAt(0);
  }
}