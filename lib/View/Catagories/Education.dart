import 'package:chatgpt/04_chat/chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class Education extends StatefulWidget {
  const Education({Key? key}) : super(key: key);

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  List heading=[""];
  List subheading=[
    "Choose your task for Al",
  "Have a typical structured essay written especially for you",
    "Create unique rewrites with high text authenticity",
    "Fight writer's block and finish your text",
    "Have any equation solved in a flash",
    "Get clear and precise answers to the most complicated questions",
    "Check any text for spelling and grammatical mistakes",
    "Find other ways to convey the same thought",
    "Translate texts into any language",
    "Understand the purpose and function of any code",
    "Find bugs and errors in any code",
    "Make a list of the most important words in a text",
    "Discover what you can read tonight",
    "Turn simple JavaScript code into Python code",
    "Get a summary of any literary piece",
    "Have any chemical equation balanced in a flash",

  ];
  List title=["Get help, creative ideas, and smart advice from our Al assistant",
  "Create short essays on any topic",
    "Generate text rewrites",
    "Complete your writing"
    "Solve any equation",
    "Have complex concepts explained simply",
    "Let Al correct your text",
    "Rephrase statements",
    "Get translation help",
    "Have code explained",
    "Check code",
    "Extract keywords from any text",
    "Receive reading suggestions",
    "Convert JavaScript to Python",
    "Summarize any book",
    "Balance any chemical equation",

  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child:ListView.builder(
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
        },),
    );
  }
}
