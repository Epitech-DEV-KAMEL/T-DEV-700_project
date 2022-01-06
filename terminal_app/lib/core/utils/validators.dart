
class Validators {
  static bool containOnlyDigit(String str) => RegExp(r'^[0-9]+$').hasMatch(str);
}