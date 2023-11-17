import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_3d/controller/cart_controller.dart';
import 'package:sample_3d/ui/product_detail_page.dart';
import 'package:sample_3d/ui/product_list_page.dart';

void main() {
  initApp();

  runApp(GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: ProductDetailPage()//ProductListPage()
  ));
}

initApp() {
  Get.put(CartListController());
}
