import 'package:blueboard/configs/app_constans.dart';
import 'package:blueboard/configs/app_style.dart';
import 'package:blueboard/models/country.dart';
import 'package:blueboard/models/createTrip.dart';
import 'package:blueboard/pages/create_trip/create_trip_bloc.dart';
import 'package:blueboard/pages/create_trip/create_trip_event.dart';
import 'package:blueboard/pages/create_trip/create_trip_state.dart';
import 'package:blueboard/pages/trips/widgets/trips_search_date.dart';
import 'package:blueboard/services/form_validators.dart';
import 'package:blueboard/widgets/button.dart';
import 'package:blueboard/widgets/dropdown.dart';
import 'package:blueboard/widgets/flat_button.dart';
import 'package:blueboard/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';

class CreateTripForm extends StatefulWidget {
  @override
  State createState() => _CreateTripFormState();
}

class _CreateTripFormState extends State<CreateTripForm> {
  CreateTripBloc _bloc;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  static final DateTime _date = new DateTime.now();
  static final DateTime _minDate = new DateTime(2018, 1, 1);
  static final DateTime _maxDate = new DateTime(_date.year + 3, _date.month, _date.day);

  DateTime _startDate;
  DateTime _endDate;

  Country selectedCountry;
  CreateTrip trip;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, _getCountries);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = Provider.of<CreateTripBloc>(context);
  }

  void _getCountries() {
    _bloc.dispatch(GetCountries());
  }

  void _onCancelPressed(CreateTripBloc _bloc) {
    _bloc.dispatch(Cancel());
  }

  void _onNextStepPressed(CreateTripBloc _bloc) {
    List<String> _coutries = new List();
    _coutries.add(selectedCountry.id);

    trip = new CreateTrip(
      _nameController.text,
      _descriptionController.text,
      _startDate.toString(),
      _endDate.toString(),
      _coutries
    );

    _bloc.dispatch(AddTrip(
      trip: trip
    ));
  }

  @override
  Widget build(BuildContext context) {
    return new Form(
      key: _formKey,
      child: new SingleChildScrollView(
        padding: const EdgeInsets.all(AppStyle.formPadding),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new InputField(
                controller: _nameController,
                keyboardType: TextInputType.text,
                formValidator: (value) => FormValidators.nameValidate(value),
                labelText: AppConstants.nameTripLabel,
                textInputAction: TextInputAction.next,
                fieldSubmitted: (value) {
                  FocusScope.of(context).nextFocus();
                },
              ),
              new SizedBox(height: AppStyle.primaryPadding),
              new StreamBuilder(
                stream: _bloc.state,
                builder: (context, AsyncSnapshot<CreateTripState> snapshot) {
                  return new DropDownField(
                    value: selectedCountry,
                    required: true,
                    strict: true,
                    labelText: AppConstants.createTripCountriesLabel,
                    items: (snapshot.hasData) ? snapshot.data.countries : null,
                    setter: (dynamic value) {
                      setState(() => selectedCountry = value);
                    },
                    onValueChanged: (value) => setState(() => selectedCountry = value),
                    getTitle: (item) => item.name,
                  );
                },
              ),
              new SizedBox(height: AppStyle.primaryPadding),
              new InputField(
                controller: _descriptionController,
                keyboardType: TextInputType.text,
                formValidator: (value) => FormValidators.descriptionValidate(value),
                labelText: AppConstants.descriptionTripLabel,
                textInputAction: TextInputAction.next,
                fieldSubmitted: (value) {
                  FocusScope.of(context).nextFocus();
                },
              ),
              new SizedBox(height: AppStyle.primaryPadding),
              new StreamBuilder(
                stream: _bloc.state,
                builder: (context, AsyncSnapshot<CreateTripState> snapshot) {
                  return new GestureDetector(
                    onTap: () => DatePicker.showDatePicker(
                      context,
                      showTitleActions: true,
                      minTime: _minDate,
                      maxTime: _maxDate,
                      onConfirm: (date) {
                        setState(() => { _startDate = date });
                      },
                      currentTime: _date,
                      locale: LocaleType.en
                    ),
                    child: new TripsSearchDate(
                      title: 'Start trip date',
                      date: _startDate,
                    )
                  );
                }
              ),
              new SizedBox(height: AppStyle.primaryPadding),
              new StreamBuilder(
                stream: _bloc.state,
                builder: (context, AsyncSnapshot<CreateTripState> snapshot) {
                  return new GestureDetector(
                    onTap: () => DatePicker.showDatePicker(
                      context,
                      showTitleActions: true,
                      minTime: _minDate,
                      maxTime: _maxDate,
                      onConfirm: (date) {
                        setState(() => { _endDate = date });
                      },
                      currentTime: _date,
                      locale: LocaleType.en
                    ),
                    child: new TripsSearchDate(
                      title: 'End trip date',
                      date: _endDate,
                    )
                  );
                }
              ),
              new SizedBox(height: AppStyle.primaryPadding),
              new Row(
                children: <Widget>[
                  Expanded(
                    child: new StreamBuilder(
                      stream: _bloc.state,
                      builder: (context, snapshot) {
                        return new CustomFlatButton(
                          text: 'Cancel',
                          textColor: Colors.black54,
                          onPressed: () => _onCancelPressed(_bloc),
                        );
                      }
                    )
                  ),
                  Expanded(
                    child: new StreamBuilder(
                      stream: _bloc.state,
                      builder: (context, AsyncSnapshot<CreateTripState> snapshot) {
                        return new Button(
                          child: new Text('Next step'),
                          color: Theme.of(context).buttonColor,
                          textColor: Colors.white,
                          onPressed: () => _onNextStepPressed(_bloc),
                        );
                      }
                    ),
                  )
                ],
              )
            ],
          ),
      ),
    );
  }
}