import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:sample_3d/ui/product_detail_page.dart';

import '../controller/cart_controller.dart';
import '../controller/product_list_controller.dart';
import 'cart_list_page.dart';

class ProductListPage extends StatelessWidget {
  ProductListPage({super.key});

  final PageController _pageController = PageController();
  CartListController cartListController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListController>(
      init: Get.put(ProductListController()),
      builder: (controller) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.only(top: 100, bottom: 20),
              child: PageView(
                controller: _pageController,
                children: List.generate(
                  controller.products.length,
                  (index) => Stack(
                      children: [
                    Center(
                      child: SizedBox(
                          height: Get.height/2,
                          width: Get.width * 0.8,
                          child: ModelViewer(
                            backgroundColor: Colors.white,
                            src: controller.products[index].image ??
                                'assets/egg_black.glb',
                            autoRotate: true,
                            disableZoom: true,
                            // autoPlay: true,
                            // autoRotateDelay: 0,
                            // disableTap: true,
                            // cameraControls: false,
                          )),
                    ),
                        InkWell(
                          onTap: () {
                            // Get.to(() => ProductDetailPage(
                            //     controller.products[index], false
                            // ));
                          },
                          child: SizedBox(
                            height: Get.height,
                            width: Get.width,
                          ),
                        ),

                  ]),
                ),
              ),
            ),
            // floatingActionButton:
            // cartListController.products.isNotEmpty ? Badge(
            //   label: Text(cartListController.products.length.toString()),
            //   isLabelVisible: cartListController.products.isNotEmpty,
            //   child: FloatingActionButton(
            //     onPressed: () {
            //       Get.to(() => const CartListPage());
            //     },
            //     child: const Icon(Icons.shopping_cart),
            //   ),
            // ) : Container()
        );
      },
    );
  }
}
