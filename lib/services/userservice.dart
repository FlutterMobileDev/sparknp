import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class UserService {
  static Future fetch(id) async {
    final user = [];
    for (int i = 0; i < id.length; i++) {
      try {
        final response = await http
            .get('https://www.sparknp.com/api/users/${id[i]}', headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        }).timeout(
          Duration(
            seconds: 15,
          ),
        );
        if (response.statusCode == 200) {
          user.add(jsonDecode(response.body));
        } else {
          throw Exception('error here');
        }
      } catch (e) {
        throw Exception('There was a problem connecting to the internet');
      }
    }
    return user;
  }
}
