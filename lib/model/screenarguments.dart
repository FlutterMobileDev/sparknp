import 'package:sparknp/model/frontjson.dart';

class ScreenArguments {
  final String name;
  final ApiFront front;
  final int id;
  final Category category;
  final bool isMulti;
  final String token;
  final int index;

  const ScreenArguments(
      {this.name, this.front, this.id, this.category, this.isMulti,this.token,this.index,});
}
