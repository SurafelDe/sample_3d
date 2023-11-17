import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:sample_3d/ui/product_detail_page.dart';

import '../controller/cart_controller.dart';

class CartListPage extends StatelessWidget {
  const CartListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartListController>(
      builder: (controller) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 25),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 50),
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            }, child: Container(
                          height: 40, width: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(Radius.circular(8)),
                              border: Border.all(color: Colors.grey.shade400)

                          ),
                          child: const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Icon(Icons.arrow_back_ios, color: Colors.black,size: 18,)
                          ),
                        )),
                        const SizedBox(width: 20,),
                        const Text(
                          "Cart List",
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        GestureDetector(
                            onTap: () {
                              Get.defaultDialog(
                                title: "Delete?",
                                content: Center(
                                  child: Text(
                                    "Clear all items from the cart?",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    child: Text('Yes'.tr, style: TextStyle(color: Colors.yellow.shade600,),),
                                    onPressed: () {
                                      controller.products.clear();
                                    },
                                  ),
                                ],
                                onWillPop: () async => false,
                              );
                            },
                            child: Container(
                          height: 40, width: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(Radius.circular(8)),
                              border: Border.all(color: Colors.grey.shade400)

                          ),
                          child: Icon(Icons.delete, color: Colors.black,size: 20,),
                        )),
                      ],
                    ),
                  ),

                  controller.products.isNotEmpty ? Container() :
                      Center(child: Column(
                        children: [
                          Lottie.asset("assets/empty_cart.json"),
                          SizedBox(height: 20,),
                          const Text(
                            "Empty cart",
                            style: TextStyle(fontSize: 25, ),
                          )
                        ],
                      )),

                  ...List.generate(
                    controller.products.length,
                        (index) => InkWell(
                          onTap: (){
                            // Get.to(()=> ProductDetailPage(controller.products[index], true));
                          },
                          child: Row(
                          children: [
                            Flexible(
                                flex: 3,
                                fit: FlexFit.tight,
                                child: SizedBox(
                                  height: 100,
                                  child: ModelViewer(
                                    backgroundColor: Colors.white,
                                    src: controller.products[index].image ?? 'assets/egg_black.glb',
                                    autoRotate: false,
                                    disableZoom: true,
                                  ),
                                )
                            ),

                            Flexible(
                              flex: 7,
                              fit: FlexFit.tight,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.products[index].name ?? "Item $index",
                                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 5,),
                                  Text(
                                    controller.products[index].description ?? "",
                                    style: const TextStyle(fontSize: 15, color: Colors.grey),
                                  ),
                                  const SizedBox(height: 5,),
                                  Text(
                                    "\$ ${controller.products[index].price}",
                                    style: const TextStyle(fontSize: 20, color: Colors.blueAccent, fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(height: 5,),
                                  const Text('See Details', style: TextStyle(fontSize: 15, decoration: TextDecoration.underline),)
                                ],
                              ),
                            ),
                          ]),
                        ),
                  ),
                ]
              ),
            ));
      },
    );
  }
}
