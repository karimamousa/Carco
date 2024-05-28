import 'package:flutter/cupertino.dart';
import 'package:phase1/pages/availablecar2.dart';

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
import 'navbar.dart';
import 'addcar.dart';





class AvailableCarScreenn extends StatefulWidget {
  const AvailableCarScreenn({super.key});

  @override
  State<AvailableCarScreenn> createState() => _AvailableCarScreennState();
}

class _AvailableCarScreennState extends State<AvailableCarScreenn> {



  void setSelectedIndex(int index){

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      

      appBar: AppBar(

        backgroundColor: myCardColor,
        elevation: 0,
        centerTitle: true,
        title: Text('Available Cars',
            style: GoogleFonts.mulish(
                color: Colors.white,
                fontSize: 30.0
            )

        ),
        //automaticallyImplyLeading: true,
      leading: IconButton(icon: Icon(Icons.arrow_back) ,
        color: Colors.white,
        onPressed: () => {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>welcome()))},
      ),


      ),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search here...',
                  hintStyle: TextStyle(fontSize: 16,
                    color: myCardColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),

                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),


                  filled: true,
                  fillColor: Color.fromARGB(255, 218, 216, 216),
                  contentPadding: EdgeInsets.only(left: 30),
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 24, left: 16),
                    child: Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 0, 99, 124),
                      size: 24,
                    ),
                  ),

                ),
              ),
            ),
          ),

          BrandList(),
          SizedBox(
            height: 537,
            width: 500,
            child: ListView(
              children: [
                availablecar2(),
                availablecar3(),
                availablecar4(),
                availablecar5(),
                availablecar6(),



              ],
            ),
          ),




        ],


      ),


    );

  }
}