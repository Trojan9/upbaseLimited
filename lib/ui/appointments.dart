import 'package:upbase_limited/ui/Profile.dart';
import 'package:upbase_limited/ui/aboutyou.dart';
import 'package:upbase_limited/ui/aboutyouUpdate.dart';
import 'package:upbase_limited/ui/bookappointment.dart';
import 'package:upbase_limited/ui/drawer.dart';
import 'package:upbase_limited/ui/locatioUpdate.dart';
import 'package:upbase_limited/ui/myappointments.dart';
import 'package:upbase_limited/ui/passwordchange.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Appointments extends StatefulWidget {
  @override
  _AppointmentsState createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Future<void> _launched;
  String toLaunch = "";
  // Future<void> _launchInBrowser(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(
  //       url,
  //       forceSafariVC: false,
  //       forceWebView: false,
  //       // headers: <String, String>{'my_header_key': 'my_header_value'},
  //     );
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        key: scaffoldKey,
        drawer: SideDrawer(),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              //height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: IconButton(
                          icon: Icon(
                            Icons.menu,
                            size: 30,
                          ),
                          onPressed: () async {
                            scaffoldKey.currentState.openDrawer();
                          }),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20, top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Appointments",
                                style: TextStyle(
                                  fontSize: 22,
                                ))),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 25,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyAppointments()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(248, 248, 248, 1),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            height: MediaQuery.of(context).size.height / 10,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      // Icon(
                                      //   Icons.person,
                                      //   color: Colors.black,
                                      //   size: 25,
                                      // ),
                                      Text("My Appointments"),
                                    ],
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.black,
                                    size: 15,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BookAppointments()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(248, 248, 248, 1),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            height: MediaQuery.of(context).size.height / 10,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      // Icon(
                                      //   Icons.info_rounded,
                                      //   color: Colors.black,
                                      //   size: 25,
                                      // ),
                                      Text("Book Appointment"),
                                    ],
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.black,
                                    size: 15,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
