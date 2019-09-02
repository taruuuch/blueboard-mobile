import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextInputType keyboardType;
  final String labelText;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final String Function(String) formValidator; 

  final FocusNode _focusNode = new FocusNode();

  InputField({
    key, 
    this.keyboardType, 
    this.labelText, 
    this.obscureText = false,
    this.controller,
    this.textInputAction = TextInputAction.next,
    this.formValidator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      textInputAction: textInputAction,
      focusNode: _focusNode,
      decoration: new InputDecoration(
        labelText: labelText,
        border: new OutlineInputBorder(
          borderSide: new BorderSide(color: Colors.grey[400]),
        ),
      ),
      onFieldSubmitted: (value) {
        _focusNode.unfocus();
        FocusScope.of(context).nextFocus();
      },
      validator: (value) => formValidator(value)
    );
  }
}