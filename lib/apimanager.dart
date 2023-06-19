import 'dart:convert';
import 'package:anglaratask/modals/productmodal.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:core';

List categories = [];
List searchCategories = [];
List<ProductsModal> temporaryProductLIST = [];
List<ProductsModal> allProductLIST = [];
List<ProductsModal> cartList = [];

class ApiManager extends GetxController {
  Future getCategories() async {
    var response = await http
        .get(Uri.parse('https://fakestoreapi.com/products/categories'));
    print(response.body);
    if (response.statusCode == 200) {
      categories = json.decode(response.body);
      update();
      print(categories[1]);
    }
  }

  Future getProducts() async {
    var response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    print(response.body);
    var decodedjson = json.decode(response.body);
    if (decodedjson is Iterable) {
      int i;
      var products = decodedjson.toList();
      for (i = 1; i < products.length; i++) {
        allProductLIST.add(ProductsModal.fromJson(products[i]));
        update();
      }
    }
  }

  searchCategory(String? enteredkeyword) {
    searchCategories = categories
        .where((element) => element
            .toString()
            .toLowerCase()
            .contains(enteredkeyword!.toLowerCase()))
        .toList();
  }

  Future shoppingCart(ProductsModal? singleProduct) async {
    cartList.add(singleProduct!);
    update();
    //print(cartList.length);
  }
}
