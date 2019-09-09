import 'package:blueboard/configs/app_style.dart';
import 'package:blueboard/pages/trips/widgets/trips_bloc.dart';
import 'package:blueboard/pages/trips/widgets/trips_item.dart';
import 'package:blueboard/widgets/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TripsPage extends StatelessWidget {
  static const String tag = 'trips';

  @override
  Widget build(BuildContext context) =>
    new Scaffold(
      appBar: new AppBar(
        title: new Text('TRIPS'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      drawer: AppDrawer(),
      body: BlocProvider<TripsBloc> (
        builder: (context) => TripsBloc(),
        child: TripsPage(),
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Create trip',
        child: new Icon(Icons.add),
        onPressed: () => null,
      ),
    );
}