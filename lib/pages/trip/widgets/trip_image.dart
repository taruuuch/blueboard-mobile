import 'package:blueboard/configs/app_style.dart';
import 'package:flutter/material.dart';

class TripImage extends StatelessWidget {
  final AssetImage image;
  final String title;

  TripImage({
    this.image, 
    this.title
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: AppStyle.tripItemPadding, 
        right: AppStyle.tripItemPadding, 
        bottom: AppStyle.tripItemPadding
      ),
      height: 200.0,
      width: MediaQuery.of(context).size.width,
      decoration: new BoxDecoration(
        image: DecorationImage(
          image: image,
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(
            Colors.black.withOpacity(0.7), 
            BlendMode.dstATop
          )
        ),
        color: Colors.black,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black54,
            offset: Offset(0, 1.0),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w900
            ),
          )
        ],
      ),
    );
  }
}