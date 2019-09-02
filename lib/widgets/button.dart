import 'package:blueboard/configs/app_style.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final child;
  final double minWidth = 100.0;
  final Color color;
  final Color splashColor;
  final Color textColor;
  final Function onPressed;

  Button({
    this.child,
    this.color,
    this.splashColor,
    this.textColor,
    this.onPressed,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: child,
      height: AppStyle.buttonHeight,
      minWidth: minWidth,
      color: color,
      splashColor: splashColor,
      textColor: textColor,
      onPressed: onPressed
    );
  }
}