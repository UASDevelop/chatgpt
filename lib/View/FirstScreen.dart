import 'package:chatgpt/View/auth/Signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'auth/Login.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment:MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 120,
            ),
            Text(
              "Hello!",
              style: GoogleFonts.inter(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            Image.asset("assets/images/bot.png"),
            Text(
              "I’m SoLoBot,\n your personal AI Assistant",
              style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff878787)),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
           InkWell(
             onTap:(){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>
               Signup()
               ));
             },
             child: Container(
               height: 50,
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20),
                   color: Color(0xff4285F4)),
               width: MediaQuery.of(context).size.width,
               child: Center(
                 child: Text(
                   "Sign Up",
                   style: GoogleFonts.inter(
                       fontSize: 16,
                       fontWeight: FontWeight.w600,
                       color: Colors.white),
                 ),
               ),
             ),
           ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                Login()
                ));
              },
            child:
            Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1, color: Colors.black),
                  color: Colors.white),
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  "Log In",
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff4285F4)),
                ),
              ),
            )),
            SizedBox(
              height: 40,
            ),
            TextButton(onPressed: () {}, child: Text("Skip for now"))
          ],
        ),
      ),
    );
  }
}
