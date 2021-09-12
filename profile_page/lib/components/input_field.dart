import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  InputField({ Key? key, required this.initialText, required this.fieldController, required this.labelText}) : super(key: key);

  final String initialText;
  final String labelText;
  final TextEditingController fieldController;

  @override
  Widget build(BuildContext context) {
    fieldController.text = initialText;

    return Container(
      padding: EdgeInsets.all(7.5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          fieldLabel(),
          SizedBox(height: 5.0),
          field()
        ]
      )
    );
  }

  Widget fieldLabel(){
    return Text(
      labelText, 
      style: TextStyle(
        color: Colors.grey,
        fontSize: 17.5,
        fontWeight: FontWeight.bold
      )
    );
  }

  Widget field(){
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      controller: fieldController, 
      decoration: InputDecoration(
        border: InputBorder.none,
        isCollapsed: true,
      ),
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold
      )
    );
  }
}