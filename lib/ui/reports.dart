import 'package:upbase_limited/ui/Reportdetails.dart';
import 'package:upbase_limited/ui/drawer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Reports extends StatefulWidget {
  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  bool notice = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        drawer: SideDrawer(),
        body: Container(
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
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 50),
                child: notice
                    ? Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Reports",
                                  style: TextStyle(
                                    fontSize: 22,
                                  ))),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 20,
                          ),
                          Center(
                            child: Image.asset(
                              "assets/images/noreport.png",
                              height: MediaQuery.of(context).size.height / 2.2,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                          Center(
                            child: Text(
                              "You currently have no reports.",
                              style: TextStyle(
                                color: Color.fromRGBO(82, 87, 92, 1),
                                // decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                        ],
                      )
                    : Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Reports",
                                  style: TextStyle(
                                    fontSize: 22,
                                  ))),
                          SizedBox(
                            height: 20,
                          ),
                          Text.rich(TextSpan(
                              text:
                                  "Here’s a list reports from your past medical appointments",
                              style: TextStyle(fontSize: 15),
                              children: <TextSpan>[
                                // TextSpan(
                                //     recognizer:
                                //         new TapGestureRecognizer()
                                //           ..onTap = () {
                                //             Navigator.pushReplacement(
                                //                 context,
                                //                 MaterialPageRoute(
                                //                     builder: (BuildContext
                                //                             context) =>
                                //                         Login()));
                                //           },
                                //     text: 'Login',
                                //     style: TextStyle(
                                //       color: Color.fromRGBO(
                                //           19, 82, 139, 1),
                                //       //decoration: TextDecoration.underline,
                                //     )),
                              ])),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 25,
                          ),
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              primary: false,
                              shrinkWrap: true,
                              itemCount: 2,
                              itemBuilder: (BuildContext context, index) {
                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ReportDetails()));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(248, 248, 248, 1),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        height:
                                            MediaQuery.of(context).size.height /
                                                10,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
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
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                              "20/02/2021")),
                                                      Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                              "With Dr Alieu Donald")),
                                                    ],
                                                  ),
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
                                  ],
                                );
                              }),

                          // GestureDetector(
                          //   onTap: () {
                          //     Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) => ReportDetails()));
                          //   },
                          //   child: Container(
                          //     decoration: BoxDecoration(
                          //       color: Color.fromRGBO(248, 248, 248, 1),
                          //       borderRadius: BorderRadius.circular(10.0),
                          //     ),
                          //     height: MediaQuery.of(context).size.height / 10,
                          //     width: MediaQuery.of(context).size.width,
                          //     child: Padding(
                          //       padding: const EdgeInsets.only(left: 10.0),
                          //       child: Row(
                          //         mainAxisAlignment:
                          //             MainAxisAlignment.spaceBetween,
                          //         children: [
                          //           Row(
                          //             children: [
                          //               // Icon(
                          //               //   Icons.info_rounded,
                          //               //   color: Colors.black,
                          //               //   size: 25,
                          //               // ),
                          //               Column(
                          //                 crossAxisAlignment:
                          //                     CrossAxisAlignment.start,
                          //                 mainAxisAlignment:
                          //                     MainAxisAlignment.spaceAround,
                          //                 children: [
                          //                   Text("14/02/2021"),
                          //                   Text("With Dr Alieu Donald"),
                          //                 ],
                          //               ),
                          //             ],
                          //           ),
                          //           Icon(
                          //             Icons.arrow_forward_ios,
                          //             color: Colors.black,
                          //             size: 15,
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
