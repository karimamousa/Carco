import 'package:flutter/material.dart';
import 'package:phase1/pages/availablecar_screen.dart';
import 'home.dart';
import 'navbar.dart';
import 'PaymentPage.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Color(0xff00637c),
    title: Text(
    "Carكو",
    style: TextStyle(color: Colors.white),
    ),
    leading: IconButton(
        onPressed: () async {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>navbar()));
        },
        icon: Icon(Icons.arrow_back,color: Colors.white)
    ),
    ),
        body: Padding(
        padding: const EdgeInsets.all(10),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image(image: AssetImage('assets/images/toyota venza.webp')),
    SizedBox(height: 20),
    Container(
    height: 150,
    width: double.infinity,
    color: Colors.white24,
    padding: EdgeInsets.all(16),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'Specifications',
    style: TextStyle(color: Color(0xff00637c), fontSize: 24),
    ),
    SizedBox(height: 20),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    Expanded(
    child: Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(50),
    color: Colors.white,
    border: Border.all(color: Color(0xff00637c)),
    ),
    height: 50,
    alignment: Alignment.center,
    child: Text(
    'Color: Gray',
    style: TextStyle(color: Color(0xff00637c)),
    ),
    ),
    ),
    SizedBox(width: 10),
    Expanded(
    child: Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(50),
    color: Colors.white,
    border: Border.all(color: Color(0xff00637c)),
    ),
    height: 50,
    alignment: Alignment.center,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(23, 1, 1, 1),
      child: Text(
      'Max Power: 2000cc',
      style: TextStyle(color: Color(0xff00637c)),
      ),
    ),
    ),
    ),
    SizedBox(width: 10),
    Expanded(
    child: Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(50),
    color: Colors.white,
    border: Border.all(color: Color(0xff00637c)),
    ),
    height: 50,
    alignment: Alignment.center,
    child: Text(
    'Fuel Tank: 20L',
    style: TextStyle(color: Color(0xff00637c)),
    ),
    ),
    ),
    ],
    ),
    ],
    ),
    ),
    SizedBox(height: 20),
    Container(
    height: 150,
    width: 400,
    decoration: BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Color(0xff00637c)),
    borderRadius: BorderRadius.circular(30),
    ),
    padding: EdgeInsets.all(16),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'Car Features',
    style: TextStyle(color: Color(0xff00637c), fontSize: 24),
    ),
    SizedBox(height: 10),
    Row(
    children: [
    Text(
    '4 seats',
    style: TextStyle(fontSize: 18, color: Colors.black),
    ),
    Spacer(),
    Text(
    '4 doors',
    style: TextStyle(fontSize: 18, color: Colors.black),
    ),
    ],
    ),
    SizedBox(height: 10),
    Row(
    children: [
    Text(
    'Air Conditioner',
    style: TextStyle(fontSize: 18, color: Colors.black),
    ),
    Spacer(),
    Text('air bag',
    style: TextStyle(fontSize: 18, color: Colors.black),
    ),],),],),),
    SizedBox(height: 20),
    Container(
    height: 50,
    width: double.infinity,
    color: Colors.white24,
    child: Center(
    child: Text(
    'Price per day: 3650 EGP',
    style: TextStyle(color: Color(0xff00637c), fontSize: 24),),),),
    SizedBox(height: 20),
    ElevatedButton(
    onPressed: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PaymentPage()));
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xff00637c),

      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),),),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text('Book Now',
          style: TextStyle(fontSize: 18,
          color: Colors.white),),),),],),),);}}
