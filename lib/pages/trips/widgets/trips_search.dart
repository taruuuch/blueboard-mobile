import 'package:blueboard/configs/app_style.dart';
import 'package:blueboard/pages/trips/trips_bloc.dart';
import 'package:blueboard/pages/trips/trips_event.dart';
import 'package:blueboard/pages/trips/trips_state.dart';
import 'package:blueboard/services/form_validators.dart';
import 'package:blueboard/widgets/input_field.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TripSearchForm extends StatefulWidget {
	@override
	State createState() => new _TripSearchFormState();
}

class _TripSearchFormState extends State<TripSearchForm> {
	final TextEditingController _searchController = TextEditingController();

  static final DateTime _date = new DateTime.now();
  static final DateTime _minDate = new DateTime(2018, 1, 1);
  static final DateTime _maxDate = new DateTime(_date.year + 3, _date.month, _date.day);

  DateTime _fromDate;
  DateTime _toDate;

  _onSearchConfirm(TripsBloc _bloc, {String searchValue, DateTime fromDate, DateTime toDate}) {
    _bloc.dispatch(SearchTrips(
      searchValue: searchValue, 
      fromDate: fromDate, 
      toDate: toDate
    ));
  }

  _onClearPressed(TripsBloc _bloc) {
    _searchController.clear();
    
    setState(() {
      _fromDate = null;
      _toDate = null;
    });

    _bloc.dispatch(LoadTrips());
  }

	@override
	Widget build(BuildContext context) {
    final TripsBloc _bloc = Provider.of<TripsBloc>(context);
		return new Column(
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.all(AppStyle.formPadding),
          child: new StreamBuilder(
            stream: _bloc.state,
            builder: (context, snapshot) {
              return new Stack(
                alignment: Alignment(1.1, 0),
                children: <Widget>[
                  new TextFormField(
                    controller: _searchController,
                    validator: (value) => FormValidators.searchValidate(value),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      labelText: 'Input search value...',
                      border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.grey[400]),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 28,
                      ),
                    ),
                    onFieldSubmitted: (value) {
                      _onSearchConfirm(_bloc, searchValue: _searchController.text, fromDate: _fromDate, toDate: _toDate);
                    },
                  ),
                  new RawMaterialButton(
                    child: Icon(Icons.clear),
                    shape: new CircleBorder(),
                    elevation: 1.0,
                    fillColor: Colors.grey[300],
                    textStyle: TextStyle(
                      color: Colors.redAccent
                    ),
                    onPressed: () => _onClearPressed(_bloc),
                  )
                ],
              );
            },
          ),
        ),
        new Row(
          children: <Widget>[
            Expanded(
              child: new Column(
                children: <Widget>[
                  new StreamBuilder(
                    stream: _bloc.state,
                    builder: (context, snapshot) {
                      return new GestureDetector(
                        onTap: () => DatePicker.showDatePicker(
                          context,
                          showTitleActions: true,
                          minTime: _minDate,
                          maxTime: _maxDate,
                          onConfirm: (date) {
                            _fromDate = date;
                            _toDate = (_toDate != null) ? ((_fromDate.difference(_toDate).inDays > 0) ? null : _toDate) : null;

                            _onSearchConfirm(_bloc, searchValue: _searchController.text, fromDate: _fromDate, toDate: _toDate);
                          }, 
                          currentTime: _fromDate ?? _date, 
                          locale: LocaleType.en
                        ),
                        child: new Text(
                          'From date',
                          style: TextStyle(
                            fontWeight: FontWeight.w700
                          )
                        ),
                      );
                    }
                  ),
                  new StreamBuilder(
                    stream: _bloc.state,
                    builder: (context, AsyncSnapshot<TripsState> snapshot) {
                      if (snapshot.data.fromDate != null)
                        return new Column(
                          children: <Widget>[
                            new SizedBox(height: 5.0),
                            new Text(DateFormat('dd.MM.yyyy').format(snapshot.data.fromDate))
                          ],
                        );
                      else
                        return new SizedBox.shrink();
                    },
                  ),
                  new SizedBox(height: 5.0),
                ],
              )
            ),
            Expanded(
              child: new Column(
                children: <Widget>[
                  new StreamBuilder(
                    stream: _bloc.state,
                    builder: (context, snapshot) {
                      return new GestureDetector(
                        onTap: () => DatePicker.showDatePicker(
                          context,
                          showTitleActions: true,
                          minTime: (_fromDate == null) 
                            ? _minDate 
                            : new DateTime(_fromDate.year, _fromDate.month, _fromDate.day + 1),
                          maxTime: _maxDate, 
                          onConfirm: (date) {
                            _toDate = date;

                            _onSearchConfirm(_bloc, searchValue: _searchController.text, fromDate: _fromDate, toDate: _toDate);
                          }, 
                          currentTime: _toDate ?? _date, 
                          locale: LocaleType.en
                        ),
                        child: new Text(
                          'To date',
                          style: TextStyle(
                            fontWeight: FontWeight.w700
                          )
                        ),
                      );
                    }
                  ),
                  new StreamBuilder(
                    stream: _bloc.state,
                    builder: (context, AsyncSnapshot<TripsState> snapshot) {
                      if (snapshot.data.toDate != null)
                        return  new Column(
                          children: <Widget>[
                            new SizedBox(height: 5.0),
                            new Text(DateFormat('dd.MM.yyyy').format(snapshot.data.toDate)),
                          ]
                        );
                      else
                        return new SizedBox.shrink();
                    },
                  ),
                  new SizedBox(height: 5.0),
                ],
              )
            )
          ],
        ),
        new Divider(color: Colors.grey),
      ],
    );
  }
}