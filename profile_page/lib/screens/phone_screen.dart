import 'package:flutter/material.dart';

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Empty invisible Appbar
        backgroundColor: Colors.transparent,
        elevation: 0.0
      ),
      body: Text('This is the phone screen')
      
    );
  }
}