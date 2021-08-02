import 'package:upbase_limited/providers/Auth.dart';
import 'package:upbase_limited/ui/Account.dart';
import 'package:upbase_limited/ui/Profile.dart';
import 'package:upbase_limited/ui/dashboard.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:upbase_limited/utils/formutils.dart';
import 'package:provider/provider.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  final formKey = new GlobalKey<FormState>();
  bool _terms = false;
  TextEditingController _address = TextEditingController();
  TextEditingController _country = TextEditingController();
  TextEditingController _state = TextEditingController();
  TextEditingController _lga = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final address = TextFormField(
      autofocus: false,
      controller: _address,
      decoration: buildInputDecoration("Home Address", Icons.phone_android),
    );

    final country = TextFormField(
      autofocus: false,
      showCursor: true,
      readOnly: true,
      onTap: () {
        showCountryPicker(
          context: context,
          //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
          exclude: <String>['KN', 'MF'],
          //Optional. Shows phone code before the country name.
          showPhoneCode: true,
          onSelect: (Country country) {
            setState(() {
              _country.text = country.displayName;
            });
          },
        );
      },
      controller: _country,
      decoration: InputDecoration(
          suffixIcon: IconButton(
              icon: Icon(Icons.arrow_drop_down),
              onPressed: () {
                showCountryPicker(
                  context: context,
                  //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                  exclude: <String>['KN', 'MF'],
                  //Optional. Shows phone code before the country name.
                  showPhoneCode: true,
                  onSelect: (Country country) {
                    setState(() {
                      _country.text = country.displayName;
                    });
                  },
                );
              })),
    );

    final state = TextFormField(
      autofocus: false,
      controller: _state,
      decoration: _country.text.contains("Nigeria")
          ? InputDecoration(
              suffixIcon: PopupMenuButton<String>(
                icon: const Icon(Icons.arrow_drop_down),
                onSelected: (String value) {
                  setState(() {
                    _state.text = value;
                  });
                },
                itemBuilder: (BuildContext context) {
                  return <String>[
                    'Abia',
                    'Adamawa',
                    'Akwa Ibom',
                    'Anambra',
                    'Bauchi',
                    'Bayelsa',
                    'Benue',
                    'Borno',
                    'Cross River',
                    'Delta',
                    'Ebonyi',
                    'Edo',
                    'Ekiti',
                    'Enugu',
                    'Gombe',
                    'Imo',
                    'Jigawa',
                    'Kaduna' 'Kano',
                    'Katsina',
                    'Kebbi',
                    'Kogi',
                    'Kwara',
                    'Lagos',
                    'Nasarawa',
                    'Niger',
                    'Ogun',
                    'Ondo',
                    'Osun',
                    'Oyo' 'Plateau',
                    'Rivers',
                    'Sokoto',
                    'Taraba',
                    'Yobe',
                    'Zamfara',
                    'Federal Capital Territory (FCT)'
                  ].map<PopupMenuItem<String>>((String value) {
                    return new PopupMenuItem(
                        child: new Text(value), value: value);
                  }).toList();
                },
              ),
            )
          : buildInputDecoration("Email", Icons.email),
    );
    final lga = TextFormField(
      autofocus: false,
      // obscureText: true,

      controller: _lga,
      decoration: buildInputDecoration("Email", Icons.email),
    );

    // final pregnancymonth = TextFormField(
    //   autofocus: false,
    //   // obscureText: true,
    //   // validator: (value) =>
    //   //     value.isEmpty ? "Please enter a Valid Phone Number" : null,
    //   onSaved: (value) => _pregnancymonths = value,
    //   decoration: InputDecoration(
    //       suffixIcon:
    //           IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: () {})),
    // );

    // final passwordField = TextFormField(
    //   autofocus: false,
    //   obscureText: true,
    //   validator: (value) => value.isEmpty ? "Please enter password" : null,
    //   onSaved: (value) => _password = value,
    //   decoration: buildInputDecoration("Password", Icons.lock),
    // );

    // var loading = Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: <Widget>[
    //     CircularProgressIndicator(),
    //     Text(" Registering ... Please wait")
    //   ],
    // );
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
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Location",
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
                                          child: Text("Home Address:",
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
                                          child: address),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("Country:",
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
                                          child: country),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("State:",
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
                                          child: state),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("LGA",
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
                                          child: lga),
                                      // SizedBox(
                                      //     height:
                                      //         MediaQuery.of(context).size.height /
                                      //             35),

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

                                            var details = await auth.location(
                                                _address.text,
                                                _country.text,
                                                _state.text,
                                                _lga.text);
                                            if (details['status'] ==
                                                "Success") {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          Account()));
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
                                                    "Get Started",
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
