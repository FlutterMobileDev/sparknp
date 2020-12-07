import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class OrdersService {
  static Future list(token) async {
    try {
      final response = await http.get('https://www.sparknp.com/api/orders/',
          headers: {"Authorization": "Bearer $token"}).timeout(
        Duration(
          seconds: 15,
        ),
      );
      if (response.statusCode == 200) {
        print(response.statusCode);

        var orders = jsonDecode(response.body);
        // print(orders['orders'][0]["cart"][0]["size"]);
        return orders;
      } else {
        throw Exception('error here');
      }
    } catch (e) {
      throw Exception('There was a problem connecting to the internet');
    }
  }
}
