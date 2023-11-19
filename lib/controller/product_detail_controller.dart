import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_3d/controller/product_list_controller.dart';
import 'package:sample_3d/model/product.dart';

import 'cart_controller.dart';

class ProductDetailController extends GetxController{
  ProductDetailController(){
    currentAnimation = product.image;
  }
  CartListController cartListController  = Get.find();


  final PageController pageController = PageController();

  Product product = Product();

  bool isFavorite = false;

  bool _isDetailVisible = false;
  bool get isDetailVisible => _isDetailVisible;
  set isDetailVisible(bool value) {
    _isDetailVisible = value;
    update();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  String? currentAnimation;

  int selectedSizeIndex = 0;
  int selectedColorIndex = 0;

  @override
  void onInit() {
    product =
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
      );


    update();
    super.onInit();
  }
  setSize(int index){
    selectedSizeIndex = index;
    update();
  }

  setColor(int index){
    product.color?.forEach((color) {
      color.isSelected = false;
    });
    product.color?[index].isSelected = true;
    currentAnimation = product.color?[index].image;

    pageController.jumpToPage(index);
    update();
  }

  addToCart() {

      cartListController.addToCart(
          Product(
              name: product.name,
              image: product.color?.firstWhere((color) => color.isSelected).image,
              description: product.description,
              price: product.price,
              size: [product.size?[selectedSizeIndex] ?? ""],
              color: [product.color?.firstWhere((color) => color.isSelected) ?? ProductColor()]
          )
      );

      update();
  }

  clearCart() {
    cartListController.clear();
    update();
  }



}