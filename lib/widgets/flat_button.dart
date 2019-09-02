import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  final String text;
  final Color textColor;

  CustomFlatButton({
    this.text,
    this.textColor,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: new Text(text),
      textColor: textColor,
      onPressed: () => {},
    );
  }
}