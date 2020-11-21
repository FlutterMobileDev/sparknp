import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:sparknp/model/cartmodel.dart';

String token =
    "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5IiwianRpIjoiOTE4OTAwN2JjYTY1YjQ3YzEyZDNmODcyMGVmMjJiZmM3NzVjZDQ1YzRhMDMwODc0YmZlYTI4NGU0MmRmYThmNGNlMmE1YTQzNDQ0NmVlZjQiLCJpYXQiOjE2MDU1OTQwNDAsIm5iZiI6MTYwNTU5NDA0MCwiZXhwIjoxNjM3MTMwMDQwLCJzdWIiOiI0MiIsInNjb3BlcyI6W119.C92gRrrz9lYdhY3AZMaoP0ceOTNUAPevsl_-3wuT8i-4-zhznqyOnlLNkfWHChx1iKGPi8g34qrFmSra2bw6_sH3QFbVQAQcNpoITwnxTPcVKFQXim_mOZ628B04KELwtdhZVnXftmZQhkX3SkQhEUIaAnoezNIRuELowcas3LaucXaXGLkzd88JwuzLSP0sFFdMLkoE3rW0wpTdh_JGlFh5D-gRX5IbDef6s0-3JZKNUzJltRtxqTWosPDAXfB180b6K2Wec5m40W3ivoHO0_u2N-QoKLs-0bLCiAYj35QcGE5bXuayP63o4ALnmsc-7_1pFlXFY1DonaKQ3VP3YlRzctgj4pNLt4WFz8WRsB0RAcxD2FsdUivLmIiKsfw0Vi25u2fcv_uKO1IJFzU36l7pOwp7CuPb_hP55SpaSYUP1ilzL_Moump1gO25W5RdDu6lGOh68gLTp9O910qgD-44Dqn_mPy92HzxM6xjCXzB-bRE0B_NT0IBM5SfHnaTnWZt3N58zULVvKlAw6VpKNeCcAMZIaDkD2ZpI-JilosknFdu5r3HA4WEyVUGyuosRynb_hWxE0VSid-Qz9hmSapUlRssav9Y3-C4CUN6YxH0ZVyAcW_dCtkNgDFr8doGijEBCYEyH_ZMrDAhXLP2UhYLsNQZEqfbLmVWQTfUlLY";

class CartService {
  static Future<Cart> list() async {
    try {
      final response = await http.get('https://www.sparknp.com/api/carts',
          headers: {"Authorization": "Bearer $token"}).timeout(
        Duration(
          seconds: 15,
        ),
      );
      if (response.statusCode == 200) {
        final Cart cart = cartFromJson(response.body);
        return cart;
      } else {
        throw Exception('error here');
      }
    } catch (e) {
      throw Exception('There was a problem connecting to the internet');
    }
  }
}
