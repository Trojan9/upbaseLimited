import 'package:upbase_limited/ui/Profile.dart';
import 'package:upbase_limited/ui/aboutyou.dart';
import 'package:upbase_limited/ui/aboutyouUpdate.dart';
import 'package:upbase_limited/ui/drawer.dart';
import 'package:upbase_limited/ui/editappointment.dart';
import 'package:upbase_limited/ui/locatioUpdate.dart';
import 'package:upbase_limited/ui/passwordchange.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppointmentsDetails extends StatefulWidget {
  @override
  _AppointmentsDetailsState createState() => _AppointmentsDetailsState();
}

class _AppointmentsDetailsState extends State<AppointmentsDetails> {
  bool docs = false;
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
                            Icons.arrow_back_sharp,
                            size: 30,
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
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
                            child: Text("Appointment Details",
                                style: TextStyle(
                                  fontSize: 22,
                                ))),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 25,
                        ),
                        Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 9,
                              width: MediaQuery.of(context).size.width,
                              color: Color.fromRGBO(248, 248, 248, 1),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 8.0, bottom: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          20,
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(50.0),
                                      child: Image.asset(
                                        "assets/images/Ellipse 6.png",
                                        height: 40.0,
                                        width: 30.0,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          16,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text("Dr Alieu Donald"),
                                        Text(
                                          "Saturay, 22 May 2021",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  160, 164, 168, 1)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          17,
                                    ),
                                    Image.asset(
                                      "assets/images/Group 1154.png",
                                      // height: 40.0,
                                      // width: 30.0,
                                      // fit: BoxFit.fill,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 25,
                        ),
                        Column(
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Venue")),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Color.fromRGBO(19, 82, 139, 1),
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Caristas Hospital, Egbeda , Lagos",
                                  style: TextStyle(
                                      color: Color.fromRGBO(160, 164, 168, 1)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 25,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Date",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ))),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  color: Color.fromRGBO(19, 82, 139, 1),
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Saturday, 23 May 2021",
                                  style: TextStyle(
                                      color: Color.fromRGBO(160, 164, 168, 1)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 25,
                        ),
                        Column(
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Time",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ))),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.timelapse,
                                  color: Color.fromRGBO(19, 82, 139, 1),
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "1:00 pm - 2:00 pm",
                                  style: TextStyle(
                                      color: Color.fromRGBO(160, 164, 168, 1)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RaisedButton(
                              elevation: 0,
                              onPressed: () {
                                // setState(() {
                                //   docs = true;
                                // });
                              },
                              textColor: docs
                                  ? Color.fromRGBO(241, 245, 248, 1)
                                  : Colors.black,
                              //color: Color.fromRGBO(19, 82, 139, 1),
                              padding: EdgeInsets.all(0),
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width / 2.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Color.fromRGBO(241, 245, 248, 1),
                                    ),
                                    color: Color.fromRGBO(241, 245, 248, 1)),
                                padding: const EdgeInsets.all(12),
                                child: Center(
                                  child: const Text('Cancel',
                                      style: TextStyle(
                                        fontSize: 12,
                                      )),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            RaisedButton(
                              elevation: 1,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EditAppointmentSelectDate()));
                              },
                              textColor: docs
                                  ? Colors.black
                                  : Color.fromRGBO(241, 245, 248, 1),
                              //color: Color.fromRGBO(19, 82, 139, 1),
                              padding: EdgeInsets.all(0),
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width / 2.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: docs
                                        ? Colors.white
                                        : Color.fromRGBO(19, 82, 139, 1),
                                  ),
                                  color: docs
                                      ? Colors.white
                                      : Color.fromRGBO(19, 82, 139, 1),
                                ),
                                padding: const EdgeInsets.all(12),
                                child: Center(
                                  child: const Text('Edit',
                                      style: TextStyle(
                                        fontSize: 12,
                                      )),
                                ),
                              ),
                            ),
                          ],
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
