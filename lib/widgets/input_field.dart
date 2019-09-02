import 'package:blueboard/services/form_validators.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextInputType keyboardType;
  final String labelText;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final FocusNode focusNode;
  final FormValidators formValidators; 

  InputField({
    key, 
    this.keyboardType, 
    this.labelText, 
    this.obscureText,
    this.controller,
    this.textInputAction,
    this.focusNode,
    this.formValidators,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      textInputAction: textInputAction,
      focusNode: focusNode,
      decoration: InputDecoration(
        labelText: labelText,
        border: new OutlineInputBorder(
          borderSide: new BorderSide(color: Colors.grey[400]),
        ),
      ),
      onFieldSubmitted: (value) {
        focusNode.unfocus();
        FocusScope.of(context).nextFocus();
      },
      validator: (value) => FormValidators.emailValidate(value)
    );
  }
}