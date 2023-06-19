import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../services/home.dart';

class Auth {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future handleSignUp(String email, String password) async {
    try {
      var credential = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      print(credential);
      Get.snackbar('Register succesfully', 'Register');
      Get.to(HomeScreen());
    } catch (error) {
      if (error is FirebaseAuthException) {
        Get.snackbar(error.message!, 'Register');
      } else {}
    }
  }

  Future handleSignIN(String email, String password) async {
    try {
      var credential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      print(credential);
      Get.snackbar('Login succesfully', 'Login');
      Get.to(HomeScreen());
    } catch (error) {
      if (error is FirebaseAuthException) {
        Get.snackbar(error.message!, 'Login');
      } else {}
    }
  }

  Future handleLOGOUT() async {
    await firebaseAuth.signOut();
  }
}
