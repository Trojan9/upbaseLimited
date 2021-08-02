import 'package:upbase_limited/providers/Auth.dart';
import 'package:upbase_limited/ui/forgottenpassword.dart';
import 'package:upbase_limited/ui/login.dart';
import 'package:upbase_limited/ui/otp.dart';
import 'package:upbase_limited/utils/formutils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'dart:async';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:provider/provider.dart';

class EmailValidator {
  static String validate(String value) {
    String _msg;
    RegExp regex = new RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (value.isEmpty) {
      _msg = "Your Email is required";
    } else if (!regex.hasMatch(value)) {
      _msg = "Please provide a valid emal address";
    }
    return _msg;
  }
}

class PasswordValidator {
  static String validate(String value) {
    return value.isEmpty ? "Please enter password" : null;
  }
}

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = new GlobalKey<FormState>();
  bool _terms = false;
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  String _firstName,
      _lastName,
      _email,
      _phoneNumber,
      _password,
      _confirmPassword;

  @override
  Widget build(BuildContext context) {
    final firstNameField = TextFormField(
      autofocus: false,
      onSaved: (value) => _firstName = value,
      decoration: buildInputDecoration("First Name", Icons.people_alt),
    );

    final lastNameField = TextFormField(
      autofocus: false,
      onSaved: (value) => _lastName = value,
      decoration: buildInputDecoration("Last Name", Icons.people),
    );

    final emailField = TextFormField(
      autofocus: false,
      validator: EmailValidator.validate,
      onSaved: (value) => _email = value,
      decoration: buildInputDecoration("Email", Icons.email),
    );

    final phoneNumber = TextFormField(
      autofocus: false,
      // obscureText: true,
      keyboardType: TextInputType.number,
      validator: (value) =>
          value.isEmpty ? "Please enter a Valid Phone Number" : null,
      onSaved: (value) => _phoneNumber = value,
      decoration: buildInputDecoration("Phone Number", Icons.phone_android),
    );

    final passwordField = TextFormField(
      autofocus: false,
      obscureText: _obscureText,
      validator: PasswordValidator.validate,
      onSaved: (value) => _password = value,
      decoration: buildInputDecoration("Password", Icons.lock),
    );

    var loading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Text(" Registering ... Please wait")
      ],
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 15,
                left: 15,
                right: 15),
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Sign Up",
                              style: TextStyle(
                                fontSize: 22,
                              ))),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 25,
                      ),
                      Container(
                        child: Form(
                            key: formKey,
                            child: Column(children: [
                              Column(
                                children: [
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("First Name:",
                                          style: TextStyle(
                                            fontSize: 15,
                                          ))),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(232, 232, 232, 1),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(5),
                                            bottomRight: Radius.circular(5),
                                            topRight: Radius.circular(5),
                                            topLeft: Radius.circular(5)),
                                      ),
                                      padding: EdgeInsets.all(7),
                                      child: firstNameField),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Last Name:",
                                          style: TextStyle(
                                            fontSize: 15,
                                          ))),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(232, 232, 232, 1),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(5),
                                            bottomRight: Radius.circular(5),
                                            topRight: Radius.circular(5),
                                            topLeft: Radius.circular(5)),
                                      ),
                                      padding: EdgeInsets.all(7),
                                      child: lastNameField),
                                  SizedBox(
                                    height: 10,
                                  ),

                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Phone Number:",
                                          style: TextStyle(
                                            fontSize: 15,
                                          ))),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(232, 232, 232, 1),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(5),
                                            bottomRight: Radius.circular(5),
                                            topRight: Radius.circular(5),
                                            topLeft: Radius.circular(5)),
                                      ),
                                      padding: EdgeInsets.all(7),
                                      child: phoneNumber),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("Password",
                                              style: TextStyle(
                                                fontSize: 15,
                                              ))),
                                      GestureDetector(
                                        onTap: _toggle,
                                        child:
                                            Text(_obscureText ? "Show" : "Hide",
                                                style: TextStyle(
                                                  color: Colors.lightBlueAccent,
                                                  fontSize: 15,
                                                )),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(232, 232, 232, 1),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(5),
                                            bottomRight: Radius.circular(5),
                                            topRight: Radius.circular(5),
                                            topLeft: Radius.circular(5)),
                                      ),
                                      padding: EdgeInsets.all(7),
                                      child: passwordField),
                                  // SizedBox(
                                  //     height:
                                  //         MediaQuery.of(context).size.height /
                                  //             35),
                                  CheckboxListTile(
                                    title: Transform(
                                      transform: Matrix4.translationValues(
                                          -16, 0.0, 0.0),
                                      child: Text.rich(
                                        TextSpan(
                                          text: 'I agree to the ',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black45),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'terms of use ',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      19, 82, 139, 1),
                                                  decoration:
                                                      TextDecoration.underline,
                                                )),
                                            TextSpan(
                                                text: 'and ',
                                                style: TextStyle(
                                                    //decoration: TextDecoration.underline,
                                                    )),
                                            TextSpan(
                                                text: 'privacy policy ',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      19, 82, 139, 1),
                                                  decoration:
                                                      TextDecoration.underline,
                                                )),
                                            // can add more TextSpans here...
                                          ],
                                        ),
                                      ),
                                    ),
                                    value: _terms,
                                    contentPadding:
                                        const EdgeInsets.only(left: 0),
                                    onChanged: (bool value) {
                                      setState(() {
                                        timeDilation = value ? 3.0 : 1.0;
                                        _terms = value;
                                      });
                                    },

                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    //secondary: const Icon(Icons.hourglass_empty),
                                  ),
                                  // SizedBox(
                                  //   height:
                                  //       MediaQuery.of(context).size.height / 40,
                                  // ),
                                  RaisedButton(
                                    elevation: 0,
                                    onPressed: () async {
                                      if (_terms == false) {
                                        Flushbar(
                                          title: "Alert!!",
                                          message:
                                              "Please agree to terms of use",
                                          duration: Duration(seconds: 5),
                                        ).show(context);
                                      } else {
                                        final form = formKey.currentState;
                                        if (form.validate()) {
                                          form.save();
                                          AuthProvider auth =
                                              Provider.of<AuthProvider>(context,
                                                  listen: false);

                                          var details = await auth.register(
                                            _firstName,
                                            _lastName,
                                            _phoneNumber,
                                            _password,
                                          );
                                          print(details);
                                          if (details['status'] == "Success") {
                                            await Flushbar(
                                              title: details['status'],
                                              message: details["message"],
                                              duration: Duration(seconds: 5),
                                            ).show(context);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        Otp()));
                                          } else {
                                            Flushbar(
                                              title: details['status'],
                                              message: details["message"],
                                              duration: Duration(seconds: 5),
                                            ).show(context);
                                          }
                                        } else {
                                          Flushbar(
                                            title: "Invalid form",
                                            message:
                                                "Please Complete the form properly",
                                            duration: Duration(seconds: 5),
                                          ).show(context);
                                        }
                                      }
                                    },
                                    textColor: Color.fromRGBO(241, 245, 248, 1),
                                    //color: Color.fromRGBO(19, 82, 139, 1),
                                    padding: EdgeInsets.all(0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                    ),
                                    child: Container(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color.fromRGBO(19, 82, 139, 1),
                                        ),
                                        color: Color.fromRGBO(19, 82, 139, 1),
                                      ),
                                      padding: const EdgeInsets.all(12),
                                      child: Center(
                                        child: Provider.of<AuthProvider>(
                                                    context,
                                                    listen: true)
                                                .issignupLoading
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                    Text(
                                                      "Please Wait",
                                                      style: TextStyle(
                                                          // fontFamily:
                                                          //     'Helvetica',
                                                          fontSize: 15),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    SizedBox(
                                                      width: 5.0,
                                                    ),
                                                    SizedBox(
                                                      child:
                                                          CircularProgressIndicator(),
                                                      height: 30.0,
                                                      width: 25.0,
                                                    ),
                                                  ])
                                            : Text(
                                                "Sign Up",
                                                style: TextStyle(fontSize: 15),
                                                textAlign: TextAlign.center,
                                              ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 40,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  SignUp()));
                                    },
                                    child: Text.rich(TextSpan(
                                        text: 'Already have an account? ',
                                        style: TextStyle(fontSize: 15),
                                        children: <TextSpan>[
                                          TextSpan(
                                              recognizer:
                                                  new TapGestureRecognizer()
                                                    ..onTap = () {
                                                      Navigator.pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (BuildContext
                                                                      context) =>
                                                                  Login()));
                                                    },
                                              text: 'Login',
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    19, 82, 139, 1),
                                                //decoration: TextDecoration.underline,
                                              )),
                                        ])),
                                  ),
                                ],
                              ),
                            ])),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
