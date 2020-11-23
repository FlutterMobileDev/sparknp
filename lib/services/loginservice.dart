import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:sparknp/model/frontjson.dart';

class FrontService {
  static Future login() async {
    try {
      final response =
          await http.get('https://www.sparknp.com/api/app-register').timeout(
                Duration(
                  seconds: 15,
                ),
              );
      if (response.statusCode == 200) {
        final ApiFront frontdata = apiFrontFromJson(response.body);
        return frontdata;
      } else {
        throw Exception('error hero');
      }
    } catch (e) {
      throw Exception('There was a problem connecting to the internet');
    }
  }
}
