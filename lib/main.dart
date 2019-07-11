import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  File _image;
  var toggle = false;

  Future getImage(bool isCamera) async {
    File image;
    if (isCamera) {
      image = await ImagePicker.pickImage(source: ImageSource.camera);
    } else {
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }

    setState(() {
      _image = image;
    });
  }

  toggleIcons() {
    setState(() {
      toggle = !toggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('Image Picker')),
            floatingActionButton: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 31),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: FloatingActionButton(
                      onPressed: () {
                        getImage(false);
                      },
                      child: Icon(Icons.add_photo_alternate),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    onPressed: () {
                      getImage(true);
                    },
                    child: Icon(Icons.camera_alt),
                  ),
                ),
              ],
            ),
            body: Container(
              child: Column(children: <Widget>[
                toggle
                    ? IconButton(
                        icon: Icon(Icons.insert_drive_file),
                        onPressed: () {
                          print('clicked');
                          getImage(false);
                        },
                      )
                    : Container(),
                SizedBox(height: 10.0),
                toggle
                    ? IconButton(
                        icon: Icon(Icons.camera_alt),
                        onPressed: () {
                          print('clicked');
                          getImage(true);
                        },
                      )
                    : Container(),
                _image == null
                    ? Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/face.jpeg"),
                            colorFilter: new ColorFilter.mode(
                                Colors.black.withOpacity(0.2),
                                BlendMode.dstATop),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: new Text('Welcome to Skindex. Take a pic.',
                            style: Theme.of(context).textTheme.display4),
                      )
                    : Image.file(_image, height: 600.0, width: 400.0),
              ]),
            )));
  }
}
