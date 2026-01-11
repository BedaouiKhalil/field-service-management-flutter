import 'package:get/get.dart';

class Validators {
  static String? validateInput({
    required String value,
    int? min,
    int? max,
    required String type,
    String? fieldName,
  }) {
    if (value.trim().isEmpty) {
      return fieldName != null
          ? '$fieldName cannot be empty'
          : 'This field cannot be empty';
    }

    if (min != null && value.length < min) {
      return fieldName != null
          ? '$fieldName must be at least $min characters long'
          : 'Must be at least $min characters long';
    }

    if (max != null && value.length > max) {
      return fieldName != null
          ? '$fieldName cannot exceed $max characters'
          : 'Cannot exceed $max characters';
    }

    switch (type) {
      case 'username':
        if (!GetUtils.isUsername(value)) {
          return fieldName != null
              ? '$fieldName is not valid'
              : 'Invalid username';
        }
        break;

      case 'email':
        if (!GetUtils.isEmail(value)) {
          return fieldName != null
              ? '$fieldName is not a valid email'
              : 'Invalid email';
        }
        break;

      case 'phone':
        if (!GetUtils.isPhoneNumber(value)) {
          return fieldName != null
              ? '$fieldName is not a valid phone number'
              : 'Invalid phone number';
        }
        break;

      case 'password':
        // if (value == null || value.trim().isEmpty) {
        //   return fieldName != null
        //       ? '$fieldName cannot be empty'
        //       : 'Password cannot be empty';
        // }
        break;

      case 'text':
        break;

      default:
        return 'Validation type not supported';
    }

    return null;
  }
}
