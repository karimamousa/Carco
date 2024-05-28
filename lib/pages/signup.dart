import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';
import 'welcome.dart';
import 'LoginSignup.dart';
import 'package:firebase_auth/firebase_auth.dart';
//  debugShowCheckedModeBanner: false,
class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController username=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:Color(0xff00637c) ,
          automaticallyImplyLeading: true,
          leading: IconButton(icon: Icon(Icons.arrow_back) ,
            color: Colors.white,
            onPressed: () => {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginSignup()))
            },
          ),
        ),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color(0xff00637c)
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 60.0, left: 22),
                child: Text(
                  'Create Your\nAccount',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                  color: Colors.white,
                ),
                height: double.infinity,
                width: double.infinity,
                child:  Padding(
                  padding: const EdgeInsets.only(left: 18.0,right: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       TextFormField(
                        controller:username  ,
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.person,color: Colors.grey,),
                            label: Text('Full Name',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:Color(0xff00637c),
                            ),)
                        ),
                      ),


                       TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.phone_android,color: Colors.grey,),
                            label: Text('Phone or Email',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:Color(0xff00637c),
                            ),)
                        ),
                      ),
                         TextFormField(
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.visibility_off,color: Colors.grey,),
                            label: Text('Password',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:Color(0xff00637c),
                            ),)
                        ),
                      ),

                      const SizedBox(height: 50,),
                      Container(
                        height: 55,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xff00637c),
                        ),
                        child: ElevatedButton(
                          onPressed: ()async {
                            try {
                              final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                email: email.text,
                                password: password.text,
                              );
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>welcome()));
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                print('The password provided is too weak.');
                              } else if (e.code == 'email-already-in-use') {
                                print('The account already exists for that email.');
                              }
                            } catch (e) {
                              print(e);
                            }

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff00637c),
                            surfaceTintColor: Colors.white,
                            side: BorderSide(color: Color(0xff00637c)),
                            elevation: 20,
                            minimumSize: const Size.fromHeight(60),
                          ),
                          child: const Text("SIGNUP", style:TextStyle(color:Colors.white,)),
                        ),
                      ),
                      const SizedBox(height: 30,),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}