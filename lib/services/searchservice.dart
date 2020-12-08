import 'dart:convert';

import 'package:http/http.dart' as http;

class SearchService {
  static Future getlist(String nameProduct) async {
    try {
      String url = 'https://www.sparknp.com/api/products/search';
      var response = await http.post(url, headers: {
        'Accept': 'application/json',
      }, body: {
        "name": nameProduct
      });
      var searchdata = jsonDecode(response.body);
      return searchdata;
    } catch (e) {
      throw Exception('There was a problem connecting to the internet');
    }
  }
}
