import 'package:anglaratask/apimanager.dart';
import 'package:anglaratask/constant.dart';
import 'package:anglaratask/controllers/appcontroller.dart';
import 'package:anglaratask/reusablefiles/Apptextfield.dart';
import 'package:anglaratask/services/cart.dart';
import 'package:anglaratask/services/login.dart';
import 'package:anglaratask/services/products.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchcontroller = TextEditingController();
  String? searchtext = '';
  bool isHover = false;
  @override
  void initState() {
    ApiManager().getCategories().then((value) => setState(() {}));
    ApiManager().getProducts().then((value) => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var devicewidth = MediaQuery.of(context).size.width;
    var currentUserName = FirebaseAuth.instance.currentUser?.displayName;
    var currentUserEmail = FirebaseAuth.instance.currentUser?.email;

    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              // Image.network(
              //     'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),
              Container(
                height: 120,
                width: 120,
                child: CircleAvatar(
                  backgroundColor: Appcolors.greyColor,
                  child:
                      // Image(
                      //     image: NetworkImage(
                      //         FirebaseAuth.instance.currentUser?.photoURL ?? ""))

                      Icon(
                    Icons.person,
                    size: 60,
                    color: Appcolors.whiteColor,
                  ),
                ),
                decoration: BoxDecoration(
                    //color: Appcolors.whiteColor,
                    ),
              ),
              SizedBox(
                height: 20,
              ),

              Text(
                currentUserName ?? "Display Name",
                style: TextStyle(color: Appcolors.blackColor, fontSize: 15),
              ),
              Text(
                currentUserEmail ?? 'denisharmunjapara123@gmail.com',
                style: TextStyle(color: Appcolors.blackColor, fontSize: 12),
              ),
              SizedBox(
                height: 500,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () async {
                      await Auth().handleLOGOUT().then((value) => setState(() {
                            Get.offAll(LoginScreen());
                          }));
                    },
                    child: Text(
                      'Logout',
                      style:
                          TextStyle(color: Appcolors.greyColor, fontSize: 17),
                    ),
                  ),
                  InkWell(
                    onTap: () async {},
                    child: Text(
                      'Back',
                      style:
                          TextStyle(color: Appcolors.greyColor, fontSize: 17),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          InkWell(
              onTap: () {
                Get.to(CartView());
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.add_shopping_cart_outlined),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              //onSubmitted: widget.onSubmitted,
              onChanged: (value) async {
                setState(() {
                  searchtext = value;
                });
                ApiManager().searchCategory(searchtext);
              },
              controller: searchcontroller,
              // maxLines: null //1 ?? widget.maxLines,
              maxLines: 1,
              //  minLines: 1 ?? widget.minLines,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  isDense: true,
                  labelStyle: const TextStyle(color: Colors.grey),
                  hintText: 'Search Categories',
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                  //border: const UnderlineInputBorder(),
                  // enabledBorder: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(5),
                  //     borderSide: const BorderSide(color: Colors.grey)),
                  focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.black87))),
            ),
            // AppTextField(
            //   onChanged: (value) async {
            //     setState(() {
            //       searchtext = value;
            //     });
            //     ApiManager().searchCategory(searchtext);
            //   },
            //   hintText: 'Search Categories',
            //   prefixIcon: Icon(Icons.search),
            // ),
            SizedBox(
              height: 10,
            ),
            categoryList(devicewidth)
          ],
        ),
      ),
    );
  }

  categoryList(double? width) {
    return Expanded(
      child: ListView.builder(
        itemCount: searchtext!.isNotEmpty
            ? searchCategories.length
            : categories.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  temporaryProductLIST = allProductLIST
                      .where((element) => element.category
                          .toString()
                          .contains(categories[index]))
                      .toList();

                  Get.to(ProductScreen(
                    categoryProductLIST: temporaryProductLIST,
                  ));
                },
                child: Container(
                  height: 160,
                  // width: widget.width,
                  decoration: BoxDecoration(
                      color: Appcolors.greyColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    '${searchtext!.isNotEmpty ? searchCategories[index] : categories[index]}'
                        .capitalizeFirst!,
                    style: TextStyle(color: Colors.white70, fontSize: 25),
                  )),
                ),
                // Card(
                //   child: Stack(
                //     children: [
                //       InkWell(
                //         onHover: (value) {},
                //         child: Container(
                //           height: 250,
                //           width: width,
                //           color: Appcolors.greyColor,
                //           child: Image.network(
                //             'https://images.unsplash.com/photo-1685972211998-d581fa1d70ea?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1169&q=80',
                //             fit: BoxFit.fill,
                //           ),
                //         ),
                //       ),
                //       Positioned(
                //         bottom: 0,
                //         child: Container(
                //           height: 45,
                //           width: width,
                //           color: Colors.black12,
                //           child: Align(
                //             alignment: Alignment.centerLeft,
                //             child: Padding(
                //               padding: const EdgeInsets.only(left: 10),
                //               child: Text(
                //                 categories[index],
                //                 style: TextStyle(
                //                     color: Appcolors.greyColor, fontSize: 20),
                //               ),
                //             ),
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
              ),
              SizedBox(
                height: 15,
              )
            ],
          );
        },
      ),
    );
  }
}

class CustomContainer extends StatefulWidget {
  CustomContainer(
      {super.key, required this.text, this.height, this.width, this.onTap});
  String? text;
  double? height;
  double? width;
  void Function()? onTap;
  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        child: Center(
            child: Text(
          widget.text!,
          style: TextStyle(color: Appcolors.whiteColor, fontSize: 14),
        )),
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
            color: Appcolors.greyColor,
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
