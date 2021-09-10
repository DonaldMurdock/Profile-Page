import 'package:flutter/material.dart';

class UpdateButton extends StatelessWidget {
  const UpdateButton({ Key? key, required this.updateFunction }) : super(key: key);

  final void Function() updateFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60.0,
      child: ElevatedButton(
        onPressed: () {
          updateFunction();
        }, 
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black)
        ),
        child: Text('Update')
      )
    );
  }
}