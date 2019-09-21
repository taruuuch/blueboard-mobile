import 'package:blueboard/configs/app_style.dart';
import 'package:blueboard/pages/trip/widgets/trip_info.dart';
import 'package:blueboard/widgets/drawer/drawer.dart';
import 'package:flutter/material.dart';

class TripPage extends StatefulWidget {
  static const String tag = 'trip';

  final String tripId;

  const TripPage({Key key, this.tripId}) : super(key: key);

  @override
  _TripPageState createState() => new _TripPageState();
}

class _TripPageState extends State<TripPage> {
  int _selectedIndex = 0;
  static String id;

  static List<Widget> _widgetOptions = <Widget>[
    TripInfo(tripId: id),
    Text('Price'),
    Text('People'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      id = widget.tripId;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
				title: new Text('TRIP'),
				centerTitle: true,
				backgroundColor: Colors.white,
			),
			drawer: AppDrawer(),
			body: new Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
            icon: new Icon(Icons.info),
            title: new Text('Info'),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.attach_money),
            title: new Text('Money'),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.people),
            title: new Text('People'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppStyle.primaryColor,
        onTap: _onItemTapped,
      ),
		);
  }
}