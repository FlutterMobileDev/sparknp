import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class ProductService {
  static Future fetch(id) async {
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
        final product = jsonDecode(response.body);
        return product;
      } else {
        throw Exception('error here');
      }
    } catch (e) {
      throw Exception('There was a problem connecting to the internet');
    }
  }
}
