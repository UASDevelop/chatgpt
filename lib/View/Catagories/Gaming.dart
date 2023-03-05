import 'package:chatgpt/04_chat/chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class Gaming extends StatefulWidget {
  const Gaming({Key? key}) : super(key: key);

  @override
  State<Gaming> createState() => _GamingState();
}

class _GamingState extends State<Gaming> {
  List title=["Reinstall any operating system",
  "Find your dream desktop computer",
    "Become a master gamer",
    "Find your dream laptop",
    "Receive mobile game suggestions",
    "Pick your ideal game console",
    "Choose your perfect gaming monitor"
  ];
  List heading=[
    "Get simple instructions about how to do a full OS reinstallation",
    "Get a list of the best computers meeting your requirements",
    "Learn how to improve your gaming skills",
    "Get a list of the best laptops meeting your requirements",
    "Explore a list of the top mobile games",
    "Get tips on choosing the console that meets your requirements",
    "See a list of the best monitors meeting your requirements",
  ];
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
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
                  "${heading[index]}",
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
