class Validator {
  static String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    if (value == null || value.isEmpty) {
      return 'Enter email';
    }

    return !regex.hasMatch(value.toLowerCase()) ? 'Email is not valid' : null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) return 'Enter password';
    if (password.length < 6) return 'Password is too short';
    if (password.length > 12) return 'Password is too long';
    return null;
  }

  static String? validateAge(String? age) {
    if (age == null || age.isEmpty) return 'Enter your age';
    final int? ageNum = int.tryParse(age);
    if (ageNum == null) return 'Please use numbers only';
    if (ageNum < 18 || ageNum > 99) return 'Sorry, you can\'t use the app';
    return null;
  }
}
