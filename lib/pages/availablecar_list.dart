//import 'dart:js_util';
import 'cardetails.dart';
import 'package:flutter/material.dart';
import 'availablecar_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';



class AvailableCarsList extends StatefulWidget {
  const AvailableCarsList({super.key});

  @override
  State<AvailableCarsList> createState() => _AvailableCarsListState();
}

class _AvailableCarsListState extends State<AvailableCarsList> {


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "All Available Cars",
                  style: TextConstants.titleSection,

                ),
                IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.sort)
                )


              ],
            ),

            Expanded(
              child: ListView.builder(
                  itemCount: 6,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index){
                    return CarItem();
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CarItem extends StatelessWidget {
  const CarItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      child: Stack(
        children: [
          Positioned(
              top: 30,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(left: 20, top:20),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 0.5,
                        blurRadius: 20,

                      ),

                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right:15),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Toyota Venza",
                            style: GoogleFonts.montserrat(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,

                            ),

                          ),
                          Text(
                            "2023",
                            style: GoogleFonts.montserrat(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black38

                            ),

                          ),


                        ],


                      ),
                    ),

                    SizedBox(
                      height:20,

                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                              style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500
                              ),
                              children: const<TextSpan>[
                                TextSpan(text: "3000EGP"),
                                TextSpan(
                                    text: "/hour",
                                    style: TextStyle(
                                        color: Colors.black38
                                    )
                                ),
                              ]
                          ),
                        ),

                        Container(
                          width: 130,
                          height: 50,
                          child: ElevatedButton(onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>StartScreen()));

                          },
                            child: Text("Details",
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontSize:18,

                              ),
                            ),

                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: new RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),

                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
          ),

          Positioned(

              child: Image.asset("assets/images/toyota venza.webp",
                width: 240,
                height: 150,)
          ),


        ],
      ),
    );
  }
}