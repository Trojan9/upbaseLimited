import 'package:upbase_limited/providers/Auth.dart';
import 'package:upbase_limited/providers/setpagedrawer.dart';
import 'package:upbase_limited/ui/drawer.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'dart:async';

import 'package:provider/provider.dart';

var colorsss = [Colors.redAccent, Colors.greenAccent];

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  // final _scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool empty = true;
  final int _numPages = 2;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: 3.0,
      width: isActive ? 25.0 : 25.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey[400],
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    if (_currentPage == 0) {
      setState(() {
        _currentPage = 1;
      });
      _pageController.jumpToPage(_currentPage);
      startTime();
    } else {
      setState(() {
        _currentPage = 0;
      });
      _pageController.jumpToPage(_currentPage);
      startTime();
    }
  }

  @override
  void initState() {
    super.initState();
    Provider.of<Setpageprovider>(context, listen: false).setpage(0);
    AuthProvider acct = Provider.of<AuthProvider>(context, listen: false);
    acct.getProfile(acct.patient.phone);
    setState(() {});
    // _pageController.addListener(() {
    //   setState(() {
    //     _pageController. = _currentPage.toDouble();
    //   });
    // });
    startTime();
  }

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: SideDrawer(),
        body: SafeArea(
          child: SingleChildScrollView(
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
                        const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 9,
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      Provider.of<AuthProvider>(context,
                                                      listen: true)
                                                  .patient ==
                                              null
                                          ? "Welcome"
                                          : "Welcome ${Provider.of<AuthProvider>(context, listen: true).patient.firstname},",
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 22,
                                      ))),
                            ),
                            Expanded(
                                flex: 1,
                                child: SizedBox(
                                  width: 10,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 25,
                        ),
                        Row(
                          children: [
                            Image.asset("assets/images/calendar.png"),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Caritas Hospital, Egbeda, Lagos")
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 25,
                        ),
                        Row(
                          children: [
                            Image.asset("assets/images/idea.png"),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Health Tips")
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 25,
                        ),
                        Container(
                            height: MediaQuery.of(context).size.height / 3.5,
                            child: PageView(
                                physics: ClampingScrollPhysics(),
                                controller: _pageController,
                                onPageChanged: (int page) {
                                  setState(() {
                                    _currentPage = page;
                                  });
                                },
                                children: <Widget>[
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 4,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15),
                                          topRight: Radius.circular(15),
                                          topLeft: Radius.circular(15)),
                                    ),
                                    child: Stack(
                                      children: [
                                        Image.asset(
                                          "assets/images/dashimage1.png",
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              4,
                                          width:
                                              MediaQuery.of(context).size.width,
                                        ),
                                        Positioned(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              6,
                                          child: Text(
                                            "Can I Sleep on My Back During Late Pregnancy?",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 4,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15),
                                          topRight: Radius.circular(15),
                                          topLeft: Radius.circular(15)),
                                    ),
                                    child: Stack(
                                      children: [
                                        Image.asset(
                                          "assets/images/dashimage2.png",
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              4,
                                          width:
                                              MediaQuery.of(context).size.width,
                                        ),
                                        Positioned(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              6,
                                          child: Text(
                                            "What type of food should I eat when pregnant?",
                                            maxLines: 2,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ])),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _buildPageIndicator(),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("assets/images/calendar.png"),
                            Text("Upcoming Appointments"),
                            Text(
                              "View All",
                              style: TextStyle(
                                color: Colors.lightBlueAccent,
                                decoration: TextDecoration.underline,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 35,
                        ),
                        empty
                            ? Column(
                                children: [
                                  Image.asset(
                                    "assets/images/Group 1098.png",
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                  Center(
                                      child: Text(
                                    "You currently have no appointments.",
                                    maxLines: 2,
                                  )),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 15,
                                  ),
                                  RaisedButton(
                                    elevation: 0,
                                    onPressed: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder:
                                      //             (BuildContext context) =>
                                      //                 Otp()));
                                    },
                                    textColor: Color.fromRGBO(241, 245, 248, 1),
                                    //color: Color.fromRGBO(19, 82, 139, 1),
                                    padding: EdgeInsets.all(0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                    ),
                                    child: Container(
                                      height: 50,
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color.fromRGBO(19, 82, 139, 1),
                                        ),
                                        color: Color.fromRGBO(19, 82, 139, 1),
                                      ),
                                      padding: const EdgeInsets.all(12),
                                      child: Center(
                                        child: const Text('Book An Appointment',
                                            style: TextStyle(fontSize: 15)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 18,
                                  ),
                                ],
                              )
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
                                                7,
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
                                              width: 2,
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
