import 'package:flutter/material.dart';

import '../components/header_text.dart';
import '../components/input_field.dart';
import '../components/update_button.dart';

import '../models/user.dart';


class NameScreen extends StatelessWidget {
  const NameScreen({ Key? key, required this.currentUser, required this.updateInfo }) : super(key: key);

  final User currentUser;

  //This function is taken as a parameter and sets the state on the profile screen
  final void Function() updateInfo;

  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();

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
                    child: HeaderText(textContent: 'What\'s your name?')
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 30.0, right: 5.0, top: 30.0), 
                          child: InputField(
                            fieldController: firstNameController,
                            labelText: 'First Name',
                            initialText: currentUser.firstName)
                        )
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 30.0, left: 5.0, top: 30.0), 
                          child: InputField(
                            fieldController: lastNameController,
                            labelText: 'Last Name',
                            initialText: currentUser.lastName)
                        )
                      ),
                    ]
                  )
                ]
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 300),
                child: UpdateButton(
                  updateFunction: () {
                    updateName(firstNameController, lastNameController, context);
                  }
                )
              )
            ]
          )
        )
      )
    );
  }

  updateName(firstNameController, lastNameController, context) {
    currentUser.firstName = firstNameController.text;
    currentUser.lastName = lastNameController.text;
    updateInfo();
    Navigator.pop(context);
  }
}