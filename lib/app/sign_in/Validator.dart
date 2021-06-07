abstract class StringValidator {
  bool isValid(String value);
}

class NonEmptyString implements StringValidator {
  @override
  bool isValid(String value) {
    return value.isNotEmpty;
  }
}

class EmailAndPasswordValidators {
  final StringValidator emailValidator = NonEmptyString();
  final StringValidator passwordValidator = StrongPassword();
  final String invalidEmailErrorText = 'Email cant be empty';
  final String invalidPasswordErrorText = 'Password cant be empty';
}

class StrongPassword implements StringValidator {
  @override
  bool isValid(String value) {
    return value.contains(new RegExp(r'^.{8,}$'));
  }
}
