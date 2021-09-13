import 'package:flutter/material.dart';

import '../components/header_text.dart';
import '../components/input_field.dart';
import '../components/update_button.dart';

import '../models/user.dart';


class BioScreen extends StatefulWidget {
  const BioScreen({ Key? key, required this.currentUser, required this.updateInfo }) : super(key: key);

  final User currentUser;

  //This function is taken as a parameter and sets the state on the profile screen
  final void Function() updateInfo;

  @override
  _BioScreenState createState() => _BioScreenState();
}

class _BioScreenState extends State<BioScreen> {

  //Track text field input so its not lost on dismissed keyboard rebuild. 
  String? bio;

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
        bio = fieldController.text;

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
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0), 
                      child: HeaderText(textContent: 'What type of passenger are you?')
                    ),
                    Padding(
                      padding: EdgeInsets.all(30), 
                      child: InputField(
                        fieldController: fieldController,
                        labelText: 'Write a little about yourself.',
                        initialText: bio ?? widget.currentUser.bio)
                    )
                  ]
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: UpdateButton(
                    updateFunction: () {
                      updateBio(fieldController, context);
                    }
                  )
                ),
                Container() //responsive padding for Update Button
              ]
            )
          )
        )
      )
    );
  }

  updateBio(TextEditingController fieldController, BuildContext context) {
    widget.currentUser.bio = fieldController.text;
    
    widget.updateInfo();
    Navigator.pop(context);
  }
}