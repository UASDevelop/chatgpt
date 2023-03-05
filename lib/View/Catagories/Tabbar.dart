import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'All.dart';
import 'Education.dart';
import 'For Fun.dart';
import 'Gaming.dart';
import 'Health.dart';
import 'Ideas,Bussines.dart';
import 'Marketing.dart';
import 'Social.dart';
import 'Work.dart';
import 'coding.dart';

class MyTabBar extends StatefulWidget {
  @override
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar>
    with SingleTickerProviderStateMixin {
  // define your tab controller here
  TabController? _tabController;

  @override
  void initState() {
    // initialise your tab controller here
    _tabController = TabController(length: 9, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          automaticallyImplyLeading: false, // hides leading widget
          flexibleSpace: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Fast Chat",
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w300),
              )
            ],
          ),
          backgroundColor: Color(0xffC8FFF2),
          bottom: TabBar(
            controller: _tabController,
            labelColor: Color(0xffFEC260),
            isScrollable: true,
            indicatorColor: Colors.transparent,
            unselectedLabelColor: Colors.black,
            unselectedLabelStyle: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
            labelStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            tabs: <Widget>[
              // Container(
              //     height: MediaQuery.of(context).size.height / 28,
              //     width: MediaQuery.of(context).size.width / 4,
              //     decoration: BoxDecoration(
              //       color:Color(0xff7672FB),
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     child: Center(child: Text('All'))),
              Container(
                  height: MediaQuery.of(context).size.height / 28,
                  width: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffFBE7E2),
                  ),
                  child: Center(child: Text('Social'))),
              Container(
                  height: MediaQuery.of(context).size.height / 28,
                  width: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffC2F1FC),
                  ),
                  child: Center(child: Text('Education'))),
              Container(
                  height: MediaQuery.of(context).size.height / 28,
                  width: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffE0DFFD),
                  ),
                  child: Center(child: Text('Work'))),
              Container(
                  height: MediaQuery.of(context).size.height / 28,
                  width: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff92F321),
                  ),
                  child: Center(child: Text('For Fun'))),
              Container(
                  height: MediaQuery.of(context).size.height / 28,
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffC2F1FC),
                  ),
                  child: Center(child: Text('Bussiness,Ideas'))),
              Container(
                  height: MediaQuery.of(context).size.height / 28,
                  width: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffE9ACFF),
                  ),
                  child: Center(child: Text('Health'))),
              Container(
                  height: MediaQuery.of(context).size.height / 28,
                  width: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffC8FFF2),
                  ),
                  child: Center(child: Text('Gaming'))),
              Container(
                  height: MediaQuery.of(context).size.height / 28,
                  width: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffD9D9D9),
                  ),
                  child: Center(child: Text('Coding'))),
              Container(
                  height: MediaQuery.of(context).size.height / 28,
                  width: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff13326E),
                  ),
                  child: Center(child: Text('Marketing'))),
            ],
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10, top: 10),
            color: Colors.white,
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  // padding:EdgeInsets.only(left:20,right:20,top:20),
                  margin: EdgeInsets.only(
                    left: 10,
                  ),
                  width: MediaQuery.of(context).size.width / 1,
                  decoration: BoxDecoration(
                    color:
                        index % 2 == 0 ? Color(0xffE0DFFE) : Color(0xffE7F4DA),
                    borderRadius: BorderRadius.circular(10),
                    // boxShadow: Constants.glowBoxShadow,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "    Simply Chat Get idea ",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w800,
                            fontSize: 17,
                            color: Colors.black),
                      ),
                      Text(
                        "  1.Create and ideas and get help I'm here to listing you",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.black),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                // AllCatagories(),
                // UserInformation(catagoray: '',),
                Social(),
                Education(),
                Work(),
                ForFun(),
                Bussiness(),
                Health(),
                Gaming(),
                coding(),
                Marketing(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
