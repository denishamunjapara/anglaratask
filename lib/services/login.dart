import 'package:anglaratask/controllers/appcontroller.dart';
import 'package:anglaratask/services/Register.dart';
import 'package:anglaratask/services/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constant.dart';
import '../reusablefiles/Apptextfield.dart';
import '../reusablefiles/appbutton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var devicewidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: Appcolors.blackColor,
      // appBar: AppBar(
      //   title: Text('Login'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                ),
                // Image.network(
                //     'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),
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
                  'MEMBER LOGIN',
                  style: TextStyle(color: Appcolors.greyColor, fontSize: 20),
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
                  hintText: "Enter email",
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
                  hintText: "Enter Password",
                ),
                SizedBox(
                  height: 20,
                ),
                AppButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(content: Text('Processing Data')),
                      // );

                      Auth()
                          .handleSignIN(
                              emailcontroller.text, passwordcontroller.text)
                          .then((value) => setState(() {}));
                    }
                  },
                  text: 'Login',
                  width: devicewidth,
                ),
                SizedBox(
                  height: 5,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      //textAlign: TextAlign.end,
                      style:
                          TextStyle(color: Appcolors.greyColor, fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 200,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Do not have an account??  ',
                        style: TextStyle(color: Appcolors.greyColor)),
                    InkWell(
                      onTap: () {
                        Get.to(RegisterView());
                      },
                      child: Text(
                        'REGISTER',
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
