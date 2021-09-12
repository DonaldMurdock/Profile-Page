import 'dart:io';

import 'package:flutter/material.dart';

import '../components/header_text.dart';
import '../components/update_button.dart';

import '../models/user.dart';


class PhotoScreen extends StatefulWidget {
  const PhotoScreen({ Key? key, required this.photo, required this.currentUser, required this.updateInfo }) : super(key: key);

  final User currentUser;
  final File photo;

  //This function is taken as a parameter and sets the state on the profile screen
  final void Function() updateInfo;

  @override
  _PhoneScreenState createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhotoScreen> {

  @override
  Widget build(BuildContext context) {

    //This height is used so we can have a properly sized scrollable column. The height changes 
    //if the keyboard is visible. 
    double columnHeight = 
      MediaQuery.of(context).size.height - 
      MediaQuery.of(context).padding.top - 
      AppBar().preferredSize.height - 
      MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      appBar: AppBar(
        //Empty invisible Appbar
        backgroundColor: Colors.transparent,
        elevation: 0.0
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: columnHeight), 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  photoHeader(),
                  photo(photo)
                ]
              ),
              updatePhotoButton(),
              Container() //responsive padding for UpdateButton
            ]
          )
        )
      )
    );
  }

  Widget photoHeader(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30), 
      child: HeaderText(textContent: 'Upload a photo of yourself:')
    );
  }

  Widget photo(image){
    return AspectRatio(
      aspectRatio: 1, 
      child: Padding(
        padding: EdgeInsets.all(30), 
        child: Image.file(widget.photo, fit: BoxFit.cover)
      )
    );
  }

  Widget updatePhotoButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: UpdateButton(
        updateFunction: () {
          updatePhoto();
        }
      )
    );
  }

  updatePhoto() {
    widget.currentUser.photo = widget.photo;

    widget.updateInfo();
    Navigator.pop(context);
  }
}