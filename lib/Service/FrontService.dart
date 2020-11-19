import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:sparknp/model/frontjson.dart';

class Services{
static Future<ApiFront> fetch() async{
  try{
    final response = await http.get('url');
    if (response.statusCode == 200) {
      final ApiFront frontdata  = apiFrontFromJson(response.body) ;
      return frontdata;
    } else{
      throw Exception('error hero');
    }

  }catch(e){
    print(e);
  }

}
}