import 'package:flutter/material.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Empty invisible Appbar
        backgroundColor: Colors.transparent,
        elevation: 0.0
      ),
      body: Text('This is the email screen')
      
    );
  }
}