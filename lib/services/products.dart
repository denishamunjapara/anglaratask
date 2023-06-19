import 'package:anglaratask/apimanager.dart';
import 'package:anglaratask/constant.dart';
import 'package:anglaratask/services/productdetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../modals/productmodal.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({super.key, this.categoryProductLIST});
  List<ProductsModal>? categoryProductLIST = [];
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    // ApiManager().getProducts().then((value) => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [productLIST()],
        ),
      ),
    );
  }

  productLIST() {
    return Expanded(
        child: GridView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.categoryProductLIST?.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          mainAxisExtent: 290),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Get.to(SingleProduct(
              singleProduct: widget.categoryProductLIST?[index],
            ));
          },
          child: Card(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 250,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: Container(
                            height: 140,
                            width: 150,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              child: widget.categoryProductLIST?[index].image !=
                                      null
                                  ? Image.network(
                                      widget.categoryProductLIST?[index]
                                              .image ??
                                          "",
                                      fit: BoxFit.fill)
                                  : Image.asset(
                                      'Assets/billi.jpeg',
                                      fit: BoxFit.fill,
                                    ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 15,
                          child: Text(
                            widget.categoryProductLIST?[index].title ?? "",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Appcolors.blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 11),
                          ),
                        ),
                        Text(
                          '${widget.categoryProductLIST?[index].category}'
                                  .capitalizeFirst ??
                              "",
                          style: TextStyle(
                              color: Appcolors.blackColor, fontSize: 11),
                        ),
                        Text(
                          '₹${widget.categoryProductLIST?[index].price}',
                          style: TextStyle(
                              color: Appcolors.blackColor, fontSize: 22),
                        ),
                        Text(
                          "FREE Delivery by Anglara",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Appcolors.greyColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 11),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 15,
                  right: 15,
                  child: Container(
                    height: 25,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 204, 204, 204),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Shop Now',
                          style: TextStyle(
                              color: Appcolors.blackColor,
                              fontWeight: FontWeight.w300,
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
    ));
  }

  // productGRID() {
  //   return Expanded(
  //       child: GridView.builder(
  //           // controller: scrollcontrollerGridview,
  //           physics: const AlwaysScrollableScrollPhysics(),
  //           shrinkWrap: true,
  //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //               crossAxisCount: 2,
  //               crossAxisSpacing: 8,
  //               mainAxisSpacing: 8,
  //               mainAxisExtent: 250),
  //           itemCount: 5,
  //           itemBuilder: (context, index) {
  //             return InkWell(
  //               onTap: () {
  //                 Get.to(SingleProduct());
  //               },
  //               child: Card(
  //                 child: Stack(
  //                   children: [
  //                     Container(
  //                       height: 250,
  //                       width: double.infinity,
  //                       //color: Appcolors.greyColor,
  //                       child: ClipRRect(
  //                         borderRadius: const BorderRadius.only(
  //                             topLeft: Radius.circular(10),
  //                             topRight: Radius.circular(10)),
  //                         child: Image.asset(
  //                           'Assets/billi.jpeg',
  //                           fit: BoxFit.fill,
  //                         ),
  //                       ),
  //                     ),
  //                     Positioned(
  //                       bottom: 0,
  //                       left: 10,
  //                       right: 10,
  //                       child: Container(
  //                         height: 35,
  //                         width: 200,
  //                         color: Colors.white,
  //                         child: Align(
  //                           alignment: Alignment.center,
  //                           child: Padding(
  //                             padding: const EdgeInsets.only(left: 10),
  //                             child: Text(
  //                               'Add to Cart',
  //                               style: TextStyle(
  //                                   color: Appcolors.blackColor,
  //                                   fontWeight: FontWeight.w300,
  //                                   fontSize: 20),
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     )
  //                   ],
  //                 ),

  //                 // Container(
  //                 //   decoration: BoxDecoration(
  //                 //     borderRadius: BorderRadius.circular(12),
  //                 //     //color: Colors.redAccent.shade100
  //                 //   ),
  //                 //   child: Column(
  //                 //     crossAxisAlignment: CrossAxisAlignment.start,
  //                 //     children: [
  //                 //       ClipRRect(
  //                 //           borderRadius: const BorderRadius.only(
  //                 //               topLeft: Radius.circular(10),
  //                 //               topRight: Radius.circular(10)),
  //                 //           child: Image.asset(
  //                 //             'Assets/billi.jpeg',
  //                 //             fit: BoxFit.fill,
  //                 //             height: 250,
  //                 //             width: double.infinity,
  //                 //           )),
  //                 //       const SizedBox(
  //                 //         height: 7,
  //                 //       ),
  //                 //       Padding(
  //                 //         padding: const EdgeInsets.only(left: 10),
  //                 //         child: Text(
  //                 //           'Title',
  //                 //           maxLines: 2,
  //                 //           style: TextStyle(
  //                 //               fontSize: 12,
  //                 //               color: Appcolors.blackColor,
  //                 //               fontWeight: FontWeight.bold),
  //                 //         ),
  //                 //       ),
  //                 //       Padding(
  //                 //         padding: const EdgeInsets.only(left: 10),
  //                 //         child: Text(
  //                 //           "Price",
  //                 //           maxLines: 2,
  //                 //           style: TextStyle(
  //                 //             fontSize: 12,
  //                 //             color: Appcolors.blackColor,
  //                 //           ),
  //                 //         ),
  //                 //       )
  //                 //     ],
  //                 //   ),
  //                 // ),
  //               ),
  //             );
  //           }));
  // }
}
