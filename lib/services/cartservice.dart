import 'dart:async';

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
        print(id);
      } else {
        throw Exception('error here');
      }
    } catch (e) {
      throw Exception('There was a problem connecting to the internet');
    }
  }
}
