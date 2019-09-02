import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Icon icon;
  final double height;
  final double minWidth;
  final Color color;
  final Color splashColor;
  final Color textColor;

  Button({
    this.icon,
    this.height,
    this.minWidth,
    this.color,
    this.splashColor,
    this.textColor,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: icon,
      height: height,
      minWidth: minWidth,
      color: color,
      splashColor: splashColor,
      textColor: textColor,
      onPressed: () => {}
    );
  }
}