import 'package:blueboard/configs/app_constans.dart';
import 'package:blueboard/configs/app_style.dart';
import 'package:blueboard/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInSocial extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Column(
    children: <Widget>[
      new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: new Divider(
              color: Colors.blueGrey,
              endIndent: AppStyle.signInDividerPadding,
            ),
          ),
          new RichText(
            textAlign: TextAlign.center,
            text: new TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  text: AppConstants.signInSocialLabel, 
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            )
          ),
          Expanded(
            child: new Divider(
              color: Colors.blueGrey,
              indent: AppStyle.signInDividerPadding,
            ),
          ),
        ],
      ),
      new SizedBox(
        height: 15.0,
      ),
      new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Button(
            child: new Icon(FontAwesomeIcons.facebookF),
            color: Colors.blue,
            splashColor: Colors.blueAccent,
            textColor: Colors.white,
            onPressed: () => {},
          ),
          new Button(
            child: new Icon(FontAwesomeIcons.google),
            color: Colors.white,
            splashColor: Colors.redAccent,
            textColor: Colors.blue,
            onPressed: () => {},
          ),
          new Button(
            child: new Icon(FontAwesomeIcons.telegramPlane),
            color: Colors.lightBlue,
            splashColor: Colors.lightBlueAccent,
            textColor: Colors.white,
            onPressed: () => {},
          ),
        ],
      ),
    ],
  );
}