import 'package:blueboard/configs/app_constans.dart';
import 'package:blueboard/models/trip.dart';
import 'package:blueboard/pages/trips/trips_bloc.dart';
import 'package:blueboard/pages/trips/trips_event.dart';
import 'package:blueboard/pages/trips/trips_state.dart';
import 'package:blueboard/pages/trips/widgets/trips_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TripList extends StatefulWidget {
  @override
  State createState() => _TripListState();
}

class _TripListState extends State<TripList> {
  TripsBloc _bloc;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, _loadTrips);
    // WidgetsBinding.instance.addPostFrameCallback(_loadTrips);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = Provider.of<TripsBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new StreamBuilder(
            stream: _bloc.state,
            builder: (context, AsyncSnapshot<TripsState> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.isLoading) return new Center(child: new CircularProgressIndicator());

                if (snapshot.data.trips.isNotEmpty) {
                  List<Trip> items = snapshot.data.trips;
                  return new ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return new TripItem(
                        decorationImage: AssetImage('assets/testimage.jpg'),
                        title: items[index].name,
                        create: items[index].description,
                      );
                    },
                    itemCount: items.length,
                  );
                } else {
                  return new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text(AppConstants.tripsNotFound),
                      new GestureDetector(
                        onTap: () => print('tap to create trip!'),
                        child: new Text(
                          AppConstants.tripsOnScreenCreateTrip,
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  );
                }
              } else {
                return new SizedBox.shrink();
              }
            }));
  }

  void _loadTrips() {
    _bloc.dispatch(LoadTrips());
  }
}
