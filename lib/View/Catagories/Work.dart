import 'package:chatgpt/04_chat/chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class Work extends StatefulWidget {
  const Work({Key? key}) : super(key: key);

  @override
  State<Work> createState() => _WorkState();
}

class _WorkState extends State<Work> {
  List subheading=[
    "Summarize any text and create a numbered list of its key points \nType the text you want to structure",
    "Receive a short list of questions a recruiter may ask you\nWhich position would you like to apply for?",
    "Generate a short and creative resume any recruiter will greenlight\nTell me more about your previous jobs. It would be great if you could also specify how much time you’ve worked in each role.",
    "Find out the approximate requirements for a job\nWhat position are you interested in?",
    "Identify the core values which should guide your company\nWhat is the name of your company? ",
    "Create complex passwords based on specific input parameters\nProvide the requirements your"
        " password should meet, like length, capital letters, numbers, and special characters",
    "Receive several helpful tips to sail through your interview\nGive me more info about the company (its name, activities, etc.)"
  "Also, please specify the position you are applying for",
    "Come up with the best excuses for requesting a day off\nWhat is your occupation? ",
    "Define the qualifications for any position\n"
"    What is the name of the company?\n"
    "What is the position?",
    "Have your project documentation outline designed\nWhat project is your document for?",
    "Get internet safety tips to protect yourself online\nWhat operating system do you use?",
    "Encourage your employees to act promptly\n"
        "What is the current situation (the number of sales, the stage of development, etc.)? "

  ];
  List title=["Highlight the main points",
  "Prepare for a job interview",
  "Build your resume",
    "Find out what's necessary for a certain job",
    "Define your corporate culture",
    "Generate secure passwords",
    "Get ready for your first job interview",
    "Have a good excuse to miss work",
    "Create an impressive job description",
    "Create a documentation structure",
    "Stay safe online",
    "Create Action Required emails",
    ""
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child:ListView.builder(
        padding:EdgeInsets.only(right:10),

        itemCount:subheading.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap:(){
              Get.to(ChatPage());
            },
            child: Container(
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
