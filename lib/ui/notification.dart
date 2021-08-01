import 'package:upbase_limited/ui/drawer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Notificationss extends StatefulWidget {
  @override
  _NotificationssState createState() => _NotificationssState();
}

class _NotificationssState extends State<Notificationss> {
  bool notice = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: SideDrawer(),
      body: SafeArea(
        child: Container(
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
                              child: Text("Notifications",
                                  style: TextStyle(
                                    fontSize: 22,
                                  ))),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 20,
                          ),
                          Center(
                            child: Image.asset(
                              "assets/images/No Notifications.png",
                              height: MediaQuery.of(context).size.height / 1.5,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                          Center(
                            child: Text(
                              "You currently have no notifications.",
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
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text("You have one unread message.",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ))),
                          SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                              itemCount: 3,
                              physics: NeverScrollableScrollPhysics(),
                              primary: false,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, index) {
                                return Column(
                                  children: [
                                    Column(
                                      children: [
                                        Text.rich(TextSpan(
                                            text: "",
                                            style: TextStyle(fontSize: 15),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text:
                                                      "Dear Dr Alieu Donald,This is to remind you of your appointment with Eno Charles on the Saturday, 12 May 2021 by 12:00 pm at Caristas hospital Egbeda",
                                                  style: TextStyle()),
                                            ])),
                                        Align(
                                            alignment: Alignment.bottomRight,
                                            child: Text("Now",
                                                style: TextStyle(
                                                  fontSize: 13,
                                                ))),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                );
                              })
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
