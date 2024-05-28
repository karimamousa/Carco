import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phase1/pages/LoginSignup.dart';
import 'welcome.dart';
import 'LoginSignup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'navbar.dart';
class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool valnotify = true;
  bool valnotify1 = false;
  bool valnotify2 = false;

  onChangeFunction(bool newValue){
    setState(() {
      valnotify=newValue;
    });
  }
  onChangeFunction1(bool newValue1){
    setState(() {
      valnotify1=newValue1;
    });
  }
  onChangeFunction2(bool newValue2){
    setState(() {
      valnotify2=newValue2;
    });
  }
  @override
  Widget build(BuildContext){
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings", style: TextStyle(fontSize: 24,color:Colors.white )),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>navbar()),(route)=>false);
          },
          icon: Icon(Icons.arrow_back,color: Colors.white,),
        ),
        backgroundColor: Color(0xff00637c),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(height: 40),
            Row(
              children: [
                Icon(Icons.person,color: Color(0xff00637c))
                ,SizedBox(width: 10,),
                Text("account",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold))
              ],
            ),
            Divider(height: 20,thickness: 1,),
            SizedBox(height: 10,),
            buildAccountOptipn(context, "change password"),
            buildAccountOptipn(context, "content Settings"),
            buildAccountOptipn(context, "social"),
            buildAccountOptipn(context, "Language"),
            buildAccountOptipn(context, "privacy and security"),
            SizedBox(height: 40),
            Row(
              children: [
                Icon(Icons.volume_up,color: Color(0xff00637c)),
                SizedBox(width: 10),
                Text("Notifications",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold))
              ],
            ),
            Divider(height: 20,thickness: 1),
            SizedBox(height: 10),
            buildNotification("Theme Dark", valnotify, onChangeFunction),
            buildNotification("Acount Active", valnotify1, onChangeFunction1),
            buildNotification("Opportunity", valnotify2, onChangeFunction2),
            SizedBox(height: 50),
            Center(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
                onPressed: ()async{
                  await FirebaseAuth.instance.signOut();

                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginSignup()));
                },
                child: Text("Sign Out",style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 2.2,
                    color: Color(0xff00637c)
                ),),
              ),
            )
          ],
        ),
      ),
    );

  }
  Padding buildNotification(String title,bool value, Function onChangeMethod){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.grey[600])),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: Color(0xff00637c),
              trackColor: Colors.grey,
              value: value,
              onChanged: (bool newValue){
                onChangeMethod(newValue);
              },
            ),
          )
        ],
      ),
    );
  }

  GestureDetector buildAccountOptipn(BuildContext context,String title){
    return GestureDetector(
        onTap: (){
          showDialog(context: context, builder: (BuildContext context){
            return AlertDialog(
              title: Text(title),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("option 1"),
                  Text("option 2")
                ],
              ),
              actions: [
                TextButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: Text("Close"))
              ],
            );
          });
        },
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical:8,horizontal: 20 ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,style: TextStyle(fontSize:20,fontWeight: FontWeight.w500,color: Colors.grey[600])),

                Icon(Icons.arrow_forward,color: Colors.grey)],
            ),
        ));
  }}