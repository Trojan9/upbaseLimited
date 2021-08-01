import 'package:upbase_limited/ui/appointmentdetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingSuccess extends StatefulWidget {
  @override
  _BookingSuccessState createState() => _BookingSuccessState();
}

class _BookingSuccessState extends State<BookingSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
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
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 50),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 40,
                    ),
                    Center(
                        child: Image.asset(
                      "assets/images/Active.png",
                      height: 100,
                      width: 100,
                    )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 15,
                    ),
                    Text.rich(
                      TextSpan(
                        text:
                            ' Dear Eno Michael, you have an appointment to see',
                        style: GoogleFonts.nunito(
                            fontSize: 25, fontWeight: FontWeight.w200),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Dr Alieu Donald ',
                            style: GoogleFonts.nunito(
                              fontSize: 25,
                              fontWeight: FontWeight.w200,
                              color: Colors.lightBlueAccent,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(
                            text: 'on  ',
                            style: GoogleFonts.nunito(
                                fontSize: 25, fontWeight: FontWeight.w200),
                          ),
                          TextSpan(
                            text: 'Saturday 22, May 2021',
                            style: GoogleFonts.nunito(
                              fontSize: 25,
                              fontWeight: FontWeight.w200,
                              color: Colors.lightBlueAccent,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(
                            text: 'at the  ',
                            style: GoogleFonts.nunito(
                                fontSize: 25, fontWeight: FontWeight.w200),
                          ),
                          TextSpan(
                            text: 'Caritas Hospital by 12:00 pm. ',
                            style: GoogleFonts.nunito(
                              fontSize: 25,
                              fontWeight: FontWeight.w200,
                              color: Colors.lightBlueAccent,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(
                            text:
                                "We will send you periodic reminders to ensure you don't forget about your appointment. If you have any question, you can call this number  ",
                            style: GoogleFonts.nunito(
                                fontSize: 25, fontWeight: FontWeight.w200),
                          ),
                          TextSpan(
                            text: '08023452345. ',
                            style: GoogleFonts.nunito(
                              fontSize: 25,
                              fontWeight: FontWeight.w200,
                              color: Colors.lightBlueAccent,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(
                            text: 'Stay Healthy.',
                            style: GoogleFonts.nunito(
                                fontSize: 25, fontWeight: FontWeight.w200),
                          ),
                          // can add more TextSpans here...
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 15,
                    ),
                    RaisedButton(
                      elevation: 0,
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    AppointmentsDetails()));
                      },
                      textColor: Color.fromRGBO(241, 245, 248, 1),

                      //color: Color.fromRGBO(19, 82, 139, 1),
                      padding: EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width / 1.3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Color.fromRGBO(19, 82, 139, 1)),
                            color: Color.fromRGBO(19, 82, 139, 1)),
                        padding: const EdgeInsets.all(12),
                        child: Center(
                          child: const Text('See Details',
                              style: TextStyle(
                                fontSize: 12,
                              )),
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
    );
  }
}
