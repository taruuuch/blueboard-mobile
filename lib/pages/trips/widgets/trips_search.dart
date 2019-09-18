import 'package:blueboard/configs/app_style.dart';
import 'package:blueboard/services/form_validators.dart';
import 'package:blueboard/widgets/flat_button.dart';
import 'package:blueboard/widgets/input_field.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter/material.dart';

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

	@override
	Widget build(BuildContext context) {
		return new Column(
			children: <Widget>[
				new Padding(
					padding: const EdgeInsets.all(AppStyle.formPadding),
					child: new InputField(
						controller: _searchController,
						formValidator: (value) => FormValidators.searchValidate(value),
						keyboardType: TextInputType.text,
						labelText: 'Input search value...',
					),
				),
				new Row(
					children: <Widget>[
            Expanded(
              child: new CustomFlatButton(
                onPressed: () => {
                  DatePicker.showDatePicker(
                    context,
                    showTitleActions: true,
                    minTime: _minDate,
                    maxTime: _maxDate,
                    onConfirm: (date) {
                      _fromDate = date;
                      _toDate = (_fromDate.difference(_toDate).inDays > 0) ? null : _toDate;
                    }, 
                    currentTime: _fromDate ?? _date, 
                    locale: LocaleType.en
                  )
                },
                text: 'From',
              )
            ),
            Expanded(
              child: new CustomFlatButton(
                onPressed: () => {
                  DatePicker.showDatePicker(
                    context,
                    showTitleActions: true,
                    minTime: (_fromDate == null) 
                      ? _minDate 
                      : new DateTime(_fromDate.year, _fromDate.month, _fromDate.day + 1),
                    maxTime: _maxDate, 
                    onConfirm: (date) {
                      _fromDate = _fromDate ?? _date;
                      _toDate = date;
                    }, 
                    currentTime: _toDate ?? _date, 
                    locale: LocaleType.en
                  )
                },
                text: 'To',
              )
            )
					],
				),
				new Divider(color: Colors.grey),
			],
		);
  }
}