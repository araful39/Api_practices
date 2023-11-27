import 'dart:convert';
import 'dart:html';

import 'package:api_practice/apiList.dart';
import 'package:api_practice/model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ServiceController {
  Future<List<JuelaryModel>> getEcommerceApi() async {
    List<JuelaryModel> apiList = [];

    String url = "https://fakestoreapi.com/products/category/jewelery";
    Response response = await http.get(Uri.parse(url));

    List<dynamic> data = jsonDecode(response.body);
    if (response.statusCode == 200) {

      for (var i in data) {
        apiList.add(JuelaryModel.fromJson(i));
      }

      return apiList;
    } else {
      print("Error");
      throw Text("Error");
    }
  }
}
