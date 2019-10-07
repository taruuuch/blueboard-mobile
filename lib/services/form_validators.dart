class FormValidators {
  static String emailRegex = r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static String loginRegex = r"^[a-z0-9_.-]*$";
  static var _validatorConstants = {
    'empty_email': 'Please enter email',
    'empty_login': 'Please enter email or username',
    'emply_password': 'Please enter enter password',
    'invalid_email': 'Please enter a valid email',
    'invalid_username': 'Please enter a valid username',
    'password_length': 'Minimum password length 6',
    'password_repeat': 'Please repeat your password',
    'password_not_match': 'Your password not matched',
    'first_name_empty': 'Please enter your name',
    'last_name_empty': 'Please enter your last name',
    'search_empty': 'Please enter your search value',
  };

  static Function(String) emailValidate = (String value) {
    if (value.isEmpty) {
      return _validatorConstants['empty_email'];
    } else if (!RegExp(emailRegex).hasMatch(value)) {
      return _validatorConstants['invalid_email'];
    }

    return null;
  };

  static Function(String) loginValidate = (String value) {
    if (value.isEmpty) {
      return _validatorConstants['empty_login'];
    } else {
      if (value.contains("@") && !RegExp(emailRegex).hasMatch(value)) {
        return _validatorConstants['invalid_email'];
      } else if (!RegExp(loginRegex).hasMatch(value)) {
        return _validatorConstants['invalid_username'];
      }
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
}
