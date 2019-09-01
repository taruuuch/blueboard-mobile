import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final TextInputType keyboardType;
  final bool obscureText;
  final String labelText;

  InputField({
    key, 
    this.keyboardType, 
    this.labelText, 
    this.obscureText
    }) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) => new TextField(
    
  );
}
