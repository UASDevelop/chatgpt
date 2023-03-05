import 'package:chatgpt/04_chat/chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class Marketing extends StatefulWidget {
  const Marketing({Key? key}) : super(key: key);

  @override
  State<Marketing> createState() => _MarketingState();
}

class _MarketingState extends State<Marketing> {
  List title=[
    "Craft a perfect landing page title",
    "Boost your sales",
    "Craft creative discount emails",
    "Optimize your Google Ads campaign",
    "Generate an original headline",
    "Generate ad rewrites",

  ];
  List subheading=[
    "Create an ideal landing page title for your product",
    "Generate powerful sales emails with strong CTAs",
    "Create unbeatable discount offers for your product",
    "Get a Google Ad description with SEO keywords",
    "Create a one-line title for your product",
    "Rewrite your ads in original ways\nMake selling text rewrites\n"
        "Create professional-grade rewrites with high text authenticity"
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
