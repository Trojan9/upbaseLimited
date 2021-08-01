import 'package:upbase_limited/ui/Profile.dart';
import 'package:upbase_limited/ui/aboutyou.dart';
import 'package:upbase_limited/ui/aboutyouUpdate.dart';
import 'package:upbase_limited/ui/babiesredalert.dart';
import 'package:upbase_limited/ui/bookappointment.dart';
import 'package:upbase_limited/ui/drawer.dart';
import 'package:upbase_limited/ui/locatioUpdate.dart';
import 'package:upbase_limited/ui/myappointments.dart';
import 'package:upbase_limited/ui/passwordchange.dart';
import 'package:upbase_limited/ui/pregnancyredalert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//  Icons.check_circle_outline_outlined,
//  Icons.radio_button_off,
class RedAlert extends StatefulWidget {
  @override
  _RedAlertState createState() => _RedAlertState();
}

class _RedAlertState extends State<RedAlert> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Future<void> _launched;
  String toLaunch = "";
  List months = [
    "1-3 Months (1-13 Weeks)",
    "4-6 Months (14-26 Weeks)",
    "7-9 Months (27-39+ Weeks)"
  ];
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
  VoidCallback _showPersBottomSheetCallBack;

  @override
  void initState() {
    super.initState();
    _showPersBottomSheetCallBack = _showBottomSheet;
  }

  void _showBottomSheet() {
    setState(() {
      _showPersBottomSheetCallBack = null;
    });

    scaffoldKey.currentState
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
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        height: 3,
                        width: 80,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Emergency Confirmation",
                            style: TextStyle(
                              fontSize: 22,
                            ))),
                    SizedBox(
                      height: 30,
                    ),
                    Text.rich(TextSpan(
                        text: "",
                        style: TextStyle(fontSize: 15),
                        children: <TextSpan>[
                          TextSpan(
                              text:
                                  "This is for emergency purposes only, are you currently experiencing any danger signs?",
                              style: TextStyle(
                                  color: Color.fromRGBO(37, 40, 43, 1))),
                        ])),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RaisedButton(
                          elevation: 0,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          textColor: Color.fromRGBO(241, 245, 248, 1),
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
                              color: Color.fromRGBO(241, 245, 248, 1),
                            ),
                            padding: const EdgeInsets.all(12),
                            child: Center(
                              child: const Text('No',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.lightBlue)),
                            ),
                          ),
                        ),
                        RaisedButton(
                          elevation: 0,

                          onPressed: () {
                            if (type == 0) {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PregnancyRedAlert()));
                            } else {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BabiesRedAlert()));
                            }
                          },
                          textColor: Color.fromRGBO(241, 245, 248, 1),
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
                                color: Color.fromRGBO(19, 82, 139, 1),
                              ),
                              color: Color.fromRGBO(19, 82, 139, 1),
                            ),
                            padding: const EdgeInsets.all(12),
                            child: Center(
                              child: const Text('Yes',
                                  style: TextStyle(fontSize: 15)),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ));
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

  int type = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (_showPersBottomSheetCallBack == null) {
          return Future.value(true);
        } else {
          return Future.value(false);
        }
      },
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
                            child: Text("Red Alert",
                                style: TextStyle(
                                  fontSize: 22,
                                ))),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 25,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              type = 0;
                            });
                            _showPersBottomSheetCallBack();
                          },
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/images/image 2.png",
                                height: MediaQuery.of(context).size.height / 7,
                                width: MediaQuery.of(context).size.width,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    gradient: LinearGradient(
                                        begin: FractionalOffset.bottomLeft,
                                        end: FractionalOffset.topRight,
                                        colors: [
                                          Colors.grey.withOpacity(0.5),
                                          Color.fromRGBO(251, 78, 78, 1),
                                        ],
                                        stops: [
                                          0.0,
                                          1.0,
                                        ])),
                                height: MediaQuery.of(context).size.height / 7,
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
                                          Text(
                                            "Pregnancy Red Alert",
                                            style:
                                                TextStyle(color: Colors.white),
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
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              type = 1;
                            });
                            _showPersBottomSheetCallBack();
                          },
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/images/image 3.png",
                                height: MediaQuery.of(context).size.height / 7,
                                width: MediaQuery.of(context).size.width,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    gradient: LinearGradient(
                                        begin: FractionalOffset.bottomLeft,
                                        end: FractionalOffset.topRight,
                                        colors: [
                                          Colors.grey.withOpacity(0.5),
                                          Color.fromRGBO(251, 78, 78, 1),
                                        ],
                                        stops: [
                                          0.0,
                                          1.0,
                                        ])),
                                height: MediaQuery.of(context).size.height / 7,
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
                                          Text(
                                            "Babies Red Alert",
                                            style:
                                                TextStyle(color: Colors.white),
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
        ),
      ),
    );
  }
}
