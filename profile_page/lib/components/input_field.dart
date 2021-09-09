import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  InputField({ Key? key, required this.initialText, required this.fieldController, required this.labelText}) : super(key: key);

  final String initialText;
  final String labelText;
  TextEditingController fieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    fieldController.text = initialText;

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
              labelText, 
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
              keyboardType: TextInputType.multiline,
              maxLines: null,
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
}