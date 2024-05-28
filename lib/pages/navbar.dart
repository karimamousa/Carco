import 'package:flutter/cupertino.dart';
import 'package:phase1/pages/HomePage.dart';
import 'package:phase1/pages/availablecar2.dart';
import 'package:phase1/pages/availablecar_screen.dart';

import 'availablecar_list.dart';
import 'brand_list.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'home.dart';
import 'profile.dart';
import 'faqs.dart';
import 'settings.dart';
import 'welcome.dart';
import 'availablecar3.dart';
import 'availablecar4.dart';
import 'availablecar5.dart';
import 'availablecar6.dart';
import 'faqs.dart';





class navbar extends StatefulWidget {
  const navbar({super.key});

  @override
  State<navbar> createState() => _AvailableCarScreennState();
}

class _AvailableCarScreennState extends State<navbar> {
  int _selectedpageindex=0;
  int currentpage=0;
  final page = [AvailableCarScreenn(),Profile(),HomePage2(),SettingPage()];

  void setSelectedIndex(int index){
    setState(() {
      _selectedpageindex=index;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: page[currentpage],
        bottomNavigationBar:
        Container(
        color: Color(0xff00637c),
    child: Padding(

    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
    child: GNav(
    onTabChange: (index)=> setState(() =>currentpage=index),
    iconSize: 33,
    backgroundColor:Color(0xff00637c) ,
    activeColor: Colors.white,
    color: Colors.white,
    tabBackgroundColor: Colors.blueGrey,
    padding: EdgeInsets.all(16),
    tabs: [

    GButton(icon: Icons.home, text: '  Home',),
      GButton(icon: Icons.person, text: '  Profile',),

    GButton(icon: Icons.question_answer,text: 'FeedBack',),
    GButton(icon: Icons.settings,text: '  Settings',)
    ],
    ),
    ),
    ),
    backgroundColor: myPrimaryColor,

    );
  }
}