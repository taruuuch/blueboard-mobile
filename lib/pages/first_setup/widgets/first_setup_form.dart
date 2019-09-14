import 'package:blueboard/configs/app_constans.dart';
import 'package:blueboard/configs/app_style.dart';
import 'package:blueboard/pages/first_setup/first_setup_bloc.dart';
import 'package:blueboard/pages/first_setup/first_setup_event.dart';
import 'package:blueboard/pages/first_setup/first_setup_state.dart';
import 'package:blueboard/services/form_validators.dart';
import 'package:blueboard/widgets/button.dart';
import 'package:blueboard/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstSetupForm extends StatefulWidget {
	@override
	State createState() => new _FirstSetupFormState();
}

class _FirstSetupFormState extends State<FirstSetupForm> {
	final _formKey = GlobalKey<FormState>();

	final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

	void _onSavePressed(FirstSetupBloc _bloc, _formKey) {
		if (!_formKey.currentState.validate()) return;

		_bloc.dispatch(SaveUserData(
			firstName: _firstNameController.text,
			lastName: _lastNameController.text
		));
	}

	@override
	Widget build(BuildContext context) {
    final FirstSetupBloc _bloc = Provider.of<FirstSetupBloc>(context);
		return new Form(
			key: _formKey,
			child: new Center(
				child: new SingleChildScrollView(
					padding: const EdgeInsets.all(AppStyle.primaryPadding),
					child: new Column(
						children: <Widget>[
							// TODO: In future this change to user avatar upload
							new FlutterLogo(size: 100),
							new SizedBox(height: AppStyle.primaryPadding),
							new InputField(
								controller: _firstNameController,
								labelText: AppConstants.firstNameLabel,
								keyboardType: TextInputType.text,
								textInputAction: TextInputAction.next,
								formValidator: (value) => FormValidators.firstNameValidate(value),
							),
							new SizedBox(height: AppStyle.primaryPadding),
							new InputField(
								controller: _lastNameController,
								labelText: AppConstants.lastNameLabel,
								keyboardType: TextInputType.text,
								textInputAction: TextInputAction.done,
								formValidator: (value) => FormValidators.lastNameValidate(value),
							),
							// TODO: Email field
							// new SizedBox(height: AppStyle.primaryPadding),
							// new InputField(
							// 	labelText: 'Your email',
							// 	keyboardType: TextInputType.text,
							// ),
							// TODO: Phone field
							// new SizedBox(height: AppStyle.primaryPadding),
							// new InputField(
							// 	labelText: 'Your phone',
							// 	keyboardType: TextInputType.text,
							// ),
							new SizedBox(height: AppStyle.primaryPadding),
							new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
									new StreamBuilder(
										stream: _bloc.state,
										builder: (context, AsyncSnapshot<FirstSetupState> snapshot) {
											return new Button(
												child: new Text(AppConstants.firstSetupButtonLabel),
												color: Colors.blue,
												splashColor: Colors.blueAccent,
												textColor: Colors.white,
												onPressed: ( !snapshot.hasData || !snapshot.data.isLoading ) ? () => _onSavePressed(_bloc, _formKey) : null,
											);
										},
									),
								],
							),
              new SizedBox(height: AppStyle.primaryPadding),
              new StreamBuilder(
                stream: _bloc.state,
                builder: (context, AsyncSnapshot<FirstSetupState> snapshot) {
                  if (snapshot.hasData && snapshot.data.error != '')
                    return new Text(
                      snapshot.data.error,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.red[900]),
                    );
                  else
                    return new SizedBox.shrink();
                },
              ),
						],
					),
				),
			),
		);
	}
}