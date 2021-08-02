import 'package:flutter_test/flutter_test.dart';
import 'package:upbase_limited/ui/signup.dart';

void main() {
  test("empty email returns error string", () {
    var result = EmailValidator.validate("");
    expect(result, "Email can\'t be empty");
  });

  test("non-empty email returns null", () {
    var result = EmailValidator.validate("email");
    expect(result, null);
  });
  test("empty password returns error string", () {
    var result = PasswordValidator.validate("");
    expect(result, "Password can\'t be empty");
  });

  test("non-empty password returns null", () {
    var result = EmailValidator.validate("password");
    expect(result, null);
  });
}
