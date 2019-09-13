import 'package:blueboard/configs/app_style.dart';
import 'package:blueboard/services/form_validators.dart';
import 'package:blueboard/widgets/flat_button.dart';
import 'package:blueboard/widgets/input_field.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class TripSearchForm extends StatefulWidget {
	@override
	State createState() => new _TripSearchFormState();
}

class _TripSearchFormState extends State<TripSearchForm> {
	final TextEditingController _searchController = TextEditingController();

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
                    minTime: DateTime(2018, 3, 5),
                    maxTime: DateTime.now(), 
                    onChanged: (date) {
                      // _fromDate = DateFormat('yyyy-MM-dd').format(date);
                    },
                    onConfirm: (date) {
                      // _fromDate = DateFormat('yyyy-MM-dd').format(date);
                    }, 
                    currentTime: DateTime.now(), 
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
                    minTime: DateTime(2018, 3, 5),
                    maxTime: DateTime.now(), 
                    onChanged: (date) {
                      // _toDate = DateFormat('yyyy-MM-dd').format(date);
                    },
                    onConfirm: (date) {
                      // _toDate = DateFormat('yyyy-MM-dd').format(date);
                    }, 
                    currentTime: DateTime.now(), 
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