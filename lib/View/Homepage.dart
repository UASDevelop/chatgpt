import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../04_chat/chat.dart';
import '../helper/images.dart';
import 'Catagories/Tabbar.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 150, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Welcome!",
                style: GoogleFonts.inter(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              Image.asset(Images.bot),
              Text(
                "How can I assist you!",
                style: GoogleFonts.inter(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ChatPage(text:"with  a general question.",)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xffE0DFFE),
                          borderRadius: BorderRadius.circular(20)),
                      height: 70,
                      width: MediaQuery.of(context).size.width / 2.4,
                      child: Center(
                          child: Text(
                        "Ask me a general \nquestion.",
                        style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      )),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ChatPage(text:"Let’s create art!.",)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xffFFFCDA),
                          borderRadius: BorderRadius.circular(20)),
                      height: 70,
                      width: MediaQuery.of(context).size.width / 2.6,
                      child: Center(
                          child: Text(
                        "create art!.",
                        style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      )),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ChatPage(text:" code!",)));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xffFFFCDA),
                            borderRadius: BorderRadius.circular(20)),
                        height: 70,
                        width: MediaQuery.of(context).size.width / 2.4,
                        child: Center(
                            child: Text(
                          "Let’s code!",
                          style: GoogleFonts.inter(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        )),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ChatPage(text:"just talk!.",)));
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        decoration: BoxDecoration(
                            color: Color(0xff16B8FC61),
                            borderRadius: BorderRadius.circular(20)),
                        height: 70,
                        width: MediaQuery.of(context).size.width / 2.6,
                        child: Center(
                            child: Text(
                          "Let’s just talk!.",
                          style: GoogleFonts.inter(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        )),
                      )),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  MyTabBar()
                  ));
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffE0DFFE),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      "Not sure what to do? Here are some examples to help you get started.",
                      style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
