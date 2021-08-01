import 'package:upbase_limited/providers/Auth.dart';
import 'package:upbase_limited/ui/newpassword.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class Digitcode extends StatefulWidget {
  @override
  _DigitcodeState createState() => _DigitcodeState();
}

class _DigitcodeState extends State<Digitcode> {
  final formKey = new GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();
  String currentText = "";
  StreamController<ErrorAnimationType> errorController;
  @override
  Widget build(BuildContext context) {
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
                  top: MediaQuery.of(context).size.height / 15,
                  left: 15,
                  right: 15),
              child: Container(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text.rich(
                        TextSpan(
                          text:
                              'Enter 4 digit verification code sent to your mobile phone',
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromRGBO(82, 87, 92, 1),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 15,
                    ),
                    Form(
                      key: formKey,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 12,
                              child: PinCodeTextField(
                                appContext: context,
                                length: 6,
                                obscureText: true,
                                animationType: AnimationType.fade,
                                keyboardType: TextInputType.number,
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  disabledColor: Colors.white,
                                  inactiveFillColor: Colors.white,
                                  //activeColor: Colors.white,

                                  borderRadius: BorderRadius.circular(5),
                                  fieldHeight: 50,
                                  fieldWidth: 40,
                                  borderWidth: 1,
                                  activeFillColor: Colors.white,
                                ),
                                animationDuration: Duration(milliseconds: 300),
                                backgroundColor: Colors.white,

                                enableActiveFill: true,
                                errorAnimationController: errorController,
                                controller: textEditingController,
                                onCompleted: (v) {
                                  print("Completed");
                                },
                                onChanged: (value) {
                                  print(value);
                                  setState(() {
                                    currentText = value;
                                  });
                                },
                                beforeTextPaste: (text) {
                                  print("Allowing to paste $text");
                                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                  return true;
                                },
                              ))),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 35,
                    ),
                    RaisedButton(
                      elevation: 0,
                      onPressed: () async {
                        final form = formKey.currentState;
                        if (currentText != "") {
                          FocusScope.of(context).unfocus();
                          AuthProvider auth =
                              Provider.of<AuthProvider>(context, listen: false);

                          var details = await auth.verifyotp(currentText);
                          if (details['status'] == "Success") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Newpassword()));
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
                            message: "Please Complete the form properly",
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
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                        child: CircularProgressIndicator(),
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
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
