import 'package:anglaratask/constant.dart';
import 'package:anglaratask/controllers/appcontroller.dart';
import 'package:anglaratask/services/home.dart';
import 'package:anglaratask/services/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../reusablefiles/Apptextfield.dart';
import '../reusablefiles/appbutton.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var devicewidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 120,
                  width: 120,
                  child: CircleAvatar(
                    backgroundColor: Appcolors.greyColor,
                    child: Icon(
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
                  'MEMBER SIGNUP',
                  style: TextStyle(color: Appcolors.greyColor, fontSize: 20),
                ),
                SizedBox(
                  height: 25,
                ),
                AppTextField(
                  prefixIcon: Icon(
                    Icons.person,
                    size: 20,
                  ),
                  hintText: "Enter FirstName",
                ),
                SizedBox(
                  height: 20,
                ),
                AppTextField(
                  prefixIcon: Icon(
                    Icons.person,
                    size: 20,
                  ),
                  hintText: 'Enter LastName',
                ),
                SizedBox(
                  height: 20,
                ),
                AppTextField(
                  controller: emailcontroller,
                  prefixIcon: Icon(
                    Icons.person,
                    size: 20,
                  ),
                  hintText: 'Enter Email Address',
                ),
                SizedBox(
                  height: 20,
                ),
                AppTextField(
                  controller: passwordcontroller,
                  prefixIcon: Icon(
                    Icons.lock,
                    size: 20,
                  ),
                  hintText: 'Enter your Password',
                ),
                SizedBox(
                  height: 25,
                ),
                AppButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(content: Text('Processing Data')),
                      // );

                      Auth()
                          .handleSignUp(
                              emailcontroller.text, passwordcontroller.text)
                          .then((value) => setState(() {}));
                    }
                  },
                  text: 'Register',
                  width: devicewidth,
                ),
                SizedBox(
                  height: 120,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already Have an Account??  ',
                        style: TextStyle(color: Appcolors.greyColor)),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Text(
                        'LOGIN',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
