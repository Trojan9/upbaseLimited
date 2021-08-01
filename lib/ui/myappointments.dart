import 'package:upbase_limited/ui/Profile.dart';
import 'package:upbase_limited/ui/Reportdetails.dart';
import 'package:upbase_limited/ui/aboutyou.dart';
import 'package:upbase_limited/ui/aboutyouUpdate.dart';
import 'package:upbase_limited/ui/drawer.dart';
import 'package:upbase_limited/ui/locatioUpdate.dart';
import 'package:upbase_limited/ui/passwordchange.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

var colorsss = [Colors.redAccent, Colors.greenAccent];

class MyAppointments extends StatefulWidget {
  @override
  _MyAppointmentsState createState() => _MyAppointmentsState();
}

class _MyAppointmentsState extends State<MyAppointments> {
  bool docs = true;
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
                            child: Text("My Appointments",
                                style: TextStyle(
                                  fontSize: 22,
                                ))),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 25,
                        ),
                        Row(
                          children: [
                            RaisedButton(
                              elevation: 0,
                              onPressed: () {
                                setState(() {
                                  docs = true;
                                });
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
                                height: 40,
                                width: MediaQuery.of(context).size.width / 3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: docs
                                        ? Color.fromRGBO(19, 82, 139, 1)
                                        : Colors.white,
                                  ),
                                  color: docs
                                      ? Color.fromRGBO(19, 82, 139, 1)
                                      : Colors.white,
                                ),
                                padding: const EdgeInsets.all(12),
                                child: Center(
                                  child: const Text('Upcoming',
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
                              elevation: 0,
                              onPressed: () {
                                setState(() {
                                  docs = false;
                                });
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
                                height: 40,
                                width: MediaQuery.of(context).size.width / 3,
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
                                  child: const Text('Completed',
                                      style: TextStyle(
                                        fontSize: 12,
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 25,
                        ),
                        // Align(
                        //     alignment: Alignment.centerLeft,
                        //     child: Text("Doctors Near You",
                        //         style: TextStyle(
                        //           fontSize: 16,
                        //         ))),
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height / 25,
                        // ),
                        docs
                            ? ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                primary: false,
                                shrinkWrap: true,
                                itemCount: 2,
                                itemBuilder: (BuildContext context, index) {
                                  return Column(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                8,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        color: Color.fromRGBO(248, 248, 248, 1),
                                        child: Row(
                                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  7,
                                              width: 3,
                                              color: colorsss[index % 2],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0, bottom: 8),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            20,
                                                  ),
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                    child: Image.asset(
                                                      "assets/images/Ellipse 6.png",
                                                      height: 40.0,
                                                      width: 30.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            16,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text("Dr Alieu Donald"),
                                                      Text(
                                                        "Saturay, 22 May 2021",
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    160,
                                                                    164,
                                                                    168,
                                                                    1)),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Column(
                                                            children: [
                                                              Text("Venue"),
                                                              Text(
                                                                  "Caristas Hospital",
                                                                  style: TextStyle(
                                                                      color: Color.fromRGBO(
                                                                          160,
                                                                          164,
                                                                          168,
                                                                          1))),
                                                            ],
                                                          ),
                                                          SizedBox(width: 7),
                                                          Column(
                                                            children: [
                                                              Text("Time"),
                                                              Text("12:00 pm",
                                                                  style: TextStyle(
                                                                      color: Color.fromRGBO(
                                                                          160,
                                                                          164,
                                                                          168,
                                                                          1))),
                                                            ],
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            17,
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: IconButton(
                                                        icon: Icon(
                                                          Icons.more_vert,
                                                          size: 25,
                                                          color: Colors.black,
                                                        ),
                                                        onPressed: null),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                    ],
                                  );
                                })
                            : ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                primary: false,
                                shrinkWrap: true,
                                itemCount: 2,
                                itemBuilder: (BuildContext context, index) {
                                  return Column(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                4.5,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        color: Color.fromRGBO(248, 248, 248, 1),
                                        child: Column(
                                          children: [
                                            Row(
                                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      7,
                                                  width: 3,
                                                  color: colorsss[index % 2],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0, bottom: 8),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            20,
                                                      ),
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50.0),
                                                        child: Image.asset(
                                                          "assets/images/Ellipse 6.png",
                                                          height: 40.0,
                                                          width: 30.0,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            16,
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                              "Dr Alieu Donald"),
                                                          Text(
                                                            "Saturay, 22 May 2021",
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        160,
                                                                        164,
                                                                        168,
                                                                        1)),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Column(
                                                                children: [
                                                                  Text("Venue"),
                                                                  Text(
                                                                      "Caristas Hospital",
                                                                      style: TextStyle(
                                                                          color: Color.fromRGBO(
                                                                              160,
                                                                              164,
                                                                              168,
                                                                              1))),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                  width: 7),
                                                              Column(
                                                                children: [
                                                                  Text("Time"),
                                                                  Text(
                                                                      "12:00 pm",
                                                                      style: TextStyle(
                                                                          color: Color.fromRGBO(
                                                                              160,
                                                                              164,
                                                                              168,
                                                                              1))),
                                                                ],
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            17,
                                                      ),
                                                      Align(
                                                        alignment:
                                                            Alignment.topRight,
                                                        child: IconButton(
                                                            icon: Icon(
                                                              Icons.more_vert,
                                                              size: 25,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                            onPressed: null),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            RaisedButton(
                                              elevation: 0,
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ReportDetails()));
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
                                                height: 40,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.3,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: Color.fromRGBO(
                                                            19, 82, 139, 1)),
                                                    color: Color.fromRGBO(
                                                        19, 82, 139, 1)),
                                                padding:
                                                    const EdgeInsets.all(12),
                                                child: Center(
                                                  child:
                                                      const Text('View Report',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                          )),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                    ],
                                  );
                                }),
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
