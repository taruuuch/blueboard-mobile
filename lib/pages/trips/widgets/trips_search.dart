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
  static DateTime _fromDate;
  static DateTime _toDate;

	@override
	Widget build(BuildContext context) => 
		new Column(
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
                    onChanged: (date) {
                      _fromDate = date;
                    },
                    onConfirm: (date) {
                      _fromDate = date;
                    }, 
                    currentTime: _date, 
                    locale: LocaleType.en
                  )
                },
                text: 'From',
              ),
            ),
            Expanded(
              child: new CustomFlatButton(
                onPressed: () => {
                  DatePicker.showDatePicker(
                    context,
                    showTitleActions: true,
                    minTime: new DateTime(_fromDate.year, _fromDate.month, _fromDate.day + 1),
                    maxTime: _maxDate, 
                    onChanged: (date) {
                      _toDate = date;
                    },
                    onConfirm: (date) {
                      _toDate = date;
                    }, 
                    currentTime: _date, 
                    locale: LocaleType.en
                  )
                },
                text: 'To',
              ),
            )
					],
				),
				new Divider(color: Colors.grey),
			],
		);
}