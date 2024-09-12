import 'dart:convert';

import 'package:ecommerce/model/product_model.dart';
import 'package:http/http.dart' as http;

class FetchProducts {
  final url = "https://fakestoreapi.com/products";
  Future getProducts() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var productsData = jsonDecode(response.body);
      var productsList = productsData.map<ProductModel>((prd) {
        return ProductModel.fromjson(prd);
      }).toList();
      return productsList;
    }
    return [];
  }
}
