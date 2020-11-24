import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:sparknp/model/wishlistmodel.dart';

class WishlistService {
  static Future<Wishlist> list(token) async {
    try {
      final response = await http.get('https://www.sparknp.com/api/wishlists',
          headers: {"Authorization": "Bearer $token"}).timeout(
        Duration(
          seconds: 15,
        ),
      );
      if (response.statusCode == 200) {
        final Wishlist wishlist = wishlistFromJson(response.body);
        return wishlist;
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
