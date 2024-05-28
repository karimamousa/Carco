import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Uint8List? _imageBytes;

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
                    ]
                )
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 60.0, left: 22),
              child: Text(
                'MY \nProfile',
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
                    Stack(
                      children: [_imageBytes!= null
                          ? CircleAvatar(
                          radius: 100, backgroundImage: MemoryImage(_imageBytes!))
                          : const CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage("assets/images/icon.jpg"),
                        // backgroundImage: NetworkImage(
                        //     "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                      ),
                        Positioned(
                          bottom: -0,
                          left: 150,
                          child: IconButton(
                            onPressed: () {
                              _showImagePicker(context);
                            },
                            icon: const Icon(Icons.add_a_photo_rounded),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.person, color: Colors.grey),
                        label: Text(
                          'Full Name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff00637c),
                          ),
                        ),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.phone, color: Colors.grey),
                        label: Text(
                          'PHONE',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff00637c),
                          ),
                        ),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.email, color: Colors.grey),
                        label: Text(
                          'Email',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff00637c),
                          ),
                        ),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.location_city, color: Colors.grey),
                        label: Text(
                          'Address',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff00637c),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                _pickImage(ImageSource.gallery);
                Navigator.pop(context);
              },
              child: Text('Pick from Gallery'),
            ),
            ElevatedButton(
              onPressed: () {
                _pickImage(ImageSource.camera);
                Navigator.pop(context);
              },
              child: Text('Take a Photo'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _imageBytes = File(pickedImage.path).readAsBytesSync();
      });
    }
  }
}
