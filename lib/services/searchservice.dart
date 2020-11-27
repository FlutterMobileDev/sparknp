import 'package:http/http.dart' as http;

import 'package:sparknp/model/searchmodel.dart';

class SearchService {
  static Future<SearchProducts> getlist(String nameProduct) async {
    try {
      String url = 'https://www.sparknp.com/api/products/search';
      var response = await http.post(url, headers: {
        'Accept': 'application/json',
      }, body: {
        "name": nameProduct
      });

      final SearchProducts products = searchProductsFromJson(response.body);
      return products;
    } catch (e) {
      throw Exception('There was a problem connecting to the internet');
    }
  }
}
