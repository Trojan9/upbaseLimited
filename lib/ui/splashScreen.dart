import 'package:upbase_limited/ui/appointmentdetails.dart';
import 'package:upbase_limited/ui/appointmentselectdateandtime.dart';
import 'package:upbase_limited/ui/bookingSuccess.dart';
import 'package:upbase_limited/ui/dashboard.dart';
import 'package:upbase_limited/ui/onboarding.dart';
import 'package:upbase_limited/ui/pregnancyredalert.dart';
import 'package:upbase_limited/ui/redAlert.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  final splashDelay = 5;
  @override
  void initState() {
    super.initState();

    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => Onboardingpage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 4,
                  left: 10,
                  right: 10),
              child: Center(
                child: Container(
                  // : MediaQuery.of(context).size.height / 2,
                  // left: MediaQuery.of(context).size.width / 2,
                  child: Image.asset(
                    "assets/images/Logo 2.png",
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width / 1.7,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
