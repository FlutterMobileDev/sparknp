import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class FrontService {
  double cur;
  static Future fetch() async {
    try {
      final response =
          await http.get('https://www.sparknp.com/api/front-data').timeout(
                Duration(
                  seconds: 15,
                ),
              );
      if (response.statusCode == 200) {
        final frontdata = jsonDecode(response.body);
        return frontdata;
      } else {
        throw Exception('error here');
      }
    } catch (e) {
      throw Exception('There was a problem connecting to the internet');
    }
  }

  static Future subcat(id) async {
    try {
      final response = await http
          .get('https://www.sparknp.com/api/subcategories/$id')
          .timeout(
            Duration(
              seconds: 15,
            ),
          );
      if (response.statusCode == 200) {
        final subcat = jsonDecode(response.body);
        return subcat;
      } else {
        throw Exception('error here');
      }
    } catch (e) {
      throw Exception('There was a problem connecting to the internet');
    }
  }

  static Future<double> converter() async {
    try {
      final response = await http.get('https://www.sparknp.com/api/currencies');

      var currency = jsonDecode(response.body);
      var c1 = currency["currency"];
      double d1 = c1[0]["value"];

      return d1;
    } catch (e) {
      throw Exception('There was a problem connecting to the internet');
    }
  }
}
