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

  static final _date = new DateTime.now();
  static final _minDate = new DateTime(2018, 1, 1);
  static final _maxDate = new DateTime(_date.year + 3, _date.month, _date.day);

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
                      // _fromDate = DateFormat('yyyy-MM-dd').format(date);
                    },
                    onConfirm: (date) {
                      // _fromDate = DateFormat('yyyy-MM-dd').format(date);
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
                    minTime: _minDate,
                    maxTime: _maxDate, 
                    onChanged: (date) {
                      // _toDate = DateFormat('yyyy-MM-dd').format(date);
                    },
                    onConfirm: (date) {
                      // _toDate = DateFormat('yyyy-MM-dd').format(date);
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