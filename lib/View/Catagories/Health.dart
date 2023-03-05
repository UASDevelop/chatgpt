import 'package:chatgpt/04_chat/chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class Health extends StatefulWidget {
  const Health({Key? key}) : super(key: key);

  @override
  State<Health> createState() => _HealthState();
}

class _HealthState extends State<Health> {
  List title=["Popular",
  "Get help, creative ideas, and smart advice from our Al assistant",
    "Receive a personal training plan",
    "Discover how many calories you lose",
    "Get food suggestions",
    "Count your daily calorie intake",
    "Build muscle mass",
    "Return to training after a break",
    "Lose weight safely",
    "Pick health insurance",
    "Switch to a healthy diet",
    "Manage insomnia",
  ];
  List subheading=["Simply have a chat",
  "Choose your task for Al",
    "Get a list of exercises made especially for you",
    "Calculate the number of calories you burn off based on your daily activity and meals",
    "Receive a list of foods that will boost your health",
    "Learn how many calories you've consumed",
    "Get useful tips to bulk up faster",
    "Get back on track after a workout setback",
    "Develop optimal diet strategies",
    "Choose your perfect health coverage",
    "Make a smooth transition to healthy foods",
    "Find remedies for insomnia to start sleeping better"
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding:EdgeInsets.only(right:10),

      itemCount:title.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(onTap:(){
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
        ),);
      },);
  }
}
