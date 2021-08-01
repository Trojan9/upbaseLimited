import 'package:upbase_limited/providers/Auth.dart';
import 'package:upbase_limited/ui/login.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:upbase_limited/utils/formutils.dart';
import 'package:provider/provider.dart';

class Newpassword extends StatefulWidget {
  @override
  _NewpasswordState createState() => _NewpasswordState();
}

class _NewpasswordState extends State<Newpassword> {
  final formKey = new GlobalKey<FormState>();

  String _phoneNumber, _password, _confirmPassword;
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final passwordField = TextFormField(
        autofocus: false,
        obscureText: _obscureText,
        validator: (value) => value.isEmpty ? "Please enter password" : null,
        onSaved: (value) => _password = value,
        decoration: buildInputDecorationnewpass(
          "Password",
          IconButton(
              icon:
                  Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
              onPressed: _toggle),
        ));

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
                        child: Text("Create New Password",
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
                              'Your new password should be different from the previous ones.',
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
                                    child: Text("New Password:",
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
                                    child: passwordField),
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
                                              listen: true);

                                      var details =
                                          await auth.resetpassword(_password);
                                      if (details['status'] == "Success") {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        Login()));
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
                                                  listen: false)
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
                                              "Reset Password",
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
