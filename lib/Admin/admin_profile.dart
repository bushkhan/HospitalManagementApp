import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart' as imagepicker;
import 'dart:io';
import 'package:hive/hive.dart';

class AdminProfile extends StatefulWidget {
  @override
  AdminProfileState createState() => AdminProfileState();
}

class AdminProfileState extends State<AdminProfile> {
  @override
  Box dataBox;
  var id;
  var name;
  var email;
  void initState() {
    // TODO: implement initState
    super.initState();
    dataBox = Hive.box("logindata");
    id = dataBox.get('name');
    email = dataBox.get('email');
    name = dataBox.get('mobile');
  }

  @override
  var _imageFile;
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Scaffold(
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: true,
            body: ListView(
              children: [
                Form(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/profile_bg.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                Text(
                                  "Profile",
                                  style: TextStyle(
                                      fontSize: 24.0,
                                      //letterSpacing: 1.5,
                                      color: Colors.white,
                                      fontFamily: 'Kumbh Sans',
                                      fontWeight: FontWeight.w500),
                                ),
                                IconButton(
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
                                    onPressed: null),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          imageProfile(),
                          SizedBox(
                            height: 50.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 18.0,
                              ),
                              Text(
                                'ID ',
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            margin: EdgeInsets.only(left: 15.0, right: 15.0),
                            padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              // color: Color(0xFFEFF3F6),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.1),
                                  offset: Offset(6, 2),
                                  blurRadius: 3.0,
                                  spreadRadius: 3.0,
                                ),
                              ],
                            ),
                            child: TextFormField(
                              initialValue: id,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  fontFamily: 'Kumbh Sans',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 18.0,
                              ),
                              Text(
                                'Email',
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            margin: EdgeInsets.only(left: 15.0, right: 15.0),
                            padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              // color: Color(0xFFEFF3F6),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.1),
                                  offset: Offset(6, 2),
                                  blurRadius: 3.0,
                                  spreadRadius: 3.0,
                                ),
                              ],
                            ),
                            child: TextFormField(
                              initialValue: email,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                enabled: false,
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 18.0,
                              ),
                              Text(
                                'Name',
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            margin: EdgeInsets.only(left: 15.0, right: 15.0),
                            padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              // color: Color(0xFFEFF3F6),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.1),
                                  offset: Offset(6, 2),
                                  blurRadius: 3.0,
                                  spreadRadius: 3.0,
                                ),
                              ],
                            ),
                            child: TextFormField(
                              initialValue: name,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  fontFamily: 'Kumbh Sans',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget nameTextField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Mobile',
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            // backgroundColor: Colors.black,
            radius: 60.0,
            backgroundImage: _imageFile == null
                ? AssetImage("images/profile_Image.jpg")
                : FileImage(File(_imageFile.path)),
          ),
          Positioned(
            bottom: 10.0,
            right: 20.0,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context, builder: (builder) => bottomSheet());
              },
              child: Icon(
                Icons.camera_alt,
                color: Colors.blue.shade100,
                size: 30.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 20.0,
      ),
      child: Column(
        children: [
          Text(
            "Choose Profile Photo",
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton.icon(
                icon: Icon(Icons.camera),
                onPressed: () {
                  takePhoto(imagepicker.ImageSource.camera);
                },
                label: Text("Camera"),
              ),
              FlatButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  takePhoto(imagepicker.ImageSource.gallery);
                },
                label: Text("Gallery"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void takePhoto(source) async {
    final pickedFile = await imagepicker.ImagePicker.pickImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }
}
