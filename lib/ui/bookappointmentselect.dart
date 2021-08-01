import 'package:upbase_limited/ui/Profile.dart';
import 'package:upbase_limited/providers/appointmentprovider.dart';
import 'package:upbase_limited/ui/aboutyou.dart';
import 'package:upbase_limited/ui/aboutyouUpdate.dart';
import 'package:upbase_limited/ui/bookingSuccess.dart';
import 'package:upbase_limited/ui/drawer.dart';
import 'package:upbase_limited/ui/locatioUpdate.dart';
import 'package:upbase_limited/ui/passwordchange.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:provider/provider.dart';

class BookAppointmentSelectDate extends StatefulWidget {
  @override
  _BookAppointmentSelectDateState createState() =>
      _BookAppointmentSelectDateState();
}

class _BookAppointmentSelectDateState extends State<BookAppointmentSelectDate> {
  bool docs = false;
  List<bool> times = [false, false, false];
  DateTime _currentDate;
  Future<void> _launched;
  String toLaunch = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppointmentProvider acct =
        Provider.of<AppointmentProvider>(context, listen: false);
    if (Provider.of<AppointmentProvider>(context, listen: false)
        .doctors
        .isEmpty) {
      acct.getavailabledate(
          Provider.of<AppointmentProvider>(context, listen: false)
              .doctordetail
              .doctor_id);
    }
  }

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
  CalendarCarousel _calendarCarousel;
  bool drop = true;
  @override
  Widget build(BuildContext context) {
    _calendarCarousel = CalendarCarousel<Event>(
      isScrollable: false,
      //pageScrollPhysics: NeverScrollableScrollPhysics(),
      customGridViewPhysics: NeverScrollableScrollPhysics(),

      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate = date);
        events.forEach((event) => print(event.title));
      },

      weekendTextStyle:
          TextStyle(color: Colors.blue, fontWeight: FontWeight.w700),
      thisMonthDayBorderColor: Colors.grey,
//          weekDays: null, /// for pass null when you do not want to render weekDays
      // headerText: 'Custom Header',
      weekFormat: false,
      selectedDayButtonColor: Colors.lightBlue,
      //weekDayBackgroundColor: Colors.lightBlue,
      weekdayTextStyle: TextStyle(color: Colors.blue),
      daysTextStyle:
          TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
      // markedDatesMap: _markedDateMap,
      height: MediaQuery.of(context).size.height / 1.50,
      selectedDateTime: _currentDate,
      showIconBehindDayText: true,
      // daysHaveCircularBorder: false, /// null for not rendering any border, true for circular border, false for rectangular border
      //customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateShowIcon: true,
      markedDateIconMaxShown: 2,
      selectedDayTextStyle: TextStyle(
        color: Colors.white,
      ),
      showHeaderButton: true,

      todayTextStyle: TextStyle(
        color: Colors.blue,
      ),
      markedDateIconBuilder: (event) {
        return event.icon;
      },
      // minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      // maxSelectedDate: _currentDate.add(Duration(days: 360)),
      todayButtonColor: Colors.transparent,
      todayBorderColor: Colors.blueAccent,
      markedDateMoreShowTotal:
          true, // null for not showing hidden events indicator
//          markedDateIconMargin: 9,
//          markedDateIconOffset: 3,
    );
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
                      child: Row(
                        children: [
                          IconButton(
                              icon: Icon(
                                Icons.arrow_back_sharp,
                                size: 30,
                              ),
                              onPressed: () async {
                                Navigator.pop(context);
                              }),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Dr Alieu Donald",
                                  style: TextStyle(
                                    fontSize: 22,
                                  ))),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
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
                                    "${Provider.of<AppointmentProvider>(context, listen: false).doctordetail.officeaddress}",
                                    style: TextStyle(
                                        color:
                                            Color.fromRGBO(160, 164, 168, 1)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 40,
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height / 6,
                                width: MediaQuery.of(context).size.width,
                                color: Color.fromRGBO(251, 251, 251, 1),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Icon(
                                        Icons.error_outline_sharp,
                                        color: Color.fromRGBO(0, 0, 0, 0.54),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 9,
                                      child: Text.rich(TextSpan(
                                          text: "",
                                          style: TextStyle(fontSize: 13),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text:
                                                    "Doctors are available for Antenatal care appoinments from 10 am to 4 pm.",
                                                style: TextStyle()),
                                          ])),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 40,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Available Dates (Choose One)",
                                      style: TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 15,
                                      ))),
                              SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    drop = !drop;
                                  });
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 18,
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    children: [
                                      Text(
                                        "May 2021",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Icon(
                                        drop
                                            ? Icons.arrow_drop_down
                                            : Icons.arrow_right,
                                        size: 25,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 40,
                              ),
                              drop
                                  ? ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      primary: false,
                                      shrinkWrap: true,
                                      itemCount: 3,
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        return Column(
                                          children: [
                                            Row(
                                              children: [
                                                RaisedButton(
                                                  elevation: 0,
                                                  onPressed: () {
                                                    setState(() {
                                                      times[index] =
                                                          !times[index];
                                                    });
                                                  },
                                                  textColor: times[index]
                                                      ? Color.fromRGBO(
                                                          241, 245, 248, 1)
                                                      : Colors.black,

                                                  //color: Color.fromRGBO(19, 82, 139, 1),
                                                  padding: EdgeInsets.all(0),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(5.0),
                                                  ),
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            12,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            1.2,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      border: Border.all(
                                                        color: times[index]
                                                            ? Color.fromRGBO(
                                                                19, 82, 139, 1)
                                                            : Color.fromRGBO(
                                                                248,
                                                                248,
                                                                248,
                                                                1),
                                                      ),
                                                      color: times[index]
                                                          ? Color.fromRGBO(
                                                              19, 82, 139, 1)
                                                          : Color.fromRGBO(
                                                              248, 248, 248, 1),
                                                    ),
                                                    padding:
                                                        const EdgeInsets.all(0),
                                                    child: Center(
                                                      child: const Text(
                                                          'Saturday, 15 May 2021',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                          )),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            )
                                          ],
                                        );
                                      })
                                  : Container(),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 40,
                          ),
                          // Align(
                          //     alignment: Alignment.centerLeft,
                          //     child: Text("Available Time Slots",
                          //         style: TextStyle(
                          //           fontSize: 18,
                          //         ))),
                          // Container(
                          //   height: MediaQuery.of(context).size.height / 8,
                          //   width: MediaQuery.of(context).size.width,
                          //   child: ListView.builder(
                          //       scrollDirection: Axis.horizontal,
                          //       itemCount: 3,
                          //       itemBuilder: (BuildContext context, index) {
                          //         return Row(
                          //           children: [
                          //             RaisedButton(
                          //               elevation: 0,
                          //               onPressed: () {
                          //                 setState(() {
                          //                   times[index] = !times[index];
                          //                 });
                          //               },
                          //               textColor: times[index]
                          //                   ? Color.fromRGBO(241, 245, 248, 1)
                          //                   : Colors.black,

                          //               //color: Color.fromRGBO(19, 82, 139, 1),
                          //               padding: EdgeInsets.all(0),
                          //               shape: RoundedRectangleBorder(
                          //                 borderRadius:
                          //                     new BorderRadius.circular(10.0),
                          //               ),
                          //               child: Container(
                          //                 height: 40,
                          //                 width: MediaQuery.of(context)
                          //                         .size
                          //                         .width /
                          //                     2.5,
                          //                 decoration: BoxDecoration(
                          //                   borderRadius:
                          //                       BorderRadius.circular(10),
                          //                   border: Border.all(
                          //                     color: times[index]
                          //                         ? Color.fromRGBO(
                          //                             19, 82, 139, 1)
                          //                         : Colors.white,
                          //                   ),
                          //                   color: times[index]
                          //                       ? Color.fromRGBO(19, 82, 139, 1)
                          //                       : Colors.white,
                          //                 ),
                          //                 padding: const EdgeInsets.all(12),
                          //                 child: Center(
                          //                   child: const Text(
                          //                       '11:00 pm - 12:00 pm',
                          //                       style: TextStyle(
                          //                         fontSize: 12,
                          //                       )),
                          //                 ),
                          //               ),
                          //             ),
                          //             SizedBox(
                          //               width: 10,
                          //             )
                          //           ],
                          //         );
                          //       }),
                          // ),
                          SizedBox(
                            height: 10,
                          ),
                          RaisedButton(
                            elevation: 0,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BookingSuccess()));
                            },
                            textColor: Color.fromRGBO(241, 245, 248, 1),

                            //color: Color.fromRGBO(19, 82, 139, 1),
                            padding: EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: times.contains(true)
                                          ? Color.fromRGBO(19, 82, 139, 1)
                                          : Color.fromRGBO(160, 164, 168, 1)),
                                  color: times.contains(true)
                                      ? Color.fromRGBO(19, 82, 139, 1)
                                      : Color.fromRGBO(160, 164, 168, 1)),
                              padding: const EdgeInsets.all(12),
                              child: Center(
                                child: const Text('Book Appointment',
                                    style: TextStyle(
                                      fontSize: 12,
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ]),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
