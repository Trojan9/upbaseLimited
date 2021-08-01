import 'dart:io';

import 'package:upbase_limited/providers/ProfileProvider.dart';
import 'package:upbase_limited/ui/forgottenpassword.dart';
import 'package:upbase_limited/ui/login.dart';
import 'package:upbase_limited/ui/otp.dart';
import 'package:upbase_limited/ui/signup.dart';
import 'package:upbase_limited/utils/formutils.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File imgs;
  final formKey = new GlobalKey<FormState>();
  bool _terms = false;
  String _firstName,
      _lastName,
      _email,
      _phoneNumber,
      _password,
      _confirmPassword;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ProfileProvider acct = Provider.of<ProfileProvider>(context, listen: false);
    acct.getprofile(ProfileProvider().patient.phone);
  }

  @override
  Widget build(BuildContext context) {
    final firstNameField = TextFormField(
      autofocus: false,
      onSaved: (value) => _firstName = value,
      initialValue: Provider.of<ProfileProvider>(context, listen: false)
          .patient
          .firstname,
      decoration: buildInputDecoration("First Name", Icons.people_alt),
    );

    final lastNameField = TextFormField(
      autofocus: false,
      onSaved: (value) => _lastName = value,
      initialValue:
          Provider.of<ProfileProvider>(context, listen: false).patient.lastname,
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
      // obscureText: true,
      initialValue:
          Provider.of<ProfileProvider>(context, listen: false).patient.phone,
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
          child: Provider.of<ProfileProvider>(context, listen: true).patient ==
                  null
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: SpinKitCircle(
                      size: 40,
                      color: Colors.lightBlueAccent[600],
                    ),
                  ),
                )
              : Column(
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
                      child: Column(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Profile",
                                        style: TextStyle(
                                          fontSize: 22,
                                        ))),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 35,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    imgs = await ImagePicker.pickImage(
                                      source: ImageSource.gallery,
                                      imageQuality: 80,
                                      maxHeight: 400,
                                      maxWidth: 400,
                                    );
                                    setState(() {});
                                    // FilePickerResult result =
                                    //     await FilePicker.platform.pickFiles(
                                    //         type: FileType.custom,
                                    //         allowedExtensions: [
                                    //       'jpg',
                                    //       'jpeg',
                                    //       'png'
                                    //     ]);
                                    // //getFile();
                                    // if (result != null) {
                                    //   imgs = File(result.files.single.path);
                                    //   setState(() {});
                                    // }
                                  },
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Provider.of<ProfileProvider>(context,
                                                            listen: false)
                                                        .patient
                                                        .dp ==
                                                    'null' ||
                                                Provider.of<ProfileProvider>(
                                                            context,
                                                            listen: false)
                                                        .patient
                                                        .dp ==
                                                    '' ||
                                                Provider.of<ProfileProvider>(
                                                            context,
                                                            listen: false)
                                                        .patient
                                                        .dp ==
                                                    'none'
                                            ? imgs == null
                                                ? ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                    child: Container(
                                                      width: 80,
                                                      decoration:
                                                          new BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors
                                                                .lightBlueAccent,
                                                            width: 2),
                                                        borderRadius:
                                                            new BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    1000.0)),
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 25.0,
                                                                  bottom: 25),
                                                          child: Center(
                                                            child: Text(
                                                              "${Provider.of<ProfileProvider>(context, listen: false).patient.lastname[0].toUpperCase()}",
                                                              style: TextStyle(
                                                                  fontSize: 35),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : Center(
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.0),
                                                      child: Image.file(
                                                        imgs,
                                                        height: 100.0,
                                                        width: 100.0,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  )
                                            : imgs == null
                                                ? Center(
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.0),
                                                      child: Image.file(
                                                        File(Provider.of<
                                                                    ProfileProvider>(
                                                                context,
                                                                listen: false)
                                                            .patient
                                                            .dp),
                                                        height: 100.0,
                                                        width: 100.0,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  )
                                                : Center(
                                                    child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50.0),
                                                        child: Image.file(
                                                          imgs,
                                                          height: 100.0,
                                                          width: 100.0,
                                                          fit: BoxFit.fill,
                                                        )),
                                                  ),
                                        GestureDetector(
                                          onTap: () async {
                                            imgs = await ImagePicker.pickImage(
                                              source: ImageSource.gallery,
                                              imageQuality: 80,
                                              maxHeight: 400,
                                              maxWidth: 400,
                                            );
                                            setState(() {});
                                          },
                                          child: Text(
                                            "Change Photo",
                                            style: TextStyle(
                                                color: Colors.lightBlueAccent),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 35,
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
                                                  color: Color.fromRGBO(
                                                      232, 232, 232, 1),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft: Radius
                                                              .circular(5),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  5),
                                                          topRight:
                                                              Radius.circular(
                                                                  5),
                                                          topLeft:
                                                              Radius.circular(
                                                                  5)),
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
                                                  color: Color.fromRGBO(
                                                      232, 232, 232, 1),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft: Radius
                                                              .circular(5),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  5),
                                                          topRight:
                                                              Radius.circular(
                                                                  5),
                                                          topLeft:
                                                              Radius.circular(
                                                                  5)),
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
                                                  color: Color.fromRGBO(
                                                      232, 232, 232, 1),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft: Radius
                                                              .circular(5),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  5),
                                                          topRight:
                                                              Radius.circular(
                                                                  5),
                                                          topLeft:
                                                              Radius.circular(
                                                                  5)),
                                                ),
                                                padding: EdgeInsets.all(7),
                                                child: phoneNumber),
                                            SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    35),
                                            RaisedButton(
                                              elevation: 0,
                                              onPressed: () async {
                                                final form =
                                                    formKey.currentState;
                                                if (form.validate()) {
                                                  form.save();
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                  ProfileProvider acct =
                                                      Provider.of<
                                                              ProfileProvider>(
                                                          context,
                                                          listen: false);

                                                  var details =
                                                      await acct.profileupdate(
                                                          _firstName,
                                                          _lastName,
                                                          _phoneNumber,
                                                          imgs != null
                                                              ? imgs.path
                                                              : imgs);
                                                  if (details['status'] ==
                                                      "Success") {
                                                    Flushbar(
                                                      title: details['status'],
                                                      message:
                                                          details["message"],
                                                      duration:
                                                          Duration(seconds: 5),
                                                    ).show(context);
                                                  } else {
                                                    Flushbar(
                                                      title: details['status'],
                                                      message:
                                                          details["message"],
                                                      duration:
                                                          Duration(seconds: 5),
                                                    ).show(context);
                                                  }
                                                } else {
                                                  Flushbar(
                                                    title: "Invalid form",
                                                    message:
                                                        "Please Complete the form properly",
                                                    duration:
                                                        Duration(seconds: 5),
                                                  ).show(context);
                                                }
                                              },
                                              textColor: Color.fromRGBO(
                                                  241, 245, 248, 1),
                                              //color: Color.fromRGBO(19, 82, 139, 1),
                                              padding: EdgeInsets.all(0),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        10.0),
                                              ),
                                              child: Container(
                                                height: 50,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color: Color.fromRGBO(
                                                        19, 82, 139, 1),
                                                  ),
                                                  color: Color.fromRGBO(
                                                      19, 82, 139, 1),
                                                ),
                                                padding:
                                                    const EdgeInsets.all(12),
                                                child: Center(
                                                  child: Provider.of<
                                                                  ProfileProvider>(
                                                              context,
                                                              listen: true)
                                                          .isloading
                                                      ? Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                              Text(
                                                                "Please Wait",
                                                                style: TextStyle(
                                                                    // fontFamily:
                                                                    //     'Helvetica',
                                                                    fontSize: 15),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
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
                                                      : Text('Update Profile',
                                                          style: TextStyle(
                                                              fontSize: 15)),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  40,
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
                  ],
                ),
        ),
      ),
    );
  }
}
