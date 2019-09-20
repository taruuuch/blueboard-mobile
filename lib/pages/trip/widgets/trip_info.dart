import 'package:blueboard/configs/app_style.dart';
import 'package:blueboard/models/trip.dart';
import 'package:blueboard/pages/trip/trip_bloc.dart';
import 'package:blueboard/pages/trip/trip_event.dart';
import 'package:blueboard/pages/trip/trip_state.dart';
import 'package:blueboard/services/navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TripInfo extends StatefulWidget {
  final String tripId;

  const TripInfo({Key key, this.tripId}) : super(key: key);

  @override
  _TripInfoState createState() => new _TripInfoState();
}

class _TripInfoState extends State<TripInfo> {
  TripBloc _bloc;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, _loadTrip);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = Provider.of<TripBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new StreamBuilder(
          stream: _bloc.state,
          builder: (context, AsyncSnapshot<TripState> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.isLoading) return new Center(child: new CircularProgressIndicator());

              if (snapshot.data.trip != null) {
                Trip trip = snapshot.data.trip;
                return new Column(
                  children: <Widget>[
                    new Text(trip.name),
                    new Text(trip.description),
                    new Text(trip.countries),
                    new Text(trip.startDate),
                    new Text(trip.endDate)
                  ],
                );
              } else {
                return new Center(
                  child: new GestureDetector(
                    onTap: () => NavigationService.toTripsPage(),
                    child: new Text('Load info error! Back to all trips'),
                  )
                );
              }
            } else {
              return new Center(child: new Text(snapshot.data.error));
            }
          }
        )
    );
  }

  void _loadTrip() {
    print(widget.tripId);
    _bloc.dispatch(LoadTrip(id: widget.tripId));
  }
}
