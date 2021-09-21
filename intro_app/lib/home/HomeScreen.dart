import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intro_app/util/dimentions.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _homeScaffoldKey = GlobalKey();
  final GlobalKey<FormState> _formKey = GlobalKey();
  File _pickedImage;
  final _picker = ImagePicker();
  bool example = false;

  Map<String, String> map = {
    'key': '1',
    'key1': '1',
    'key2': '1',
    'key3': '1',
    'key4': '1',
    'key5': '1',
    'key6': '1',
    'key7': '1',
    'key8': '1',
    'key9': '1'
  };

  List list = [];
  String someThing = '' ?? 'kjhs';

  @override
  Widget build(BuildContext context) {

    for(int i=0;i<map.length;i++){
      print(map[i]);
    }

    map.forEach((key, value) {
      print(key);
      print(value);
    });

    list.forEach((element) {

    });

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      key: _homeScaffoldKey,
      appBar: AppBar(
        title: Text('Home Screen'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
      ),
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (_pickedImage == null)
                      ? RaisedButton(
                          onPressed: () {
                            pickingOptions();
                          },
                          child: Text('Image'),
                        )
                      : Container(),
                  (_pickedImage != null)
                      ? Stack(
                          children: [
                            Container(
                              width: 300,
                              height: 300,
                              child: Image.file(_pickedImage, fit: BoxFit.fill),
                            ),
                            Positioned(
                              right: 10,
                              top: 10,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    _pickedImage = null;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(margin5),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blueGrey,
                                  ),
                                  child: Icon(Icons.close),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  pickFromCamera() async {
    try {
      final PickedFile pickedFile =
          await _picker.getImage(source: ImageSource.camera);
      print('pickedFile is:\n');
      print(pickedFile.path);
      if (pickedFile != null) {
        final File file = File(pickedFile.path);
        setState(() {
          _pickedImage = file;
        });
      } else {
        print('The picked file is empty');
      }

    } catch (e) {
      print(e);
    }
  }


  // Pick from Gallery

  /// Pick Images from Gallery

  // TODO Add the todo

  pickFromGallery() async {
    try {
      final PickedFile pickedFile =
          await _picker.getImage(source: ImageSource.gallery);
      print('pickedFile is:\n');
      print(pickedFile.path);
      final File file = File(pickedFile.path);
      setState(() {
        _pickedImage = file;
      });
    } catch (e) {
      print(e);
    }
  }

  pickingOptions() {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        isDismissible: true,
        enableDrag: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(margin20),
          topRight: Radius.circular(margin20),
        )),
        builder: (BuildContext context) {
          return Container(
            height: height100,
            padding: EdgeInsets.all(margin20),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    pickFromCamera();
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.camera_alt_outlined),
                      SizedBox(width: width10),
                      Container(
                        child: Text('Camera', style: TextStyle(fontSize: 18)),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height10),
                InkWell(
                  onTap: () {
                    pickFromGallery();
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.image),
                      SizedBox(width: width10),
                      Container(
                        child: Text('Gallery', style: TextStyle(fontSize: 18)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
