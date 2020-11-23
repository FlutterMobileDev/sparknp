import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:sparknp/model/ordersmodel.dart';

class OrdersService {
  static Future<Orders> list(token) async {
    try {
      final response = await http.get(
          'https://www.sparknp.com/api/orders/trackings/OMhE1605280338',
          headers: {"Authorization": "Bearer $token"}).timeout(
        Duration(
          seconds: 15,
        ),
      );
      if (response.statusCode == 200) {
        final Orders orders = ordersFromJson(response.body);
        return orders;
      } else {
        throw Exception('error here');
      }
    } catch (e) {
      throw Exception('There was a problem connecting to the internet');
    }
  }
}
