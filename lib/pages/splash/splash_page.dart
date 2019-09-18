import 'dart:async';

import 'package:blueboard/configs/app_style.dart';
import 'package:blueboard/models/token.dart';
import 'package:blueboard/providers/token_provider.dart';
import 'package:blueboard/services/navigation.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  static const String tag = 'splash';

  @override
  _SplashPageState createState() => new _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _tokenProvider = TokenProvider();

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () async {
        Token _token = await _tokenProvider.getToken();
       
        if (_token == null) {
          NavigationService.toSignInPage();
        } else {
          var _date = new DateTime.now();
          var _expiresDate = new DateTime.fromMillisecondsSinceEpoch(_token.expires);

          if (_expiresDate.compareTo(_date) == 0) {
            NavigationService.toSignInPage();
          } else {
            NavigationService.toTripsPage();
          }
        }
      }
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: new Container(
                  child: new FlutterLogo(
                    size: 100,
                  ),
                )
              ),
              Expanded(
                flex: 1,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                    new SizedBox(height: AppStyle.formPadding,),
                    new Text(
                      'Blue Board\nPlan your trip!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
