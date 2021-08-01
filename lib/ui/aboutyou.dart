import 'package:another_flushbar/flushbar.dart';
import 'package:upbase_limited/providers/Auth.dart';
import 'package:upbase_limited/ui/location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upbase_limited/utils/formutils.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:provider/provider.dart';

class Aboutyou extends StatefulWidget {
  @override
  _AboutyouState createState() => _AboutyouState();
}

class _AboutyouState extends State<Aboutyou> {
  final formKey = new GlobalKey<FormState>();
  bool _terms = false;
  TextEditingController _dob = TextEditingController();
  TextEditingController _languagepref = TextEditingController();
  TextEditingController _pregnancymonths = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _email = TextEditingController();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  VoidCallback _showPersBottomSheetCallBack;
  VoidCallback _showPersBottomSheetCallBack2;

  @override
  void initState() {
    super.initState();
    _showPersBottomSheetCallBack = _showBottomSheet;
    _showPersBottomSheetCallBack2 = _showBottomSheet2;
  }

  List months = [
    "1-3 Months (1-13 Weeks)",
    "4-6 Months (14-26 Weeks)",
    "7-9 Months (27-39+ Weeks)"
  ];
  List languages = ["English (default)", "Igbo", "Yoruba", "Hausa"];
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  String address = "";
  void _showBottomSheet() {
    setState(() {
      _showPersBottomSheetCallBack = null;
    });

    _scaffoldKey.currentState
        .showBottomSheet((context) {
          return new Container(
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15)),
            ),
            child: ListView.builder(
                itemCount: months.length,
                itemBuilder: (BuildContext context, index) {
                  return Column(
                    children: [
                      index == 0
                          ? Container(
                              width: MediaQuery.of(context).size.width / 5,
                              height: 1,
                              color: Colors.black,
                            )
                          : Container(),
                      ListTile(
                        // dense: true,
                        minVerticalPadding: 5,
                        contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                        title: GestureDetector(
                            onTap: () {
                              setState(() {
                                _pregnancymonths.text = months[index];
                              });
                              Navigator.pop(context);
                            },
                            child: Center(child: Text('${months[index]}'))),
                      ),
                    ],
                  );
                }),
          );
        })
        .closed
        .whenComplete(() {
          if (mounted) {
            setState(() {
              _showPersBottomSheetCallBack = _showBottomSheet;
            });
          }
        });
  }

  void _showBottomSheet2() {
    setState(() {
      _showPersBottomSheetCallBack2 = null;
    });

    _scaffoldKey.currentState
        .showBottomSheet((context) {
          return new Container(
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15)),
            ),
            child: ListView.builder(
                itemCount: languages.length,
                itemBuilder: (BuildContext context, index) {
                  return Column(
                    children: [
                      index == 0
                          ? Container(
                              width: MediaQuery.of(context).size.width / 5,
                              height: 1,
                              color: Colors.black,
                            )
                          : Text(""),
                      ListTile(
                        dense: true,
                        minVerticalPadding: 5,
                        contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                        title: GestureDetector(
                            onTap: () {
                              setState(() {
                                _languagepref.text = languages[index];
                              });
                              Navigator.pop(context);
                            },
                            child: Center(child: Text('${languages[index]}'))),
                      ),
                    ],
                  );
                }),
          );
        })
        .closed
        .whenComplete(() {
          if (mounted) {
            setState(() {
              _showPersBottomSheetCallBack2 = _showBottomSheet2;
            });
          }
        });
  }

  void _pickdate() async {
    await _selectDate(context);
    setState(() {
      _dob.text = formatdate(selectedDate).toString();
    });
    setState(() {});
  }

  DateTime selectedDate = DateTime.now();
  String formatdate(DateTime date) {
    return "${date.year}-${date.month}-${date.day}";
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(1920),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    final dob = TextFormField(
      autofocus: false,
      showCursor: true,
      readOnly: true,
      onTap: _pickdate,
      controller: _dob,
      decoration: InputDecoration(
          suffixIcon: IconButton(
              icon: Icon(Icons.arrow_drop_down), onPressed: _pickdate)),
    );

    final language = TextFormField(
      showCursor: true,
      readOnly: true,
      autofocus: false,
      onTap: _showPersBottomSheetCallBack2,
      controller: _languagepref,
      decoration: InputDecoration(
          suffixIcon: IconButton(
        icon: Icon(Icons.arrow_drop_down),
        onPressed: _showPersBottomSheetCallBack2,
      )),
    );

    final phoneNumber = TextFormField(
      autofocus: false,
      // obscureText: true,
      controller: _phoneNumber,
      decoration: buildInputDecoration("Phone Number", Icons.phone_android),
    );

    final pregnancymonth = TextFormField(
      autofocus: false,
      showCursor: true,
      readOnly: true,
      // obscureText: true,
      // validator: (value) =>
      //     value.isEmpty ? "Please enter a Valid Phone Number" : null,
      controller: _pregnancymonths,
      decoration: InputDecoration(
          suffixIcon: IconButton(
        icon: Icon(Icons.arrow_drop_down),
        onPressed: _showPersBottomSheetCallBack,
      )),
    );

    // final passwordField = TextFormField(
    //   autofocus: false,
    //   obscureText: true,
    //   validator: (value) => value.isEmpty ? "Please enter password" : null,
    //   onSaved: (value) => _password = value,
    //   decoration: buildInputDecoration("Password", Icons.lock),
    // );

    var loading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Text(" Registering ... Please wait")
      ],
    );
    return Scaffold(
      key: _scaffoldKey,
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
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text("About You",
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
                                          child: Text("Date Of Birth:",
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
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(5),
                                                bottomRight: Radius.circular(5),
                                                topRight: Radius.circular(5),
                                                topLeft: Radius.circular(5)),
                                          ),
                                          padding: EdgeInsets.all(7),
                                          child: dob),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("Preferred Language:",
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
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(5),
                                                bottomRight: Radius.circular(5),
                                                topRight: Radius.circular(5),
                                                topLeft: Radius.circular(5)),
                                          ),
                                          padding: EdgeInsets.all(7),
                                          child: language),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child:
                                              Text("Pregnancy months (weeks):",
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
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(5),
                                                bottomRight: Radius.circular(5),
                                                topRight: Radius.circular(5),
                                                topLeft: Radius.circular(5)),
                                          ),
                                          padding: EdgeInsets.all(7),
                                          child: pregnancymonth),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                              "Husband/Guardian’s Phone Number",
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
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(5),
                                                bottomRight: Radius.circular(5),
                                                topRight: Radius.circular(5),
                                                topLeft: Radius.circular(5)),
                                          ),
                                          padding: EdgeInsets.all(7),
                                          child: phoneNumber),
                                      // SizedBox(
                                      //     height:
                                      // //         MediaQuery.of(context).size.height /
                                      // //             35),

                                      // // SizedBox(
                                      // //   height:
                                      // //       MediaQuery.of(context).size.height / 40,
                                      // // ),
                                      // Center(
                                      //   child: Container(
                                      //       padding: EdgeInsets.symmetric(
                                      //           horizontal: 20),
                                      //       height: 600,
                                      //       child: Column(
                                      //         children: [
                                      //           ///Adding CSC Picker Widget in app
                                      //           CSCPicker(
                                      //             ///Enable disable state dropdown [OPTIONAL PARAMETER]
                                      //             showStates: false,

                                      //             /// Enable disable city drop down [OPTIONAL PARAMETER]
                                      //             showCities: false,

                                      //             ///Enable (get flag with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only) [OPTIONAL PARAMETER]
                                      //             flagState: CountryFlag.DISABLE,

                                      //             ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
                                      //             dropdownDecoration: BoxDecoration(
                                      //                 borderRadius:
                                      //                     BorderRadius.all(
                                      //                         Radius.circular(10)),
                                      //                 color: Colors.white,
                                      //                 border: Border.all(
                                      //                     color:
                                      //                         Colors.grey.shade300,
                                      //                     width: 1)),

                                      //             ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
                                      //             disabledDropdownDecoration:
                                      //                 BoxDecoration(
                                      //                     borderRadius:
                                      //                         BorderRadius.all(
                                      //                             Radius.circular(
                                      //                                 10)),
                                      //                     color:
                                      //                         Colors.grey.shade300,
                                      //                     border: Border.all(
                                      //                         color: Colors
                                      //                             .grey.shade300,
                                      //                         width: 1)),

                                      //             ///Default Country
                                      //             defaultCountry:
                                      //                 DefaultCountry.India,

                                      //             ///selected item style [OPTIONAL PARAMETER]
                                      //             selectedItemStyle: TextStyle(
                                      //               color: Colors.black,
                                      //               fontSize: 14,
                                      //             ),

                                      //             ///DropdownDialog Heading style [OPTIONAL PARAMETER]
                                      //             dropdownHeadingStyle: TextStyle(
                                      //                 color: Colors.black,
                                      //                 fontSize: 17,
                                      //                 fontWeight: FontWeight.bold),

                                      //             ///DropdownDialog Item style [OPTIONAL PARAMETER]
                                      //             dropdownItemStyle: TextStyle(
                                      //               color: Colors.black,
                                      //               fontSize: 14,
                                      //             ),

                                      //             ///Dialog box radius [OPTIONAL PARAMETER]
                                      //             dropdownDialogRadius: 10.0,

                                      //             ///Search bar radius [OPTIONAL PARAMETER]
                                      //             searchBarRadius: 10.0,

                                      //             ///triggers once country selected in dropdown
                                      //             onCountryChanged: (value) {
                                      //               setState(() {
                                      //                 ///store value in country variable
                                      //                 countryValue = value;
                                      //               });
                                      //             },

                                      //             ///triggers once state selected in dropdown
                                      //             onStateChanged: (value) {
                                      //               setState(() {
                                      //                 ///store value in state variable
                                      //                 stateValue = value;
                                      //               });
                                      //             },

                                      //             ///triggers once city selected in dropdown
                                      //             onCityChanged: (value) {
                                      //               setState(() {
                                      //                 ///store value in city variable
                                      //                 cityValue = value;
                                      //               });
                                      //             },
                                      //           ),

                                      //           ///print newly selected country state and city in Text Widget
                                      //           TextButton(
                                      //               onPressed: () {
                                      //                 setState(() {
                                      //                   address =
                                      //                       "$cityValue, $stateValue, $countryValue";
                                      //                 });
                                      //               },
                                      //               child: Text("Print Data")),
                                      //           Text(address)
                                      //         ],
                                      //       )),
                                      // ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                20,
                                      ),

                                      RaisedButton(
                                        elevation: 0,
                                        onPressed: () async {
                                          final form = formKey.currentState;
                                          if (form.validate()) {
                                            form.save();
                                            FocusScope.of(context).unfocus();
                                            AuthProvider auth =
                                                Provider.of<AuthProvider>(
                                                    context,
                                                    listen: false);

                                            var details = await auth.aboutyou(
                                                _dob.text,
                                                _languagepref.text,
                                                _pregnancymonths.text,
                                                _phoneNumber.text);
                                            if (details['status'] ==
                                                "Success") {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          Location()));
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
                                        textColor:
                                            Color.fromRGBO(241, 245, 248, 1),
                                        //color: Color.fromRGBO(19, 82, 139, 1),
                                        padding: EdgeInsets.all(0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(10.0),
                                        ),
                                        child: Container(
                                          height: 50,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: Color.fromRGBO(
                                                  19, 82, 139, 1),
                                            ),
                                            color:
                                                Color.fromRGBO(19, 82, 139, 1),
                                          ),
                                          padding: const EdgeInsets.all(12),
                                          child: Center(
                                            child: Provider.of<AuthProvider>(
                                                        context,
                                                        listen: true)
                                                    .isloginLoading
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
                                                    "Next",
                                                    style:
                                                        TextStyle(fontSize: 15),
                                                    textAlign: TextAlign.center,
                                                  ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
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
