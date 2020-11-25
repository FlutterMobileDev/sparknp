import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sparknp/model/cartmodel.dart';

class CartService {
  static Future<Cart> list(token) async {
    try {
      final response = await http.get('https://www.sparknp.com/api/carts',
          headers: {"Authorization": "Bearer $token"}).timeout(
        Duration(
          seconds: 15,
        ),
      );
      if (response.statusCode == 200) {
        final Cart cart = cartFromJson(response.body);
        return cart;
      } else {
        throw Exception('error here');
      }
    } catch (e) {
      throw Exception('There was a problem connecting to the internet');
    }
  }

  static Future add(token, id) async {
    try {
      final response = await http.post(
        'https://www.sparknp.com/api/carts/store',
        headers: {"Authorization": "Bearer $token"},
        body: {"id": "$id"},
      ).timeout(
        Duration(
          seconds: 15,
        ),
      );
      if (response.statusCode == 200) {
      } else {
        throw Exception('error here');
      }
    } catch (e) {
      throw Exception('There was a problem connecting to the internet');
    }
  }

  static Future remove(token, id) async {
    try {
      final response = await http.get(
        'https://www.sparknp.com/api/carts/reduce/$id',
        headers: {"Authorization": "Bearer $token"},
      ).timeout(
        Duration(
          seconds: 15,
        ),
      );
      if (response.statusCode == 200) {
      } else {
        throw Exception('error here');
      }
    } catch (e) {
      throw Exception('There was a problem connecting to the internet');
    }
  }

  static Future destroy(token, id) async {
    try {
      final response = await http.delete(
        'https://www.sparknp.com/api/carts/$id',
        headers: {"Authorization": "Bearer $token"},
      ).timeout(
        Duration(
          seconds: 15,
        ),
      );
      if (response.statusCode == 200) {
      } else {
        throw Exception('error here');
      }
    } catch (e) {
      throw Exception('There was a problem connecting to the internet');
    }
  }

  static Future process(token, data) async {
    try {
      final response = await http
          .post(
            'https://www.sparknp.com/api/processcart/cashondelivery',
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
        var data = jsonDecode(response.body);
        return data;
      } else {
        print(response.body);
        throw Exception('error here');
      }
    } catch (e) {
      print(e);
      throw Exception('There was a problem connecting to the internet');
    }
  }
}
