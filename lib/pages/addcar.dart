
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class addcar extends StatefulWidget {
  const addcar({Key? key}) : super(key: key);

  @override
  _addcarState createState() => _addcarState();
}

class _addcarState extends State<addcar> {
  File? _selectedImage;

  Future<void> _showImageSource(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Image Source'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                final imagePicker = ImagePicker();
                final pickedImage = await imagePicker.pickImage(
                  source: ImageSource.camera,
                );
                if (pickedImage != null) {
                  setState(() {
                    _selectedImage = File(pickedImage.path);
                  });
                }
              },
              child: Text('Camera'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                final imagePicker = ImagePicker();
                final pickedImage = await imagePicker.pickImage(
                  source: ImageSource.gallery,
                );
                if (pickedImage != null) {
                  setState(() {
                    _selectedImage = File(pickedImage.path);
                  });
                }
              },
              child: Text('Gallery'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 0, 99, 124),
                  Colors.white,
                ],
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 60.0, left: 22),
              child: Text(
                'ADD YOUR CAR \n FOR RENT',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white,
              ),
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextField(
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.person,color: Colors.grey,),
                          label: Text('Full Name',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:Color(0xff00637c),
                          ),)
                      ),
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.phone,color: Colors.grey,),
                          label: Text('Whatsapp Number',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:Color(0xff00637c),
                          ),)
                      ),
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.location_city,color: Colors.grey,),
                          label: Text('Address',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:Color(0xff00637c),
                          ),)
                      ),
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.email,color: Colors.grey,),
                          label: Text('Email',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:Color(0xff00637c),
                          ),)
                      ),
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.car_rental,color: Colors.grey,),
                          label: Text('Car Type',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:Color(0xff00637c),
                          ),)
                      ),
                    ),

                    const TextField(
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.numbers,color: Colors.grey,),
                          label: Text('Car License',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:Color(0xff00637c),
                          ),)
                      ),
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.calendar_today_rounded,color: Colors.grey,),
                          label: Text('Avalible Days to list your car for rent',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:Color(0xff00637c),
                          ),)
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            _showImageSource(context);
                          },
                          icon: Icon(Icons.camera_alt),
                        ),
                        labelText: 'Add Photo',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff00637c),
                        ),
                      ),
                      readOnly: true,
                      onTap: () {
                        _showImageSource(context);
                      },
                      controller: TextEditingController(
                        text: _selectedImage != null ? 'Image selected' : '',
                      ),
                    ),
                    SizedBox(height: 20),
                    _selectedImage != null
                        ? Image.file(
                      _selectedImage!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    )
                        : Container(),
                    SizedBox(height: 50),
                    Container(
                      height: 55,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xff00637c),
                      ),
                      child: const Center(
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,


                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}