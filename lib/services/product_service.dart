import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:simple_ecommerce/models/product_model.dart';

class ProductService {
  String baseURL = 'http://10.0.2.2:8000/api';

  Future<List<ProductModel>> getProducts() async {
    var url = Uri.parse("$baseURL/products");
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<ProductModel> products = [];

      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }

      return products;
    } else {
      throw Exception('Failed to get products');
    }
  }
}
