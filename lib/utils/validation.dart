// ignore: avoid_classes_with_only_static_members

class InputValidator {
  static String? email(String? value) {
    if (Validations.isEmpty(value)) {
      return 'Please enter your email address';
    }
    if (!Validations.isValidEmail(value)) {
      return 'Please enter a correct email address';
    }
    return null;
  }

  static String? password(String? value) {
    if (Validations.isEmpty(value)) {
      return 'Please enter your password';
    }
    if (!Validations.isValidPassword(value)) {
      return 'Your password must contain at least 6 characters';
    }
    return null;
  }

  static String? firstName(String? value) {
    if (Validations.isEmpty(value)) return 'Please enter your first name';
    return null;
  }
  static String? projectName(String? value) {
    if (Validations.isEmpty(value))
      return 'Please enter your project name';
    return null;
  }

  static String? phoneNumber(String? value) {
    if (Validations.isEmpty(value)) return 'Please enter your phone number';
    return null;
  }

  static String? projectManager(String? value) {
    if (Validations.isEmpty(value)) return 'Please enter project manager';
    return null;
  }

  static String? clientName(String? value) {
    if (Validations.isEmpty(value)) return 'Please enter client name';
    return null;
  }

  static String? clientEmail(String? value) {
    if (Validations.isEmpty(value)) {
      return 'Please enter client email address';
    }
    if (!Validations.isValidEmail(value)) {
      return 'Please enter a correct client email address';
    }
    return null;
  }

  static String? industry(String? value) {
    if (Validations.isEmpty(value)) {
      return 'Please enter client email address';
    }
    if (value!.length > 2) {
      return 'Please enter a correct client email address';
    }
    return null;
  }


}



// TODO: Rename the class to Validator and the file to validator.dart
class Validations {
  static const _emailRegex =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static const _passwordRegex = r'[A-Za-z0-9]{6,}$';

  static bool hasMatchWithRegex(String value, String regexPattern) {
    return RegExp(regexPattern).hasMatch(value);
  }

  static bool isEmpty(String? value) {
    return value?.trim().isEmpty ?? true;
  }

  static bool isValidEmail(String? value) {
    return RegExp(_emailRegex).hasMatch(value ?? '');
  }

  static bool isValidPassword(String? value) {
    return RegExp(_passwordRegex).hasMatch(value ?? '');
  }




}


