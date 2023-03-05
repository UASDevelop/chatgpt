import 'package:chatgpt/04_chat/chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class Bussiness extends StatefulWidget {
  const Bussiness({Key? key}) : super(key: key);

  @override
  State<Bussiness> createState() => _BussinessState();
}

class _BussinessState extends State<Bussiness> {
  List title=["Become an outstanding scriptwriter",
  "Promote a product on social media",
    "Turn two ideas into one product",
    "Draw innovative ideas for startups",
    "Get personalized ideas for startups",
    "Create product names",
    "Start a business without investing",
  ];
  List subheading=[
    "Create a short creative script for your video on any topic\nWhat is the topic of your video? ",
    "Get a creative product description to market it online\nWhat is the name of your product?\nWhat is the purpose of your product? ",
    "Come up with solutions that combine two ideas\nWhat is the first idea?\nWhat is the second idea? ",
    "Get a list of grandiose startup ideas based on the sphere of your activity",
    "List your best qualities and find a startup that suits you the most",
    "Describe your product and share the keywords you want to use",
    "Come up with numerous ideas for starting a business without spending money",
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding:EdgeInsets.only(right:10),

      itemCount:title.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap:(){
            Get.to(ChatPage());
          },
          child:Container(
            height:140,
            // padding:EdgeInsets.only(left:20,right:20,top:20),
            margin: EdgeInsets.only(
                left: 10,
                top:20
            ),
            width: MediaQuery.of(context).size.width / 1,
            decoration: BoxDecoration(
              color:index%2==0? Color(0xffE7F4DA): Color(0xffE0DFFE),
              borderRadius: BorderRadius.circular(10),
              // boxShadow: Constants.glowBoxShadow,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${title[index]}",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w800,
                      fontSize: 17,
                      color: Colors.black),
                  textAlign:TextAlign.start,

                ),
                Text(
                  "${subheading[index]}",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.black),
                  textAlign:TextAlign.start,
                ),
              ],
            ),
          ),
        );
      },);
  }
}
