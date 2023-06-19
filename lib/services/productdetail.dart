import 'package:anglaratask/apimanager.dart';
import 'package:anglaratask/constant.dart';
import 'package:anglaratask/reusablefiles/appbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modals/productmodal.dart';

class SingleProduct extends StatefulWidget {
  SingleProduct({super.key, this.singleProduct});
  ProductsModal? singleProduct;
  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Of Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  // height: 250,
                  //width: devicewidth - 16,
                  // width: double.infinity,
                  width: 250,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: widget.singleProduct?.image != null
                          ? Image.network(
                              widget.singleProduct?.image ?? "",
                              fit: BoxFit.fill,
                              height: 250,
                            )
                          : Image.asset(
                              'Assets/billi.jpeg',
                              fit: BoxFit.fill,
                            )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 350,
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  widget.singleProduct?.title ?? "",
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 25,
                      color: Appcolors.greyColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                overflow: TextOverflow.ellipsis,
                "₹${widget.singleProduct?.price}",
                maxLines: 2,
                style: TextStyle(
                    fontSize: 25,
                    color: Appcolors.blackColor,
                    fontWeight: FontWeight.bold),
              ),
              Text('${widget.singleProduct?.category}'.capitalizeFirst ?? ''),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade300,
                    child: const Icon(
                      Icons.list,
                      size: 20,
                      color: Colors.black45,
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade300,
                    child: const Icon(
                      Icons.heart_broken_outlined,
                      size: 20,
                      color: Colors.black45,
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade300,
                    child: const Icon(
                      Icons.save,
                      size: 20,
                      color: Colors.black45,
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade300,
                    child: const Icon(
                      Icons.star,
                      size: 20,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Product Details',
                maxLines: 2,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.singleProduct?.description ?? "",
                maxLines: null,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppButton(
                      height: 40,
                      onPressed: () async {
                        //jay shree krishna
                        var findedID = cartList.any((element) =>
                            element.id == widget.singleProduct?.id);
                        print(widget.singleProduct?.id);
                        print(findedID);
                        if (findedID) {
                          Get.snackbar("already added to cart", " message");
                        } else {
                          Get.snackbar("added to cart", " message");
                          await ApiManager().shoppingCart(widget.singleProduct);
                        }
                      },
                      text: 'Add To Cart',
                      width: 170),
                  AppButton(
                      height: 40,
                      onPressed: () {},
                      text: 'Buy Now',
                      width: 170),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
