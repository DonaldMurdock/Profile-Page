import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import '../components/header_text.dart';
import '../components/update_button.dart';

import '../models/user.dart';


class PhotoScreen extends StatefulWidget {
  const PhotoScreen({ Key? key, required this.currentUser, required this.updateInfo }) : super(key: key);

  final User currentUser;

  //This function is taken as a parameter and sets the state on the profile screen
  final void Function() updateInfo;

  @override
  _PhoneScreenState createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhotoScreen> {

  File? image;

  @override
  void initState() {
    image = widget.currentUser.photo;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        //Empty invisible Appbar
        backgroundColor: Colors.transparent,
        elevation: 0.0
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              photoHeader(),
              photo(image)
            ]
          ),
          updatePhotoButton(),
          Container() //responsive padding for UpdateButton
        ]
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
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 1, 
          child: Padding(
            padding: EdgeInsets.all(30), 
            child: image == null 
              ? Image.asset('assets/images/headshot.png', fit: BoxFit.cover) 
              : Image.file(image, fit: BoxFit.cover)
          )
        ),
        Padding(padding: EdgeInsets.all(40), child: Container(
          alignment: Alignment.topRight, 
          child: Container(
            decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            child: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () async {
                await getImage();
                setState(() {});
              }
            )
          )
        ))
      ]
    );
  }

  Future<void> getImage() async {
    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    image = File(pickedFile!.path);
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
    widget.currentUser.photo = image;

    widget.updateInfo();
    Navigator.pop(context);
  }
}