import 'package:upbase_limited/providers/Auth.dart';
import 'package:upbase_limited/ui/forgotpasspincode.dart';
import 'package:upbase_limited/utils/formutils.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:provider/provider.dart';

class Forgottenpass extends StatefulWidget {
  @override
  _ForgottenpassState createState() => _ForgottenpassState();
}

class _ForgottenpassState extends State<Forgottenpass> {
  final formKey = new GlobalKey<FormState>();

  String _phoneNumber, _password, _confirmPassword;

  @override
  Widget build(BuildContext context) {
    final phoneNumber = TextFormField(
      autofocus: false,
      // obscureText: true,
      validator: (value) =>
          value.isEmpty ? "Please enter a Valid Phone Number" : null,
      onSaved: (value) => _phoneNumber = value,
      decoration: buildInputDecoration("Phone Number", Icons.phone_android),
    );

    final passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
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
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_sharp,
                        size: 30,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      }),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 20,
                    left: 15,
                    right: 15),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Forgot Password?",
                            style: TextStyle(
                              fontSize: 22,
                            ))),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text.rich(
                        TextSpan(
                          text:
                              'Enter the phone number associated with this account',
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromRGBO(82, 87, 92, 1),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
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
                                  height: 10,
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        25),
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

                                      var details =
                                          await auth.forgotpass(_phoneNumber);
                                      if (details['status'] == "Success") {
                                        await Flushbar(
                                          title: details['status'],
                                          message: details["message"],
                                          duration: Duration(seconds: 5),
                                        ).show(context);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        Digitcode()));
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
                                              "Next",
                                              style: TextStyle(fontSize: 15),
                                              textAlign: TextAlign.center,
                                            ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ])),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
