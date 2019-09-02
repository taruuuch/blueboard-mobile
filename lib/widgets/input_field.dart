import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextInputType keyboardType;
  final String labelText;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final Function formValidator; 

  InputField({
    key, 
    this.keyboardType, 
    this.labelText, 
    this.obscureText,
    this.controller,
    this.textInputAction,
    this.formValidator,
  }) : super(key: key);

  final FocusNode _focusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      textInputAction: textInputAction,
      focusNode: _focusNode,
      decoration: InputDecoration(
        labelText: labelText,
        border: new OutlineInputBorder(
          borderSide: new BorderSide(color: Colors.grey[400]),
        ),
      ),
      onFieldSubmitted: (value) {
        _focusNode.unfocus();
        FocusScope.of(context).nextFocus();
      },
      validator: (value) => ''
    );
  }
}