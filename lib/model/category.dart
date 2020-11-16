class Category {
  int id;
  String name;
  List subcat;
  String image;
  bool isSelected;
  Category(
      {this.id, this.name, this.subcat, this.isSelected = false, this.image});
}
