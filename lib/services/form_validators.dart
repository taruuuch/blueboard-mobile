class FormValidators {
  static String emailRegex = r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static var _validatorConstants = {
    'empty_email'    : 'Enter email',
    'invalid_email'  : 'Invalid email',
    'emply_password' : 'Enter password',
    'password_length': 'Minimum password length 6',
    'password_repeat': 'Please repeat your password',
    'password_not_match': 'Your password not matched',
		'first_name_empty': 'Please enter your name',
		'last_name_empty': 'Please enter your last name',
		'search_empty': 'Please enter your search value',
		'name_empty': 'Please enter trip name',
		'description_empty': 'Please enter trip description',
  };

  static Function(String) emailValidate = (String value) {
    if (value.isEmpty) {
        return _validatorConstants['empty_email'];
    } else if (!RegExp(emailRegex).hasMatch(value)) {
      return _validatorConstants['invalid_email'];
    }

    return null;
  };

  static Function(String) passwordValidate = (String value) {
    if (value.isEmpty) {
      return _validatorConstants['emply_password'];
    } else if (value.length < 6) {
      return _validatorConstants['password_length'];
    }

    return null;
  };

  static Function(String, String) passwordRepeatValidate = (String value, String password) {
    if (value.isEmpty) {
      return _validatorConstants['password_repeat'];
    } else if (value != password) {
      return _validatorConstants['password_not_match'];
    }

    return null;
  };

	static Function(String) firstNameValidate = (String value) {
		if (value.isEmpty) {
			return _validatorConstants['first_name_empty'];
		}

		return null;
	};

	static Function(String) lastNameValidate = (String value) {
		if (value.isEmpty) {
			return _validatorConstants['last_name_empty'];
		}

		return null;
	};

	static Function(String) searchValidate = (String value) {
		if (value.isEmpty) {
			return _validatorConstants['search_empty'];
		}

		return null;
	};

  static Function(String) nameValidate = (String value) {
    if (value.isEmpty) {
			return _validatorConstants['name_empty'];
		}

    return null;
  };

  static Function(String) descriptionValidate = (String value) {
    if (value.isEmpty) {
			return _validatorConstants['description_empty'];
		}

    return null;
  };
}