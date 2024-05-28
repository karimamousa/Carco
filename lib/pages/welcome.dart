// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, use_super_parameters

import 'package:flutter/material.dart';
import 'home.dart';
import 'addcar.dart';
import 'navbar.dart';

//  debugShowCheckedModeBanner: false,

class welcome extends StatelessWidget {
  const welcome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 35,
                    ),

                    Text(
                      "Welcome",
                      style: TextStyle(fontSize: 33, fontFamily: "myfont" , fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Image.asset("assets/images/car logo.jpeg"),

                    SizedBox(
                      height: 35,
                    ),

                    Text(
                      "HOW CAN CARكو help you today?",
                      style: TextStyle(fontSize: 20, fontFamily: "myfont",fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 35,
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> navbar()));
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 0, 99, 124)),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 79, vertical: 10)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27))),
                      ),
                      child: Text(
                        "RENT A CAR",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>addcar()));
                      },
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.white),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 77, vertical: 13)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27))),
                      ),
                      child: Text(
                        "ADD CAR",
                        style: TextStyle(fontSize: 17, color: Color.fromARGB(255, 0, 99, 124)),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }


}
