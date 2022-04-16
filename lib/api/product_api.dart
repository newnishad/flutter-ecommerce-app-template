import 'dart:convert';

import 'package:ecommerce_template/api/api.dart';
import 'package:ecommerce_template/models/product.dart';
import 'package:http/http.dart' as http;

class ProductApi extends Api {
  Future<List<Product>> getProducts() async {
    try {
      final String api = basePath + "v1/02e91d9f-4d8c-4eb4-a4f9-bb4a60ffdaf9";
      http.Response response = await http.get(Uri.parse(api));
      var responseDecoded = jsonDecode(response.body);
      List<dynamic> productsJson = responseDecoded['products'];
      List<Product> products =
          productsJson.map((e) => Product.fromJson(e)).toList();
      return products;
    } catch (e) {
      return <Product>[];
    }
  }
}
