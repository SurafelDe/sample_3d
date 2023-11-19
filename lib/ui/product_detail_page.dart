import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:sample_3d/controller/product_detail_controller.dart';

import '../model/product.dart';

class ProductDetailPage extends StatelessWidget {
  late ProductDetailController productDetailController;

  ProductDetailPage({super.key}){
    productDetailController = Get.put(ProductDetailController());
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(
      builder: (controller) {
        return Scaffold(
            backgroundColor: Colors.grey.shade100,
            body: Padding(
              padding: const EdgeInsets.only(top: 60, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    controller.cartListController.products.isNotEmpty ?
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                          onTap: () {

                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            margin: const EdgeInsets.only(right: 30),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(color: Colors.grey.shade400)
                            ),
                            child: Center(
                              child: Badge(
                                label: Text(controller.cartListController.products.length.toString()),
                                child: const Icon(Icons.shopping_cart, color: Colors.black,size: 25,)),
                            ),
                          )),
                    ) : Container(),
                    // !controller.isDetailVisible ? const Spacer() : Container(),
                Stack(
                  alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 350,
                          child: PageView(
                            controller: controller.pageController,
                            onPageChanged: (index) {
                              controller.selectedColorIndex = index;
                              controller.update();
                            },
                            children: List.generate(
                                controller.product.color?.length ?? 0,
                                (index) => Hero(
                                  tag: "product",
                                  child: Stack(
                                    children: [
                                      ModelViewer(
                                            backgroundColor: Colors.grey.shade100,
                                            src: controller.product.color?[index].image ??
                                                'assets/egg_black.glb',
                                            autoRotate: true,
                                            disableZoom: true,
                                          disableTap: true,
                                          ar: false,
                                          ),
                                      Container(
                                        height: 8,
                                        width: Get.width,
                                        color: Colors.grey.shade100,
                                      )
                                    ],
                                  ),
                                )
                            ),
                          )),
                      controller.isDetailVisible ? Container()
                          : GestureDetector(
                              onTap: () {
                                controller.isDetailVisible = true;
                                controller.update();
                              },
                              child: Container(
                                color: Colors.transparent,
                                height: Get.height/2,
                                width: Get.width,
                              ),
                            ),

                    ]),
                    controller.isDetailVisible ? const Spacer() : Container(),
                controller.isDetailVisible ? Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          "Color",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                controller.product.color?.length ?? 0,
                                (index) => GestureDetector(
                                      onTap: () {
                                        controller.setColor(index);
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.all(10),
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          border: Border.all(color:(controller
                                              .product
                                              .color?[index]
                                              .isSelected ??
                                              false)
                                              ? Colors.grey.shade700 : Colors.grey.shade200, width: (controller
                                              .product
                                              .color?[index]
                                              .isSelected ??
                                              false)
                                              ? 3 : 1 ),
                                            color: Color(controller
                                                    .product
                                                    .color?[index]
                                                    .colorCode ??
                                                0xff00),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(20))),
                                        child: (controller
                                                    .product
                                                    .color?[index]
                                                    .isSelected ??
                                                false)
                                            ? Icon(
                                                Icons.done,
                                                size: 20,
                                                color: Colors.grey.shade700,
                                              )
                                            : Container(),
                                      ),
                                    ))),
                      ),
                      const Text(
                        "Size",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 30),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                controller.product.size?.length ?? 0,
                                (index) => GestureDetector(
                                      onTap: () {
                                        controller.setSize(index);
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.all(10),
                                        height: 30,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: index ==
                                                    controller
                                                        .selectedSizeIndex
                                                ? Colors.black
                                                : Colors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(8)),
                                            border: Border.all(
                                                color: index ==
                                                        controller
                                                            .selectedSizeIndex
                                                    ? Colors.black
                                                    : Colors.grey,
                                                width: index ==
                                                        controller
                                                            .selectedSizeIndex
                                                    ? 2
                                                    : 1)),
                                        child: Center(
                                          child: Text(
                                            controller.product.size?[index] ??
                                                "",
                                            style: TextStyle(
                                                color: index ==
                                                        controller
                                                            .selectedSizeIndex
                                                    ? Colors.white
                                                    : Colors.grey,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    ))),
                      ),
                      MaterialButton(
                        onPressed: () {
                          if(controller.product.color?.every((color) => !color.isSelected) ?? false) {
                            Get.snackbar("Color", "Please select color first", snackPosition: SnackPosition.BOTTOM);
                            return;
                          }

                          _showCheckoutDialog(context);
                          productDetailController.addToCart();
                        },
                        color: Colors.grey,
                        elevation: 5,
                        height: 55,
                        minWidth: double.infinity,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(10),
                        ),
                        child: controller.isLoading
                            ? const CircularProgressIndicator(color: Colors.white,) :
                        const Text('Add to Cart', style: TextStyle(color: Colors.white, fontSize: 18),),
                      )
                    ],
                  ),
                ) : Container(),
              ]),
            ));
      },
    );
  }

  void _showCheckoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              const Spacer(),
              InkWell(
                onTap: () {
                  Get.back();
                },
                  child: const Icon(Icons.clear))
            ],
          ),
          content: SizedBox(
            height: 380,
            width: Get.width-60,
            child: Column(
              children: [
                SizedBox(
                  height: 350,
                  child: Hero(
                    tag: "product",
                    child: Stack(
                      children: [
                        ModelViewer(
                          backgroundColor: Colors.white,
                          src: productDetailController.product.color?[productDetailController.selectedColorIndex].image ??
                              'assets/egg_black.glb',
                          autoRotate: true,
                          disableZoom: true,
                          disableTap: true,
                          ar: false,
                        ),
                        Container(
                          height: 10,
                          width: Get.width-60,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                const Text('Do you want to proceed to checkout?'),
              ],
            ),
          ),
          actions: <Widget>[
            MaterialButton(
              color: Colors.grey,
              onPressed: () {
                Get.back();
                _showCreditForm(context);
              },
              child: const Text('Checkout', style: TextStyle(color: Colors.white),),
            ),
          ],
        );
      },
    );
  }

  void _showCreditForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Credit Form'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Credit Card Number'),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'CVV Number'),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Expiry Date'),
              ),
              // Add other form fields as needed
              const SizedBox(height: 20),
              MaterialButton(
                color: Colors.grey,
                onPressed: () {
                  Get.back();
                  _showThankYouDialog(context);
                  productDetailController.clearCart();
                },
                child: const Text('Purchase Now', style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showThankYouDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Thank You for your purchase'),
          actions: <Widget>[
            Center(
              child: MaterialButton(
                color: Colors.grey,
                onPressed: () {

                  productDetailController.isDetailVisible = false;
                  Get.back();
                },
                child: const Text('Close', style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        );
      },
    );
  }
}
