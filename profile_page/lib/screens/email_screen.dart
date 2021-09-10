import 'package:flutter/material.dart';

import '../components/header_text.dart';
import '../components/input_field.dart';
import '../components/update_button.dart';

import '../models/user.dart';


class EmailScreen extends StatelessWidget {
  const EmailScreen({ Key? key, required this.currentUser, required this.updateInfo }) : super(key: key);

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
                    child: HeaderText(textContent: 'What\'s your email?')
                  ),
                  Padding(
                    padding: EdgeInsets.all(30), 
                    child: InputField(
                      fieldController: fieldController,
                      labelText: 'Your email address',
                      initialText: currentUser.email)
                  )
                ]
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 300),
                child: UpdateButton(
                  updateFunction: () {
                    updateEmailAddress(fieldController, context);
                  }
                )
              )
            ]
          )
        )
      )
    );
  }

  updateEmailAddress(TextEditingController fieldController, BuildContext context) {
    currentUser.email = fieldController.text;
    updateInfo();
    Navigator.pop(context);
  }
}