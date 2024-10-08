import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product_model.dart';

class ApiService {
  static var client = http.Client();

  static Future<List<Welcome>?> fetchProducts() async {
    var response = await client.get(
      Uri.parse('https://fakestoreapi.com/products'),
    );

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return List<Welcome>.from(
          json.decode(jsonString).map((x) => Welcome.fromJson(x)));
    } else {
      return null;
    }
  }
}
