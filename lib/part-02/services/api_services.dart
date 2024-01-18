import 'dart:convert';



import 'package:api_practice/part-02/model/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiService {
  List<ProductListModel> postList = [];
  Future<List<ProductListModel>> getProduct() async {

    String url =
        "https://api.escuelajs.co/api/v1/categories?fbclid=IwAR0NSIEzyJbH49dGBxBoD7hnVQQfkKOQDVuTEEzq8noiftLR2DdVsRbr61Q";
    try {




      Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var decode = jsonDecode(response.body);
        for (var i in decode) {
          postList.add(ProductListModel.fromJson(i));

        }
        // print(postList.runtimeType);
        return postList;

      } else {
        // print("Data not found");
        return throw ("Data not found");
      }
    }

    on Exception {
      rethrow;
    }
  }
}
