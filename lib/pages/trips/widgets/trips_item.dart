import 'package:flutter/material.dart';

class TripItem extends StatelessWidget {
  final AssetImage decorationImage;
  final String title;
  final String create;

  TripItem({
		this.decorationImage, 
		this.title, 
		this.create
	}) : super();

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
			onTap: () => print('tap'),
			onLongPress: () => print('long tap'),
      child: new Card(
        margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 5,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: new Container(
          padding: EdgeInsets.only(top: 50.0, left: 15.0, right: 15.0, bottom: 15.0),
          decoration: new BoxDecoration(
						image: DecorationImage(
							image: decorationImage,
							fit: BoxFit.cover,
							colorFilter: new ColorFilter.mode(
								Colors.black.withOpacity(0.5), 
								BlendMode.dstATop
							)
						),
						color: Colors.black
					),
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              ),
              new Text(
                create,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
