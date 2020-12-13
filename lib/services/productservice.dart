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
        return product["product"];
      } else {
        throw Exception('error here');
      }
    } catch (e) {
      throw Exception('There was a problem connecting to the internet');
    }
  }

  static Future addComment(token, data) async {
    try {
      final response = await http
          .post(
            'https://www.sparknp.com/api/products/comment',
            headers: {
              "Authorization": "Bearer $token",
              'Content-type': 'application/json',
              'Accept': 'application/json',
            },
            body: jsonEncode(data),
          )
          .timeout(
            Duration(
              seconds: 15,
            ),
          );
      if (response.statusCode == 200) {
        final product = jsonDecode(response.body);
        return product["status"];
      } else {
        throw Exception('error here');
      }
    } catch (e) {
      throw Exception('There was a problem connecting to the internet');
    }
  }

  static Future delComment(token, id) async {
    try {
      final response = await http.delete(
        'https://www.sparknp.com/api/products/comment/$id',
        headers: {
          "Authorization": "Bearer $token",
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(
        Duration(
          seconds: 15,
        ),
      );
      print(response.body);
      if (response.statusCode == 200) {
        final product = jsonDecode(response.body);
        return product["status"];
      } else {
        throw Exception('error here');
      }
    } catch (e) {
      throw Exception('There was a problem connecting to the internet');
    }
  }
}
