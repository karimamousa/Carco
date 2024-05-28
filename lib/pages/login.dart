import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'welcome.dart';
import 'LoginSignup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'signup.dart';



class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  late Size mediaSize;
  bool rememberUser = false;
  @override
  Widget build(BuildContext context) {
    mediaSize=MediaQuery.of(context).size;
    return Container(color: Color(0xff00637c),
      child: Scaffold(
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
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(top:80,child: _buildTop()),
            Positioned(bottom:0 ,child: _buildBottom()),
          ],
        ),
      ),
    );
  }
  Widget _buildTop(){
    return SizedBox(
      width: mediaSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [Icon(Icons.location_on_sharp,size:100,color:Colors.white),],
      ),
    );

  }
  Widget _buildBottom(){
    return SizedBox(
      width: mediaSize.width,
      child: Card( color: Colors.white, shape: RoundedRectangleBorder( borderRadius:
      BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))),
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: _buildForm(),
        ),),
    );
  }
  Widget _buildForm() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBlackText("Please login with your information"),
        const SizedBox(height: 60),
        TextFormField(controller: email
            ,onFieldSubmitted: (value){
              print(value);
            },onChanged:(value){
              print(value);
            } ,keyboardType: TextInputType.emailAddress,decoration: InputDecoration(
              labelText: "email address",labelStyle: TextStyle(fontWeight: FontWeight.bold,
              color:Color(0xff00637c),)
              ,prefixIcon:Icon(Icons.email,),)),
        const SizedBox(height: 40),
        TextFormField(controller: password,obscureText: true,onFieldSubmitted:
            (value){print(value);
        },onChanged:(value){
          print(value);} ,keyboardType:
        TextInputType.visiblePassword,decoration: InputDecoration(labelText: " password",
            labelStyle: TextStyle(fontWeight: FontWeight.bold, color:Color(0xff00637c),),
            prefixIcon:Icon(Icons.lock,),suffixIcon: Icon(Icons.remove_red_eye))),
        const SizedBox(height: 20),
        _buildRememberForgot(),
        const SizedBox(height: 20),
        _buildLoginButton(),
      ],
    );
  }

  Widget _buildBlackText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Color(0xff00637c)),
    );
  }



  Widget _buildRememberForgot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
                value: rememberUser,
                onChanged: (value) {
                  setState(() {
                    rememberUser = value!;
                  });
                }),
            _buildBlackText("Remember me"),
          ],
        ),
        TextButton(
            onPressed: () {}, child: _buildBlackText("I forgot my password"))
      ],
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: ()async {
        try {
          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: email.text,
              password: password.text
          );
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>welcome()));
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print('No user found for that email.');
          } else if (e.code == 'wrong-password') {
            print('Wrong password provided for that user.');
          }
        }

      },
      style: ElevatedButton.styleFrom(
        surfaceTintColor: Colors.white,
        side: BorderSide(color: Color(0xff00637c)),
        elevation: 20,
        minimumSize: const Size.fromHeight(60),
      ),
      child: const Text("LOGIN", style:TextStyle(color:Color(0xff00637c),)),
    );
  }



}
