import 'package:chatgpt/Models/usermodels.dart';
import 'package:chatgpt/modelsview/usermodelsview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../helper/images.dart';
import '../../widgets/toast.dart';
import '../Homepage.dart';

class Login extends GetView<UserModelView> {
UserModelView userModelView =Get.put(UserModelView());
UserModel userModel=Get.put(UserModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => LoadingOverlay(isLoading: userModelView.loginloading.value, child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(Images.bot),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(width: .5),
                    borderRadius: BorderRadius.circular(20)),
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  controller:userModelView.username,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        left: 10,
                      ),
                      border: InputBorder.none,
                      hintText: "Email"),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(width: .5),
                    borderRadius: BorderRadius.circular(20)),
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  obscureText:true,
                  controller:userModelView.password,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        left: 10,
                      ),
                      border: InputBorder.none,
                      hintText: "Password"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  if (userModelView.username.text.isEmpty) {
                    AmeToast.toast('Please Enter Your Name');
                  } else if (userModelView
                      .password.text.isEmpty) {
                    AmeToast.toast('Please Enter Password');
                  } else {
                    userModelView.signIn();
                  }
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xff4285F4)),
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      "Login",
                      style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Or"),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  userModelView.googlesinup();
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xff4285F4)),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(Images.google),
                      Center(
                        child: Text(
                          "Continue with Google",
                          style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {

                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.apple,
                        color: Colors.white,
                      ),
                      Center(
                        child: Text(
                          "Continue with Apple",
                          style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ))),
    );
  }
}
