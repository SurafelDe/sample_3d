import 'package:get/get.dart';
import 'package:sample_3d/controller/cart_controller.dart';
import 'package:sample_3d/ui/product_detail_page.dart';
import '../model/product.dart';

class ProductListController extends GetxController {
  List<Product> products = [];

  @override
  void onInit() {
    products = [
      Product(
          name: "Egg",
          description: "High quality eggs",
          image: "assets/egg_black.glb",
          size: ["S","M", "L"],
          color: [
            ProductColor(name: "Black", colorCode: 0xff000000, image: "assets/egg_black.glb"),
            ProductColor(name: "Grey", colorCode: 0xff808080, image: "assets/egg_grey.glb"),
            ProductColor(name: "White", colorCode: 0xffFFFFFF, image: "assets/egg_white.glb")
          ],
          price: 50
      ),
      // Product(
      //     name: "Hiking Shoe (Boots)",
      //     description: "High quality hiking boats for all",
      //     image: "assets/shoe_brown.glb",
      //     size: ["S","M", "L"],
      //     color: [
      //       ProductColor(name: "Brown", colorCode: 0xff1654242, image: "assets/shoe_brown.glb"),
      //       ProductColor(name: "Black", colorCode: 0xff000000, image: "assets/shoe_black.glb")
      //     ],
      //     price: 2500),
      // Product(
      //     name: "Male Running Shirt",
      //     description: "Sport T-shirts for men",
      //     image: "assets/tshirt_black.glb",
      //     size: ["S","M", "L"],
      //     color: [
      //       ProductColor(name: "Black", colorCode: 0xff000000, image: "assets/tshirt_black.glb"),
      //       ProductColor(name: "Grey", colorCode: 0xff808080, image: "assets/tshirt_grey.glb")
      //     ],
      //     price: 1200),
      // Product(
      //     name: "Backpack",
      //     description: "Suitable backpacks for students",
      //     image: "assets/bag_red.glb",
      //     size: ["S","M", "L"],
      //     color: [
      //       ProductColor(name: "Red", colorCode: 0xffF44336, image: "assets/bag_red.glb"),
      //       ProductColor(name: "Black", colorCode: 0xff000000, image: "assets/bag_black.glb")
      //     ],
      //     price: 1650),
    ];

    update();
    super.onInit();
  }

}
