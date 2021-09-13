import 'package:flutter/material.dart';

import '../components/header_text.dart';
import '../components/input_field.dart';
import '../components/update_button.dart';

import '../models/user.dart';


class NameScreen extends StatefulWidget {
  const NameScreen({ Key? key, required this.currentUser, required this.updateInfo }) : super(key: key);

  final User currentUser;

  //This function is taken as a parameter and sets the state on the profile screen
  final void Function() updateInfo;

  @override
  _NameScreenState createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {

  //Track text field input so its not lost on dismissed keyboard rebuild. 
  String? firstName;
  String? lastName;

  @override
  Widget build(BuildContext context) {

    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();

    //This height is used so we can have a properly sized scrollable column. The height changes 
    //if the keyboard is visible. 
    double columnHeight = 
      MediaQuery.of(context).size.height - 
      MediaQuery.of(context).padding.top - 
      AppBar().preferredSize.height - 
      MediaQuery.of(context).viewInsets.bottom;

    return GestureDetector(
      onTap: () {
        //preserve input
        firstName = firstNameController.text;
        lastName = lastNameController.text;

        //dismiss keyboard
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
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
                    nameHeader(),
                    Row(
                      children: [
                        firstNameField(firstNameController),
                        lastNameField(lastNameController)
                      ]
                    )
                  ]
                ),
                updateNameButton(firstNameController, lastNameController, context), 
                Container() // responsive padding for UpdateButton
              ]
            )
          )
        )
      )
    );
  }

  Widget nameHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0), 
      child: HeaderText(textContent: 'What\'s your name?')
    );
  }

  Widget firstNameField(firstNameController) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 30.0, right: 5.0, top: 30.0), 
        child: InputField(
          fieldController: firstNameController,
          labelText: 'First Name',
          initialText: firstName ?? widget.currentUser.firstName)
      )
    );
  }

  Widget lastNameField(lastNameController){
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: 30.0, left: 5.0, top: 30.0), 
        child: InputField(
          fieldController: lastNameController,
          labelText: 'Last Name',
          initialText: lastName ?? widget.currentUser.lastName)
      )
    );
  }

  Widget updateNameButton(firstNameController, lastNameController, context){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: UpdateButton(
        updateFunction: () {
          updateName(firstNameController, lastNameController, context);
        }
      )
    );
  }

  updateName(firstNameController, lastNameController, context) {
    widget.currentUser.firstName = firstNameController.text;
    widget.currentUser.lastName = lastNameController.text;
    
    widget.updateInfo();
    Navigator.pop(context);
  }
}