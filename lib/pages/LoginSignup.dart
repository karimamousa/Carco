import 'package:flutter/material.dart';
import 'home.dart';
import 'signup.dart';
import 'login.dart';
class LoginSignup extends StatelessWidget {
  const LoginSignup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body:
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 230),
               child: Container(color: Colors.white,
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  children: [Text("Welcome", style: TextStyle(color: Color(0xff00637c),fontWeight: FontWeight.bold,
                    fontSize: 60,fontStyle: FontStyle.italic,),),
                    SizedBox(height: 50,),
                    Text("Get wheels in seconds, Zoom away" ,style:
                    TextStyle(color:Color(0xff00637c),fontStyle: FontStyle.italic,
                        fontSize: 25),),
                    SizedBox(height: 80,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>login()));

                          },
                          style: ElevatedButton.styleFrom(
                            surfaceTintColor: Colors.white,
                            side: BorderSide(color: Color(0xff00637c)),
                            elevation: 20,
                            minimumSize: const Size.fromHeight(60),
                          ),
                          child: const Text("LOGIN", style:TextStyle(color:Color(0xff00637c),)),
                        ),
                        SizedBox(height: 20,),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>signup()));

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:Color(0xff00637c) ,
                            surfaceTintColor: Colors.white,
                            side: BorderSide(color: Color(0xff00637c)),
                            elevation: 20,
                            minimumSize: const Size.fromHeight(60),

                          ),
                          child: const Text("SIGN UP", style:TextStyle(color:Colors.white,)),
                        ),
                      ],
                    ),],),),
             ),



       );
  }
}