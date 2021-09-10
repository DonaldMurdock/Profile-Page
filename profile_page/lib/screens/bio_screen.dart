import 'package:flutter/material.dart';

import '../components/header_text.dart';
import '../components/input_field.dart';
import '../components/update_button.dart';

import '../models/user.dart';


class BioScreen extends StatelessWidget {
  const BioScreen({ Key? key, required this.currentUser, required this.updateInfo }) : super(key: key);

  final User currentUser;

  //This function is taken as a parameter and sets the state on the profile screen
  final void Function() updateInfo;

  @override
  Widget build(BuildContext context) {
    TextEditingController fieldController = TextEditingController();

    return GestureDetector(
      //Hide keyboard when clicked outside text fields
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          //Empty invisible Appbar
          backgroundColor: Colors.transparent,
          elevation: 0.0
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0), 
                    child: HeaderText(textContent: 'What type of passenger are you?')
                  ),
                  Padding(
                    padding: EdgeInsets.all(30), 
                    child: InputField(
                      fieldController: fieldController,
                      labelText: 'Write a little about yourself.',
                      initialText: currentUser.bio)
                  )
                ]
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 250),
                child: UpdateButton(
                  updateFunction: () {
                    updateBio(fieldController, context);
                  }
                )
              )
            ]
          )
        )
      )
    );
  }

  updateBio(TextEditingController fieldController, BuildContext context) {
    currentUser.bio = fieldController.text;
    updateInfo();
    Navigator.pop(context);
  }
}