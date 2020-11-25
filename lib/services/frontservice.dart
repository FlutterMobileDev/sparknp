import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:sparknp/model/frontjson.dart';
import 'package:sparknp/model/subcategorymodel.dart';

class FrontService {
  static Future<ApiFront> fetch() async {
    try {
      final response =
          await http.get('https://www.sparknp.com/api/front-data').timeout(
                Duration(
                  seconds: 15,
                ),
              );
      if (response.statusCode == 200) {
        final ApiFront frontdata = apiFrontFromJson(response.body);
        return frontdata;
      } else {
        throw Exception('error here');
      }
    } catch (e) {
      throw Exception('There was a problem connecting to the internet');
    }
  }

  static Future<Subcat> subcat(id) async {
    try {
      print(id);
      final response = await http
          .get('https://www.sparknp.com/api/subcategories/$id')
          .timeout(
            Duration(
              seconds: 15,
            ),
          );
      if (response.statusCode == 200) {
        final Subcat subcat = subcatFromJson(response.body);
        return subcat;
      } else {
        print(response.body);
        throw Exception('error here');
      }
    } catch (e) {
      throw Exception('There was a problem connecting to the internet');
    }
  }
}
