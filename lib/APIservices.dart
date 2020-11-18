import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:sparknp/model/frontjson.dart';

class Services {
  static Future<ApiFront> fetch() async {
    try {
      final response = await http.get(
        'https://sparknp.com/api/front-data',
        // headers: {HttpHeaders.authorizationHeader: token.toString()}
      );
      if (response.statusCode == 200) {
        final ApiFront front = apiFrontFromJson(response.body);
        return front;
      } else {
        throw Exception('Error !200');
      }
    } catch (e) {
      throw Exception('There was a problem connectting to the internet');
    }
  }
}
