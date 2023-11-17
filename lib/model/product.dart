class Product {

  String? name;
  String? description;
  String? image;
  List<String>? size;
  List<ProductColor>? color;
  double? price;

  Product({this.name, this.description, this.image, this.size, this.color, this.price});
}

class ProductColor {
  String? name;
  int? colorCode;
  String? image;
  bool isSelected = false;

  ProductColor({this.name, this.image, this.colorCode});
}