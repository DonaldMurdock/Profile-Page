import 'package:flutter/material.dart';

import '../components/header_text.dart';
import '../components/input_field.dart';
import '../components/update_button.dart';

import '../models/user.dart';


class PhoneScreen extends StatefulWidget {
  const PhoneScreen({ Key? key, required this.currentUser, required this.updateInfo }) : super(key: key);

  final User currentUser;

  //This function is taken as a parameter and sets the state on the profile screen
  final void Function() updateInfo;

  @override
  _PhoneScreenState createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {

  //Track text field input so its not lost on dismissed keyboard rebuild. 
  String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    TextEditingController fieldController = TextEditingController();

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
        phoneNumber = fieldController.text;

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
                    phoneHeader(),
                    phoneField(fieldController)
                  ]
                ),
                updatePhoneButton(fieldController, context),
                Container() //responsive padding for UpdateButton
              ]
            )
          )
        )
      )
    );
  }

  Widget phoneHeader(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30), 
      child: HeaderText(textContent: 'What\'s your phone number?')
    );
  }

  Widget phoneField(fieldController){
    return Padding(
      padding: EdgeInsets.all(30), 
      child: InputField(
        fieldController: fieldController,
        labelText: 'Your phone number',
        initialText: phoneNumber ?? widget.currentUser.phoneNumber)
    );
  }

  Widget updatePhoneButton(fieldController, context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: UpdateButton(
        updateFunction: () {
          updatePhoneNumber(fieldController, context);
        }
      )
    );
  }

  updatePhoneNumber(TextEditingController fieldController, BuildContext context) {
    widget.currentUser.phoneNumber = fieldController.text;
    
    widget.updateInfo();
    Navigator.pop(context);
  }
}