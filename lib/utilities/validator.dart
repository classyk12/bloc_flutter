class Validator {
  Validator._();

  static validateDefault(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    return null;
  }

  static validateBVN(String? value) {
    if (value == null || value.isEmpty || value.length < 11) {
      return 'Enter a valid BVN';
    }
    return null;
  }

  static validateCHN(String? value) {
    if (value == null || value.isEmpty || value.length > 10) {
      return 'Enter a valid CHN';
    }
    return null;
  }

  static validateDigit(String? value) {
    if (value == null || value.isEmpty || double.parse(value) < 1) {
      return 'Enter a valid value';
    }
    return null;
  }

  static validateDropdown(value) {
    if (value == null || value.isEmpty) {
      return 'Please select a value';
    }
    return null;
  }

  static validatephone(String value) {
    if (value.isEmpty) {
      return 'Please enter a valid phone number';
    }
    return null;
  }
}
