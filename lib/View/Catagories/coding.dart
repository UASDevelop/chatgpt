import 'package:chatgpt/04_chat/chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class coding extends StatefulWidget {
  const coding({Key? key}) : super(key: key);

  @override
  State<coding> createState() => _codingState();
}

class _codingState extends State<coding> {
  List title=["Have code explained",
  "Convert text to HTML",
    "Get help with SVG designs",
    "Work with the JavaScript console",
    "Utilize Linux terminal",
    "Rise to any tech challenge",
    "Chat with a UX/UI developer",
    "Have your ML engineer at hand",
    "Improve data security",
  ];
  List subheading=[
    "Understand the purpose and function of any cod",
    "Turn simple text into HTML files",
    "Generate SVG codes for images",
    "Run code snippets in this imitation of a JavaScript console",
    "Use the Linux command line interface",
    "Troubleshoot technical issues with Al",
    "Let Al help you improve your user experience",
    "Communicate with an Al machine learning engineer to extend your expertise",
    "Protect your data with this Al cyber security specialist",

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
