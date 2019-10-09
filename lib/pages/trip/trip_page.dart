import 'package:blueboard/configs/app_style.dart';
import 'package:blueboard/pages/trip/trip_bloc.dart';
import 'package:blueboard/pages/trip/trip_event.dart';
import 'package:blueboard/pages/trip/widgets/trip_budget.dart';
import 'package:blueboard/pages/trip/widgets/trip_info.dart';
import 'package:blueboard/pages/trip/widgets/trip_participant.dart';
import 'package:blueboard/widgets/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TripPage extends StatefulWidget {
  static const String tag = 'trip';

  final String tripId;

  const TripPage({Key key, this.tripId}) : super(key: key);

  @override
  _TripPageState createState() => new _TripPageState();
}

class _TripPageState extends State<TripPage> {
  TripBloc _bloc;
  
  int _selectedTabIndex = 0;

  static String id;

  static const String edit = 'Edit';
  static const String delete = 'Delete';

  static const List<String> _listChoices = <String>[
    edit,
    delete,
  ];

  static List<Widget> _widgetOptions = <Widget>[
    TripInfo(tripId: id),
    TripBudget(),
    TripParticipant(),
  ];

  @override
  void initState() {
    super.initState();
    setState(() {
      id = widget.tripId;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = Provider.of<TripBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
				centerTitle: true,
				backgroundColor: Colors.white,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: _onSelectedAction,
            itemBuilder: (BuildContext context){
              return _listChoices.map((String choice){
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
			),
			drawer: AppDrawer(),
			body: new Container(
        child: _widgetOptions.elementAt(_selectedTabIndex),
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
        currentIndex: _selectedTabIndex,
        selectedItemColor: AppStyle.primaryColor,
        onTap: _onTabItemTapped,
      ),
		);
  }
  
  void _onTabItemTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  void _onSelectedAction(String choice){
    if(choice == edit) {
      debugPrint('Edit');
    } else if(choice == delete) {
      _onDeleteTrip(id);
    }
  }

  void _onDeleteTrip(_id) {
    _bloc.dispatch(DeleteTrip(id: _id));
  }
}