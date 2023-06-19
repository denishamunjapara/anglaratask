import 'package:anglaratask/apimanager.dart';
import 'package:anglaratask/constant.dart';
import 'package:anglaratask/reusablefiles/appbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: cartList != null
              ? Column(
                  children: [cartLIST()],
                )
              : Center(
                  child: Text(
                    'Shopping Cart Is Empty',
                    style: TextStyle(color: Appcolors.greyColor, fontSize: 17),
                  ),
                )),
    );
  }

  cartLIST() {
    return Expanded(
      child: ListView.builder(
        //controller: scrollcontroller,
        itemCount: cartList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Card(
              child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      titleAlignment: ListTileTitleAlignment.center,
                      //tileColor: Color.fromARGB(255, 204, 204, 204),
                      leading: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10)),
                          height: 77,
                          width: 77,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              cartList[index].image ?? "",
                              fit: BoxFit.fill,
                              height: 250,
                              width: double.infinity,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.image);
                              },
                            ),
                          )),
                      title: SizedBox(
                        width: 200,
                        child: Text(
                          cartList[index].title ?? "",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style:
                              TextStyle(fontSize: 12, color: Colors.blueGrey),
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '₹${cartList[index].price}',
                            style: const TextStyle(fontSize: 15),
                          ),
                          Text(
                            cartList[index].category ?? "",
                            style: const TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppButton(
                            onPressed: () {
                              setState(() {
                                cartList.removeAt(index);
                              });
                            },
                            text: 'Delete',
                            height: 23,
                            width: 75,
                            fontSize: 12,
                          ),
                          AppButton(
                            onPressed: () {
                              Get.back();
                            },
                            text: 'Back',
                            height: 23,
                            width: 75,
                            fontSize: 12,
                          )
                        ],
                      )
                      // Text(
                      //   "#50,000",
                      //   overflow: TextOverflow.ellipsis,
                      //   maxLines: 2,
                      //   style: const TextStyle(fontSize: 14),
                      // ),
                      )
                  //  Row(
                  //   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     Container(
                  //         decoration: BoxDecoration(
                  //             color: Colors.grey,
                  //             borderRadius: BorderRadius.circular(10)),
                  //         height: 77,
                  //         width: 77,
                  //         child: ClipRRect(
                  //           borderRadius: BorderRadius.circular(10),
                  //           child:
                  //               // Image(
                  //               //   image: NetworkImage(
                  //               //     ApiUrls.imagebaseURL +
                  //               //         ((searchtext!.isEmpty
                  //               //                 ? popularmovieList[index]
                  //               //                     .posterPath
                  //               //                 : widget.searchResult[index]
                  //               //                     .posterPath) ??
                  //               //             ""),
                  //               //   ),
                  //               //   fit: BoxFit.fill,
                  //               //   height: 250,
                  //               //   width: double.infinity,
                  //               //   errorBuilder: (context, error, stackTrace) {
                  //               //     return Icon(Icons.image);
                  //               //   },
                  //               // )

                  //               Image.network(
                  //             ("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJosD4wy3NeESy0N_IIAsD97yaDBctbuhwaA&usqp=CAU"),
                  //             fit: BoxFit.fill,
                  //             height: 250,
                  //             width: double.infinity,
                  //             errorBuilder: (context, error, stackTrace) {
                  //               return const Icon(Icons.image);
                  //             },
                  //           ),
                  //         )),
                  //     const SizedBox(
                  //       width: 10,
                  //     ),
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           SizedBox(
                  //             width: 200,
                  //             child: Text(
                  //               "originalTitle",
                  //               overflow: TextOverflow.ellipsis,
                  //               maxLines: 2,
                  //               style: const TextStyle(fontSize: 14),
                  //             ),
                  //           ),
                  //           Text(
                  //             "originalLanguage",
                  //             style: const TextStyle(fontSize: 9),
                  //           ),
                  //           Text(
                  //             "releaseDate",
                  //             style: const TextStyle(fontSize: 10),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           SizedBox(
                  //             width: 200,
                  //             child: Text(
                  //               "#50,000",
                  //               overflow: TextOverflow.ellipsis,
                  //               maxLines: 2,
                  //               style: const TextStyle(fontSize: 14),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  ),
            ),
          );
        },
      ),
    );
  }
}
