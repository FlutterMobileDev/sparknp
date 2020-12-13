import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class UserService {
  static Future fetch(id, token) async {
    try {
      final response = await http.get('https://www.sparknp.com/api/users/$id',
          headers: {"Authorization": "Bearer $token"}).timeout(
        Duration(
          seconds: 15,
        ),
      );
      if (response.statusCode == 200) {
        final user = jsonDecode(response.body);
        return user["user"];
      } else {
        throw Exception('error here');
      }
    } catch (e) {
      throw Exception('There was a problem connecting to the internet');
    }
  }
}
