import 'package:chatgpt/04_chat/chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class ForFun extends StatefulWidget {

  @override
  State<ForFun> createState() => _ForFunState();
}

class _ForFunState extends State<ForFun> {
  List title=["Turn any text into emoji",
  "Write a song",
    "Receive binging suggestions",
    "Find an appropriate recipe",
    "Explore creative gift ideas",
    "Get your astrological prediction",
    "Find prompts for Al-generated images",
    "Find your dream car",
    "Get fashion advice",
    "Celebrate your birthday creatively",
  ];
  List subheading=[
    "Convert phrases into emojis\nType the text you want to convert.",
    "Compose lyrics to a song on any topic\nDescribe the idea of your song, to whom you’d like to dedicate\n it, who you’d be glad to mention in it, and so on.\n Please provide as many details as possible.",
    "Discover what you can watch tonight\nWhat are you in the mood for: a film, series, cartoon?",
    "Get several options of the dishes you can cook from the ingredients you have\nKindly list the ingredients you have.",
    "Get a list of original gift ideas based on your request\nTell me more about the person you are going to surprise, like their age, gender, hobbies, etc.\n Try to share as many facts as possible.",
    "Discover what awaits you on a certain day\nWhich say are you interested in?",
    "Create detailed prompts you can use in Al image generators\nWhich neural network are you going to use?\nWhat do you want to see in the picture?",
    "Get a list of the best cars meeting your requirements\nDescribe the parameters you want your car to meet. You can mention engine capacity, \ncar size, its price, etc. Provide as many details as you can.",
    "Complete your look with the help of Al\nDescribe the look you need to complete",
    "Consider these unique and original ideas to make your birthday unforgettable\nHow old are you?\nWhat is your sex? "
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
