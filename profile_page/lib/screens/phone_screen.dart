import 'package:flutter/material.dart';

import '../models/user.dart';

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({ Key? key, required this.currentUser, required this.updateInfo }) : super(key: key);

  final User currentUser;
  final void Function() updateInfo;

  @override
  Widget build(BuildContext context) {
    TextEditingController fieldController = TextEditingController(text: currentUser.phoneNumber);

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
            children: [
              headerText(),
              Padding(
                padding: EdgeInsets.all(30), 
                child: inputField(fieldController)
              )
            ]
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 100),
            child: updateButton(fieldController, context)
          )
        ]
      )
    );
  }

  Widget headerText() {
    return Text(
      'What\'s your phone number?',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0
      )
    );
  }

  Widget inputField(TextEditingController fieldController) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(5), 
            child: Text(
              'Your phone number', 
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              )
            )
          ),
          Padding(
            padding: EdgeInsets.all(5), 
            child: TextFormField(
              controller: fieldController, 
              decoration: InputDecoration(border: InputBorder.none),
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold
              )

            )
          )
        ]
      )
    );
  }

  Widget updateButton(TextEditingController fieldController, BuildContext context){
    return Container(
      width: double.infinity,
      height: 60.0,
      child: ElevatedButton(
        onPressed: () {updatePhoneNumber(fieldController, context);}, 
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black)
        ),
        child: Text('Update')
      )
    );
  }

  updatePhoneNumber(TextEditingController fieldController, BuildContext context) {
    currentUser.phoneNumber = fieldController.text;
    print(currentUser.phoneNumber);
    updateInfo();
    Navigator.pop(context);
  }
}