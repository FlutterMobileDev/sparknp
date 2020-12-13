import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class UserService {
  static Future fetch(id, token) async {
    try {
      final response =
          await http.get('https://www.sparknp.com/api/users/$id', headers: {
        "Authorization": "Bearer $token",
        'Content-type': 'application/json',
        'Accept': 'application/json',
      }).timeout(
        Duration(
          seconds: 15,
        ),
      );
      print(response.body);
      if (response.statusCode == 200) {
        final user = jsonDecode(response.body);
        print(user);
        return user["user"];
      } else {
        throw Exception('error here');
      }
    } catch (e) {
      throw Exception('There was a problem connecting to the internet');
    }
  }
}
