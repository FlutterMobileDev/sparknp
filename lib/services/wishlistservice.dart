import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class WishlistService {
  static Future list(token) async {
    try {
      final response = await http.get('https://www.sparknp.com/api/wishlists',
          headers: {"Authorization": "Bearer $token"}).timeout(
        Duration(
          seconds: 15,
        ),
      );
      if (response.statusCode == 200) {
        final wishlist = jsonDecode(response.body);
        return wishlist["wishlists"];
      } else {
        throw Exception('error here');
      }
    } catch (e) {
      throw Exception('There was a problem connecting to the internet');
    }
  }

  static Future<bool> add(token, id) async {
    try {
      final response = await http.get(
        'https://www.sparknp.com/api/wishlists/addwish/$id',
        headers: {"Authorization": "Bearer $token"},
      ).timeout(
        Duration(
          seconds: 15,
        ),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('error here');
      }
    } catch (e) {
      throw Exception('There was a problem connecting to the internet');
    }
  }

  static Future<bool> remove(token, id) async {
    try {
      final response = await http.get(
        'https://www.sparknp.com/api/wishlists/removewish/$id',
        headers: {"Authorization": "Bearer $token"},
      ).timeout(
        Duration(
          seconds: 15,
        ),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('error here');
      }
    } catch (e) {
      throw Exception('There was a problem connecting to the internet');
    }
  }
}
