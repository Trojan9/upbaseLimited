import 'package:upbase_limited/ui/Profile.dart';
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

class AppointmentSelectDate extends StatefulWidget {
  @override
  _AppointmentSelectDateState createState() => _AppointmentSelectDateState();
}

class _AppointmentSelectDateState extends State<AppointmentSelectDate> {
  bool docs = false;
  List<bool> times = [false, false, false];
  DateTime _currentDate;
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
  CalendarCarousel _calendarCarousel;

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
                              child: Text("Select Date & Time",
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
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                20,
                                      ),
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        child: Image.asset(
                                          "assets/images/Ellipse 6.png",
                                          height: 40.0,
                                          width: 30.0,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
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
                                        width:
                                            MediaQuery.of(context).size.width /
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
                            height: MediaQuery.of(context).size.height / 40,
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
                                        color:
                                            Color.fromRGBO(160, 164, 168, 1)),
                                  ),
                                ],
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
                                  child: Text("Available Dates",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ))),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 40,
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height / 1.8,
                                margin: EdgeInsets.symmetric(horizontal: 8.0),
                                child: _calendarCarousel,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 40,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Available Time Slots",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ))),
                          Container(
                            height: MediaQuery.of(context).size.height / 8,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                itemBuilder: (BuildContext context, index) {
                                  return Row(
                                    children: [
                                      RaisedButton(
                                        elevation: 0,
                                        onPressed: () {
                                          setState(() {
                                            times[index] = !times[index];
                                          });
                                        },
                                        textColor: times[index]
                                            ? Color.fromRGBO(241, 245, 248, 1)
                                            : Colors.black,

                                        //color: Color.fromRGBO(19, 82, 139, 1),
                                        padding: EdgeInsets.all(0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(10.0),
                                        ),
                                        child: Container(
                                          height: 40,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.5,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: times[index]
                                                  ? Color.fromRGBO(
                                                      19, 82, 139, 1)
                                                  : Colors.white,
                                            ),
                                            color: times[index]
                                                ? Color.fromRGBO(19, 82, 139, 1)
                                                : Colors.white,
                                          ),
                                          padding: const EdgeInsets.all(12),
                                          child: Center(
                                            child: const Text(
                                                '11:00 pm - 12:00 pm',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                )),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      )
                                    ],
                                  );
                                }),
                          ),
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
                                      color: times.contains(true) &&
                                              _currentDate.toString().isNotEmpty
                                          ? Color.fromRGBO(19, 82, 139, 1)
                                          : Color.fromRGBO(160, 164, 168, 1)),
                                  color: times.contains(true) &&
                                          _currentDate.toString().isNotEmpty
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
