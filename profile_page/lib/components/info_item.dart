import 'package:flutter/material.dart';

import '../screens/name_screen.dart';

class InfoItem extends StatelessWidget {
  const InfoItem({ Key? key, required this.title, required this.content, required this.screen }) : super(key: key);

  final String title;
  final String content;
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: info(),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => screen
          )
        );
      }
    );
  }

  Widget info() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30.0),
          width: double.infinity,
          decoration: underline(), 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleText(),
              contentText(),
            ]
          )
        ),
        Positioned(
          right: 30, 
          child: Padding(
            padding: EdgeInsets.all(10.0), 
            child: Icon(Icons.arrow_forward_ios, color: Colors.grey)
          )
        )
      ]
    );
  }

  //info components:

  Widget titleText(){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0), 
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.grey
        )
      )
    );
  }

  Widget contentText(){
    return Padding( 
      padding: EdgeInsets.only(right: 60.0, bottom: 10.0),
      child: Text(
        content,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        )
      )
    );
  }

  BoxDecoration underline(){
    return BoxDecoration(
      border: Border(
        bottom: BorderSide(
          width: 1.0, 
          color: Colors.grey
        )
      )
    );
  }

}