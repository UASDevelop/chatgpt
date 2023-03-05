import 'package:chatgpt/04_chat/chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class Social extends StatefulWidget {
  const Social({Key? key}) : super(key: key);

  @override
  State<Social> createState() => _SocialState();
}

class _SocialState extends State<Social> {
  List title=[
    "Let’s just chat",
    "Engage in text roleplay",
    "Create a social media post",
    "Win someone’s heart on a dating app",
    "Prepare for a fun get-together",
    "Find local attractions and places of interest",
    "Find the necessary airport code",
    "Get a sarcastic buddy",
    "Feel supported and appreciated.",
    "Inspire and Motivate others",
  ];
  List heading=[
    "Get help, creative ideas and smart advice from SoLoBot.",
    "Talk to SoLoBot as if it’s someone else",
    "Cover any event or topic on social media",
    "Start your conversion in an original and memorable way",
    "Toy with bright ideas about how to spend time with your friends",
    "Specify you location and get a list of nearby tourist attractions",
    "Share your departure and destination cities and see relevant airport codes.",
    "Chat with a playful and easy-going AI that will make you laugh.",
    "Get anything off your chest and have a heart-to-heart with AI",
    "Generate unique inspiring phrases to motivate others on social media",
  ];
  List subheading=[
    "What’s on your mind?",
    "What role do you want me to play: your friend,enemy, boyfriend, girlfriend, etc?",
    "What is the topic of your post \n.",
    "What is the general mood of your post: positive, touching, negative, etc",
    "What is your sex?\n.What is your potential partner sex? ",
    "How many people do you expect at your get-together?",
    "What is your location?",
    "Please specify your itinerary",
    "Type whatever you want",
    "Type whatever feels right.",
    "Generate unique inspiring phrases to motivate others on social media.",

  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding:EdgeInsets.only(right:10),

      itemCount:heading.length,
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
                  "${heading[index]}",
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
