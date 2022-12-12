import 'package:embarcados/models/measure/MeasureModel.dart';
import 'package:embarcados/request/ApiConstants.dart';
import 'package:http/http.dart' as http;

class MeasureRequest{
  Future<List<MeasureModel>> fetchBusiness() async {
    final response = await http.get(
      Uri.parse(ApiConstants.getBusiness),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 202) {
      return MeasureModel.parseMeasures(response.body);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }
}