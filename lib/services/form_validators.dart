class FormValidators {
  static String emailRegex = r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static var _validatorConstants = {
    'empty_email'    : 'Enter email',
    'invalid_email'  : 'Invalid email',
    'emply_password' : 'Enter password',
    'password_length': 'Minimum password length 6',
    'password_repeat': 'Please repeat your password',
    'password_not_match': 'Your password not matched',
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

  static Function(String) passwordRepeatValidate = (String value) {
    if (value.isEmpty) {
      return _validatorConstants['password_repeat'];
    } 
    // else if (value != password) {
    //   return _validatorConstants['password_not_match'];
    // }
    return null;
  };
}