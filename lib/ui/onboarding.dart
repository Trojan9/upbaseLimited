import 'package:upbase_limited/ui/login.dart';
import 'package:upbase_limited/ui/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Onboardingpage extends StatefulWidget {
  @override
  _OnboardingpageState createState() => _OnboardingpageState();
}

class _OnboardingpageState extends State<Onboardingpage> {
  final int _numPages = 3;
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

  Widget onboard1(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image(
              image: AssetImage(
                'assets/images/Logo 1.png',
              ),
              height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.width / 3,
            ),
          ),
          Center(
            child: Image(
              image: AssetImage(
                'assets/images/Group 1125.png',
              ),
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 1.3,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 15,
          ),
          Center(
            child: Text(
              'Find Healthcare near you',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 22.0,
                height: 1.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget onboard2(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image(
              image: AssetImage(
                'assets/images/Logo 1.png',
              ),
              height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.width / 3,
            ),
          ),
          Center(
            child: Image(
              image: AssetImage(
                'assets/images/Group 1130.png',
              ),
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 1.3,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 15,
          ),
          Center(
            child: Text(
              'Book an Appointment (Mother and Childcare)',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
                height: 1.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget onboard3(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image(
              image: AssetImage(
                'assets/images/Logo 1.png',
              ),
              height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.width / 3,
            ),
          ),
          Center(
            child: Image(
              image: AssetImage(
                'assets/images/group3board.png',
              ),
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 1.3,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 15,
          ),
          Text.rich(TextSpan(
              text: 'Initiate an Emergency',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: ' RED ALERT ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.redAccent,
                      //decoration: TextDecoration.underline,
                    )),
                TextSpan(
                    text: "for Swift Medical Response",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      // color: Color(0xFFF2994A),
                      //decoration: TextDecoration.underline,
                    ))
              ])),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
          body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFFFFF),
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height / 1.49,
                        child: PageView(
                            physics: ClampingScrollPhysics(),
                            controller: _pageController,
                            onPageChanged: (int page) {
                              setState(() {
                                _currentPage = page;
                              });
                            },
                            children: <Widget>[
                              onboard1(context),
                              onboard2(context),
                              onboard3(context)
                            ])),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildPageIndicator(),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 10.5,
                    ),
                    Column(
                      children: [
                        RaisedButton(
                          elevation: 0,
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Login()));
                          },
                          textColor: Color.fromRGBO(19, 82, 139, 1),
                          color: Color.fromRGBO(241, 245, 248, 1),
                          padding: EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(241, 245, 248, 1),
                            ),
                            padding: const EdgeInsets.all(12),
                            child: Center(
                              child: const Text('Sign In',
                                  style: TextStyle(fontSize: 15)),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        RaisedButton(
                          elevation: 0,
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SignUp()));
                          },
                          textColor: Color.fromRGBO(241, 245, 248, 1),
                          //color: Color.fromRGBO(19, 82, 139, 1),
                          padding: EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Color.fromRGBO(19, 82, 139, 1),
                              ),
                              color: Color.fromRGBO(19, 82, 139, 1),
                            ),
                            padding: const EdgeInsets.all(12),
                            child: Center(
                              child: const Text('Sign Up',
                                  style: TextStyle(fontSize: 15)),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ))),
    );
  }
}
