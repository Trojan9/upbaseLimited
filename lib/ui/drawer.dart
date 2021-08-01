import 'package:upbase_limited/providers/ProfileProvider.dart';
import 'package:upbase_limited/providers/setpagedrawer.dart';
import 'package:upbase_limited/ui/Account.dart';
import 'package:upbase_limited/ui/Profile.dart';
import 'package:upbase_limited/ui/appointments.dart';
import 'package:upbase_limited/ui/dashboard.dart';
import 'package:upbase_limited/ui/login.dart';
import 'package:upbase_limited/ui/notification.dart';
import 'package:upbase_limited/ui/redAlert.dart';
import 'package:upbase_limited/ui/reports.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

import 'package:provider/provider.dart';

class SideDrawer extends StatelessWidget {
  RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  Function mathFunc = (Match match) => '${match[1]},';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7, //20.0,
      child: Drawer(
        child: Container(
          //color: Colors.blue,
          decoration: BoxDecoration(
            // shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: new Column(children: <Widget>[
              SizedBox(
                height: 30,
              ),
              DrawerHeader(
                  child: Container(
                height: MediaQuery.of(context).size.height / 9,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          // height: 62,
                          // width: 62,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white)
                              // image: DecorationImage(
                              //     image: NetworkImage(patientdatas.dp),
                              //     fit: BoxFit.fill)
                              ),
                          // child: patientdatas.dp != null &&
                          //         patientdatas.dp != "" &&
                          //         patientdatas.dp != "null"
                          //     ? ClipRRect(
                          //         borderRadius: BorderRadius.circular(80.0),
                          //         child: Image.network(patientdatas.dp,
                          //             fit: BoxFit.fill))
                          //     : Center(
                          //         child: Text(
                          //             "${patientdatas.lastname[0].toUpperCase()}",
                          //             style: TextStyle(
                          //               color: Colors.black,
                          //               fontWeight: FontWeight.w600,
                          //               fontSize: 17,
                          //             )),
                          //       ),
                          child: Row(
                            children: [
                              Provider.of<ProfileProvider>(context,
                                                  listen: false)
                                              .patient
                                              .dp ==
                                          'null' ||
                                      Provider.of<ProfileProvider>(context,
                                                  listen: false)
                                              .patient
                                              .dp ==
                                          '' ||
                                      Provider.of<ProfileProvider>(context,
                                                  listen: false)
                                              .patient
                                              .dp ==
                                          'none'
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(50.0),
                                      child: Container(
                                        width: 80,
                                        decoration: new BoxDecoration(
                                          border: Border.all(
                                              color: Colors.lightBlueAccent,
                                              width: 2),
                                          borderRadius: new BorderRadius.all(
                                              Radius.circular(1000.0)),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25.0, bottom: 25),
                                            child: Center(
                                              child: Text(
                                                "${Provider.of<ProfileProvider>(context, listen: false).patient.lastname[0].toUpperCase()}",
                                                style: TextStyle(fontSize: 35),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Center(
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        child: Image.network(
                                          Provider.of<ProfileProvider>(context,
                                                  listen: false)
                                              .patient
                                              .dp,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              10,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              7,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                              // ClipRRect(
                              //   borderRadius: BorderRadius.circular(50.0),
                              //   child: Image.asset(
                              //     "assets/images/Ellipse 6.png",
                              //     height:
                              //         MediaQuery.of(context).size.height / 10,
                              //     width: MediaQuery.of(context).size.width / 7,
                              //     fit: BoxFit.fill,
                              //   ),
                              // ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Profile()));
                                },
                                child: Text(
                                  "Change Photo",
                                  style: TextStyle(
                                      color: Colors.lightBlueAccent,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          "Banjo",
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          height: 5,
                          color: Color.fromRGBO(196, 196, 196, 1),
                        )
                      ],
                    ),
                  ],
                ),
              )),
              // SizedBox(
              //   height: 10,
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.pushReplacementNamed(
                    //   context,
                    //   '/editprofile',
                    // );
                    Provider.of<Setpageprovider>(context, listen: false)
                        .setpage(0);
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DashBoard()));
                  },
                  child: Container(
                    color: Provider.of<Setpageprovider>(context, listen: true)
                                .page ==
                            0
                        ? Color.fromRGBO(241, 245, 248, 1)
                        : Colors.white,
                    child: Row(
                      children: [
                        Icon(
                          Icons.dashboard,
                          size: 27,
                          color: Provider.of<Setpageprovider>(context,
                                          listen: true)
                                      .page ==
                                  0
                              ? Colors.blueAccent
                              : Color.fromRGBO(160, 164, 168, 1),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Dashboard',
                          style: TextStyle(
                              color: Provider.of<Setpageprovider>(context,
                                              listen: true)
                                          .page ==
                                      0
                                  ? Colors.blueAccent
                                  : Color.fromRGBO(160, 164, 168, 1),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              letterSpacing: 1.2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Provider.of<Setpageprovider>(context, listen: false)
                        .setpage(1);
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RedAlert()));
                    //
                    // pagecontrol.jumpToPage(3);
                  },
                  child: Container(
                    color: Provider.of<Setpageprovider>(context, listen: true)
                                .page ==
                            1
                        ? Color.fromRGBO(241, 245, 248, 1)
                        : Colors.white,
                    child: Row(
                      children: [
                        Icon(
                          Icons.report_problem_sharp,
                          size: 27,
                          color: Provider.of<Setpageprovider>(context,
                                          listen: true)
                                      .page ==
                                  1
                              ? Colors.redAccent
                              : Color.fromRGBO(160, 164, 168, 1),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Send a Red Alert!!',
                          style: TextStyle(
                              color: Provider.of<Setpageprovider>(context,
                                              listen: true)
                                          .page ==
                                      1
                                  ? Colors.redAccent
                                  : Color.fromRGBO(160, 164, 168, 1),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              letterSpacing: 1.2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Provider.of<Setpageprovider>(context, listen: false)
                        .setpage(2);
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Appointments()));

                    // pagecontrol.jumpToPage(3);

                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Subcscription()));
                  },
                  child: Container(
                    color: Provider.of<Setpageprovider>(context, listen: true)
                                .page ==
                            2
                        ? Color.fromRGBO(241, 245, 248, 1)
                        : Colors.white,
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          size: 27,
                          color: Provider.of<Setpageprovider>(context,
                                          listen: true)
                                      .page ==
                                  2
                              ? Colors.blueAccent
                              : Color.fromRGBO(160, 164, 168, 1),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Appointments',
                          style: TextStyle(
                              color: Provider.of<Setpageprovider>(context,
                                              listen: true)
                                          .page ==
                                      2
                                  ? Colors.blueAccent
                                  : Color.fromRGBO(160, 164, 168, 1),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              letterSpacing: 1.2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Provider.of<Setpageprovider>(context, listen: false)
                        .setpage(3);
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Reports()));

                    // pagecontrol.jumpToPage(3);
                  },
                  child: Container(
                    color: Provider.of<Setpageprovider>(context, listen: true)
                                .page ==
                            3
                        ? Color.fromRGBO(241, 245, 248, 1)
                        : Colors.white,
                    child: Row(
                      children: [
                        Icon(
                          Icons.assignment_sharp,
                          size: 27,
                          color: Provider.of<Setpageprovider>(context,
                                          listen: true)
                                      .page ==
                                  3
                              ? Colors.blueAccent
                              : Color.fromRGBO(160, 164, 168, 1),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Reports',
                          style: TextStyle(
                              color: Provider.of<Setpageprovider>(context,
                                              listen: true)
                                          .page ==
                                      3
                                  ? Colors.blueAccent
                                  : Color.fromRGBO(160, 164, 168, 1),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              letterSpacing: 1.2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Provider.of<Setpageprovider>(context, listen: false)
                        .setpage(4);
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Notificationss()));
                  },
                  child: Container(
                    color: Provider.of<Setpageprovider>(context, listen: true)
                                .page ==
                            4
                        ? Color.fromRGBO(241, 245, 248, 1)
                        : Colors.white,
                    child: Row(
                      children: [
                        Icon(
                          Icons.notifications,
                          size: 27,
                          color: Provider.of<Setpageprovider>(context,
                                          listen: true)
                                      .page ==
                                  4
                              ? Colors.blueAccent
                              : Color.fromRGBO(160, 164, 168, 1),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Notifications',
                          style: TextStyle(
                              color: Provider.of<Setpageprovider>(context,
                                              listen: true)
                                          .page ==
                                      4
                                  ? Colors.blueAccent
                                  : Color.fromRGBO(160, 164, 168, 1),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              letterSpacing: 1.2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Provider.of<Setpageprovider>(context, listen: false)
                        .setpage(5);
                    Navigator.pop(context);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Account()));
                  },
                  child: Container(
                    color: Provider.of<Setpageprovider>(context, listen: true)
                                .page ==
                            5
                        ? Color.fromRGBO(241, 245, 248, 1)
                        : Colors.white,
                    child: Row(
                      children: [
                        Icon(
                          Icons.person,
                          size: 27,
                          color: Provider.of<Setpageprovider>(context,
                                          listen: true)
                                      .page ==
                                  5
                              ? Colors.blueAccent
                              : Color.fromRGBO(160, 164, 168, 1),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Account',
                          style: TextStyle(
                              color: Provider.of<Setpageprovider>(context,
                                              listen: true)
                                          .page ==
                                      5
                                  ? Colors.blueAccent
                                  : Color.fromRGBO(160, 164, 168, 1),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              letterSpacing: 1.2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Provider.of<Setpageprovider>(context, listen: false)
                        .setpage(6);
                    Navigator.pop(context);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Container(
                    color: Provider.of<Setpageprovider>(context, listen: true)
                                .page ==
                            6
                        ? Color.fromRGBO(241, 245, 248, 1)
                        : Colors.white,
                    child: Row(
                      children: [
                        Icon(
                          Icons.power_settings_new_rounded,
                          size: 27,
                          color: Provider.of<Setpageprovider>(context,
                                          listen: true)
                                      .page ==
                                  6
                              ? Colors.blueAccent
                              : Color.fromRGBO(160, 164, 168, 1),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Logout',
                          style: TextStyle(
                              color: Provider.of<Setpageprovider>(context,
                                              listen: true)
                                          .page ==
                                      6
                                  ? Colors.blueAccent
                                  : Color.fromRGBO(160, 164, 168, 1),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              letterSpacing: 1.2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),

              //SizedBox(height: 40),

              //            Container(
              //       child: Align(
              //           alignment: FractionalOffset.bottomCenter,
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.end,
              //             children: <Widget>[

              //               Divider(
              //                // height: MediaQuery.of(context).size.height/1.2,
              //               ),
              //                     Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: GestureDetector(
              //     onTap: () async {
              //       SharedPreferences prefs =
              //           await SharedPreferences.getInstance();
              //       prefs.remove('email');
              //       prefs.remove('loggedin');
              //       prefs.remove('token');
              //       PatientAuth auth =
              //           Provider.of<PatientAuth>(context, listen: false);
              //       auth.setLoggedIn(false);
              //       Navigator.pushReplacement(context,
              //           MaterialPageRoute(builder: (context) => LogIn()));
              //     },
              //     child: Row(
              //       children: [
              //         Icon(
              //           Icons.logout,
              //           size: 27,
              //           color: Colors.white,
              //         ),
              //         SizedBox(
              //           width: 10.0,
              //         ),
              //         Text(
              //           'Log Out ',
              //           style: TextStyle(
              //               color: Colors.white,
              //               fontWeight: FontWeight.w400,
              //               fontSize: 16,
              //               letterSpacing: 1.2),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              //             ],
              //           ))),
            ]),
          ),
        ),
      ),
    );
  }
}
