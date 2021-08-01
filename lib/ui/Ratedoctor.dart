import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RateDoctor extends StatefulWidget {
  const RateDoctor({Key key}) : super(key: key);

  @override
  _RateDoctorState createState() => _RateDoctorState();
}

class _RateDoctorState extends State<RateDoctor> {
  double rating = 0.0;
  TextEditingController Medicationval = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final phoneNumber = TextFormField(
        autofocus: false,
        // obscureText: true,
        controller: Medicationval,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        expands: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide.none),
        ));
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
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
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              Center(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Image.asset(
                          "assets/images/Ellipse 6.png",
                          height: 100.0,
                          width: 90.0,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Dr Alieu Donald",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      "Obstetrician",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 35,
              ),
              Text.rich(
                TextSpan(
                  text: 'Rate Your Appointment With Me',
                  style: TextStyle(
                      fontSize: 14, color: Color.fromRGBO(82, 87, 92, 1)),
                  children: <TextSpan>[
                    // can add more TextSpans here...
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 35,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SmoothStarRating(
                    allowHalfRating: false,
                    onRated: (v) {
                      setState(() {
                        rating = v;
                      });
                    },
                    starCount: 5,
                    rating: rating,
                    size: 40.0,
                    isReadOnly: false,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.blur_on,
                    color: Color.fromRGBO(245, 211, 108, 1),
                    borderColor: Color.fromRGBO(245, 211, 108, 1),
                    spacing: 0.0),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 35,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Write a Comment Below",
                    style: TextStyle(color: Color.fromRGBO(19, 82, 139, 1))),
              ),
              Container(
                  height: MediaQuery.of(context).size.height / 7,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(232, 232, 232, 1),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                        topRight: Radius.circular(5),
                        topLeft: Radius.circular(5)),
                  ),
                  padding: EdgeInsets.all(7),
                  child: phoneNumber),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              RaisedButton(
                elevation: 0,
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (BuildContext context) =>
                  //             Digitcode()));
                },
                textColor: Color.fromRGBO(241, 245, 248, 1),
                //color: Color.fromRGBO(19, 82, 139, 1),
                padding: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0),
                ),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Color.fromRGBO(19, 82, 139, 1),
                    ),
                    color: Color.fromRGBO(19, 82, 139, 1),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Center(
                    child: const Text('Submit', style: TextStyle(fontSize: 13)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
