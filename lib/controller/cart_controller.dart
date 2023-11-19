import 'package:get/get.dart';
import 'package:sample_3d/model/product.dart';

class CartListController extends GetxController{
  List<Product> products = [];

  addToCart(Product product) {
    products.add(product);
    update();
  }

  clear() {
    products.clear();
    update();
  }


}