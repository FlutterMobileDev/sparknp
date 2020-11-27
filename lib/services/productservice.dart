import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:sparknp/model/productmodel.dart';

class ProductService {
  static Future<ProductDetails> fetch(id) async {
    try {
      print("id");
      print(id);
      final response =
          await http.get('https://www.sparknp.com/api/products/$id').timeout(
                Duration(
                  seconds: 15,
                ),
              );
      if (response.statusCode == 200) {
        final ProductDetails product = productDetailsFromJson(response.body);
        return product;
      } else {
        throw Exception('error here');
      }
    } catch (e) {
      throw Exception('There was a problem connecting to the internet');
    }
  }
}
