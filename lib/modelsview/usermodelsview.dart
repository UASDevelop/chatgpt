

import 'package:chatgpt/View/Homepage.dart';
import 'package:chatgpt/View/auth/Login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Models/usermodels.dart';
import '../widgets/toast.dart';

class UserModelView extends GetxController {
  ///variable Auth
  var isshowed=false.obs;
  var isloading=false.obs;
  var loginloading=false.obs;
  ///signup Editing controller
  TextEditingController usernamecontroler = TextEditingController();
  TextEditingController emailcontroler = TextEditingController();
  TextEditingController passwordcontroler = TextEditingController();

  ///signin controller
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  UserModel userModel = UserModel();
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  ///auth Funtions
  @override
  void onInit() {

    // TODO: implement onInit
    super.onInit();
  }
  Future<void> singup() async {
    isloading.value=true;
    try {
      var user = await auth.createUserWithEmailAndPassword(
          email: emailcontroler.text, password: passwordcontroler.text);
      if (user != null) {
        userModel.name = usernamecontroler.text;
        userModel.email = emailcontroler.text;
        userModel.id = auth.currentUser!.uid;
        firestore
            .collection("user")
            .doc(auth.currentUser!.uid)
            .set(userModel.tojson());
        AmeToast.sucesstoast("Sign Up has been sucessfully");
        Get.to(Homepage());

      }
      isloading.value=false;
    } catch (e) {
      AmeToast.toast("$e");
    }
  }

  Future<void> signIn() async {
    loginloading.value=true;
    try {
      var user =await  auth.signInWithEmailAndPassword(
          email: username.text, password: password.text);
      if (user != null) {
        AmeToast.sucesstoast("Log In has been sucessfully");
        Get.to(Homepage());
      }
      loginloading.value=false;
    } catch (e) {
      AmeToast.toast("$e");
    }
  }
  GoogleSignIn _googleSignIn = GoogleSignIn();

  ///GOOGLE SINGING METHOD
  Future<void> googlesinup() async {
    try {
      var singng = await _googleSignIn.signIn();
      GoogleSignInAccount? googleSignInAccount = await singng;
      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
        AuthCredential credential = await GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );
        print(googleSignInAccount.email);
        userModel.email = googleSignInAccount.email;
        userModel.name = googleSignInAccount.displayName;
        userModel.id = googleSignInAccount.id;
        firestore
            .collection("user")
            .doc(googleSignInAccount.id)
            .set(userModel.tojson());
        AmeToast.sucesstoast("Data is stored sucessfully");
        Get.to(Homepage());
      }
    } catch (error) {
      AmeToast.toast("$error");
      print(error);
    }}
}
