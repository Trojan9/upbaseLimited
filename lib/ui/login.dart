import 'package:upbase_limited/providers/Auth.dart';
import 'package:upbase_limited/ui/dashboard.dart';
import 'package:upbase_limited/ui/forgottenpassword.dart';
import 'package:upbase_limited/ui/otp.dart';
import 'package:upbase_limited/ui/signup.dart';
import 'package:upbase_limited/utils/formutils.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = new GlobalKey<FormState>();
  bool _obscure = true;
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
      validator: validateEmail,
      onSaved: (value) => _email = value,
      decoration: buildInputDecoration("Email", Icons.email),
    );

    final phoneNumber = TextFormField(
      autofocus: false,
      keyboardType: TextInputType.number,
      // obscureText: true,
      validator: (value) =>
          value.isEmpty ? "Please enter a Valid Phone Number" : null,
      onSaved: (value) => _phoneNumber = value,
      decoration: buildInputDecoration("Phone Number", Icons.phone_android),
    );

    final passwordField = TextFormField(
      autofocus: false,
      obscureText: _obscure,
      validator: (value) => value.isEmpty ? "Please enter password" : null,
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
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 15,
                  left: 15,
                  right: 15),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Sign In",
                          style: TextStyle(
                            fontSize: 22,
                          ))),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 15,
                  ),
                  Container(
                    child: Form(
                        key: formKey,
                        child: Column(children: [
                          Column(
                            children: [
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
                                height: MediaQuery.of(context).size.height / 20,
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
                                    onTap: () {
                                      setState(() {
                                        _obscure = !_obscure;
                                      });
                                    },
                                    child: Text(_obscure ? "Show" : "Hide",
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
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 30),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              Forgottenpass()));
                                },
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text.rich(
                                    TextSpan(
                                      text: 'Forgot Password? ',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          Forgottenpass()));
                                        },
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Color.fromRGBO(19, 82, 139, 1),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 35,
                              ),
                              RaisedButton(
                                elevation: 0,
                                onPressed: () async {
                                  final form = formKey.currentState;
                                  if (form.validate()) {
                                    form.save();
                                    FocusScope.of(context).unfocus();
                                    AuthProvider auth =
                                        Provider.of<AuthProvider>(context,
                                            listen: false);

                                    var details = await auth.login(
                                      _phoneNumber,
                                      _password,
                                    );
                                    if (details['status'] == "Success") {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  DashBoard()));
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
                                },
                                textColor: Color.fromRGBO(241, 245, 248, 1),
                                //color: Color.fromRGBO(19, 82, 139, 1),
                                padding: EdgeInsets.all(0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
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
                                    child: Provider.of<AuthProvider>(context,
                                                listen: true)
                                            .isloginLoading
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
                                                  textAlign: TextAlign.center,
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
                                            "Sign In",
                                            style: TextStyle(fontSize: 15),
                                            textAlign: TextAlign.center,
                                          ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 10,
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
                                    text: 'Don’t have an account? ',
                                    style: TextStyle(fontSize: 15),
                                    children: <TextSpan>[
                                      TextSpan(
                                          recognizer: new TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          SignUp()));
                                            },
                                          text: 'Register',
                                          style: TextStyle(
                                            color:
                                                Color.fromRGBO(19, 82, 139, 1),
                                            //decoration: TextDecoration.underline,
                                          )),
                                    ])),
                              ),
                            ],
                          ),
                        ])),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
