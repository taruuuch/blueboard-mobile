import 'package:blueboard/configs/app_style.dart';
import 'package:flutter/material.dart';

class TripItem extends StatelessWidget {
  final String id;
  final AssetImage decorationImage;
  final String title;
  final String create;

  TripItem({
    this.id,
		this.decorationImage, 
		this.title, 
		this.create
	}) : super();

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
			onTap: () => print('test tap'),
			onLongPress: () => print('test long tap'),
      child: new Card(
        margin: const EdgeInsets.only(
					left: AppStyle.tripItemPadding, 
					right: AppStyle.tripItemPadding, 
					top: AppStyle.tripItemPadding
				),
        shape: RoundedRectangleBorder(
					borderRadius: BorderRadius.circular(AppStyle.tripItemBorderRadius)
				),
        elevation: 5,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: new Container(
          padding: EdgeInsets.only(
						top: 50.0, 
						left: AppStyle.tripItemPadding, 
						right: AppStyle.tripItemPadding, 
						bottom: AppStyle.tripItemPadding
					),
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
									fontWeight: FontWeight.w900
								),
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
