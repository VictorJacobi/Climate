import 'package:flutter/material.dart';

class MyCreatedForm extends StatelessWidget {
  MyCreatedForm({this.myIcon,@required this.initializedText,@required this.onChanged});
  final Icon myIcon;
  final String initializedText;
  final Function onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: Colors.black,
      ),
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText:initializedText,
        icon: myIcon,
        border:OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide.none,
        ),

        hintStyle: TextStyle(
          color: Colors.grey,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}