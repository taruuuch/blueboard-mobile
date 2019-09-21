import 'package:blueboard/configs/app_style.dart';
import 'package:blueboard/models/country.dart';
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
            if (snapshot.data.error != '')
              return new Center(child: new Text(snapshot.data.error));

            if (snapshot.data.isLoading) 
              return new Center(child: new CircularProgressIndicator());

            if (snapshot.data.trip != null) {
              Trip trip = snapshot.data.trip;
              List<Country> tripCountries = trip.countries;
              return new Column(
                children: <Widget>[
                  new Container(
                    padding: EdgeInsets.only(
                      left: AppStyle.tripItemPadding, 
                      right: AppStyle.tripItemPadding, 
                      bottom: AppStyle.tripItemPadding
                    ),
                    height: 200.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: new BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/testimage.jpg'),
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
                          trip.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900
                          ),
                        )
                      ],
                    ),
                  ),
                  new Container(
                    padding: const EdgeInsets.only(
                      top: AppStyle.formPadding * 2, 
                      left: AppStyle.formPadding, 
                      right: AppStyle.formPadding, 
                      bottom: AppStyle.formPadding
                    ),
                    child: new Column(
                      children: <Widget>[
                        new Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900
                          ),
                        ),
                        new SizedBox(height: 5.0),
                        new Text(trip.description),
                        new Divider(),
                        new Text(
                          'Country visits:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900
                          ),
                        ),
                        new ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return new ListTile(
                              title: new Text(tripCountries[index].name),
                            );
                          },
                          itemCount: tripCountries.length,
                        ),
                        new Divider(),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            new Column(
                              children: <Widget>[
                                new Text(
                                  'From', 
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                                new Text(
                                  trip.startDate, 
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic
                                  ),
                                ),
                              ],
                            ),
                            new Column(
                              children: <Widget>[
                                new Text(
                                  'To', 
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                                new Text(
                                  trip.endDate, 
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return new Center(
                  child: new GestureDetector(
                onTap: () => NavigationService.toTripsPage(),
                child: new Text('Load info error!\nBack to all trips'),
              ));
            }
          } else {
            return new Center(child: new CircularProgressIndicator());
          }
        }
      )
    );
  }

  void _loadTrip() {
    _bloc.dispatch(LoadTrip(id: widget.tripId));
  }
}
