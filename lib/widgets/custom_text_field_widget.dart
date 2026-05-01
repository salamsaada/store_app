import 'package:flutter/material.dart';

class CostumTextField extends StatelessWidget {
   CostumTextField({this.onChange ,super.key, this.hintText , this.obscureText, this.inputType});
  
  Function(String)? onChange;
  String? hintText;
  TextInputType? inputType;
  bool? obscureText ;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText!,
      keyboardType: inputType,
          onChanged: onChange ,
           decoration: InputDecoration(
            hintText: hintText,
            border:  OutlineInputBorder(
              borderSide: BorderSide(),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                //color: Colors.white,
              ),
            ),
           ),
          );
  }
}