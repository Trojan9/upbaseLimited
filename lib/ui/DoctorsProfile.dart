import 'package:upbase_limited/providers/appointmentprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class DoctorsProfile extends StatefulWidget {
  final index;
  const DoctorsProfile({Key key, this.index}) : super(key: key);

  @override
  _DoctorsProfileState createState() => _DoctorsProfileState();
}

class _DoctorsProfileState extends State<DoctorsProfile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppointmentProvider acct =
        Provider.of<AppointmentProvider>(context, listen: false);

    acct.getdoctordetail(
        Provider.of<AppointmentProvider>(context, listen: false)
            .doctors[widget.index]
            .doctor_id);
  }

  double rate = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Provider.of<AppointmentProvider>(context, listen: true)
                        .doctordetail ==
                    null
                ? Center(
                    child: Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: SpinKitCircle(
                      size: 40,
                      color: Colors.lightBlueAccent[600],
                    ),
                  ))
                : Column(
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
                                child: Provider.of<AppointmentProvider>(context,
                                                    listen: false)
                                                .doctordetail
                                                .dp ==
                                            null ||
                                        Provider.of<AppointmentProvider>(
                                                    context,
                                                    listen: false)
                                                .doctordetail
                                                .dp ==
                                            "null"
                                    ? Image.asset(
                                        "assets/images/profile.png",
                                        height: 100.0,
                                        width: 90.0,
                                        fit: BoxFit.fill,
                                      )
                                    : Image.network(
                                        Provider.of<AppointmentProvider>(
                                                context,
                                                listen: false)
                                            .doctordetail
                                            .dp,
                                        height: 100.0,
                                        width: 90.0,
                                        fit: BoxFit.fill,
                                      ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Dr ${Provider.of<AppointmentProvider>(context, listen: false).doctordetail.firstname} ${Provider.of<AppointmentProvider>(context, listen: false).doctordetail.lastname}",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              "${Provider.of<AppointmentProvider>(context, listen: false).doctordetail.speciality}",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SmoothStarRating(
                                  allowHalfRating: false,
                                  onRated: (v) {
                                    // setState(() {
                                    //   rate = v;
                                    // });
                                  },
                                  starCount: 5,
                                  rating: Provider.of<AppointmentProvider>(
                                                      context,
                                                      listen: false)
                                                  .doctordetail
                                                  .ratings ==
                                              null ||
                                          Provider.of<AppointmentProvider>(
                                                      context,
                                                      listen: false)
                                                  .doctordetail
                                                  .ratings ==
                                              "null"
                                      ? 0.0
                                      : int.parse(
                                              Provider.of<AppointmentProvider>(
                                                      context,
                                                      listen: false)
                                                  .doctordetail
                                                  .ratings)
                                          .toDouble(),
                                  size: 30.0,
                                  isReadOnly: true,
                                  filledIconData: Icons.star,
                                  halfFilledIconData: Icons.blur_on,
                                  color: Color.fromRGBO(245, 211, 108, 1),
                                  borderColor: Color.fromRGBO(245, 211, 108, 1),
                                  spacing: 0.0),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                  "(${Provider.of<AppointmentProvider>(context, listen: false).doctordetail.ratings == null || Provider.of<AppointmentProvider>(context, listen: false).doctordetail.ratings == "null" ? 0.0 : Provider.of<AppointmentProvider>(context, listen: false).doctordetail.ratings} rating)")
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 6,
                        width: MediaQuery.of(context).size.width,
                        color: Color.fromRGBO(240, 240, 240, 1),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Antenatal Care Appointments Done"),
                              Text(
                                "376",
                                style: TextStyle(fontSize: 20),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      RaisedButton(
                        elevation: 0,
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (BuildContext context) =>
                          //             BookAppointmentSelectDate()));
                        },
                        textColor: Color.fromRGBO(241, 245, 248, 1),
                        //color: Color.fromRGBO(19, 82, 139, 1),
                        padding: EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                        ),
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Color.fromRGBO(19, 82, 139, 1),
                            ),
                            color: Color.fromRGBO(19, 82, 139, 1),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Center(
                            child: const Text('Book Appointment',
                                style: TextStyle(fontSize: 13)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Reviews")),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          primary: false,
                          shrinkWrap: true,
                          itemCount: 1,
                          itemBuilder: (BuildContext context, index) {
                            return Container(
                              height: MediaQuery.of(context).size.height / 5,
                              width: MediaQuery.of(context).size.width,
                              color: Color.fromRGBO(251, 251, 251, 1),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        child: Image.asset(
                                          "assets/images/Ellipse 6.png",
                                          height: 50.0,
                                          width: 40.0,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 8,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 8,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Elizabeth Banwo",
                                                      style: TextStyle(
                                                          fontSize: 18),
                                                    ),
                                                    Text(
                                                      "Two months ago",
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              135,
                                                              138,
                                                              141,
                                                              1)),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Align(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.star,
                                                        color: Color.alphaBlend(
                                                            Color.fromRGBO(245,
                                                                211, 108, 1),
                                                            Color.fromRGBO(254,
                                                                207, 71, 1)),
                                                      ),
                                                      Text("5.0")
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 7,
                                          child: Text.rich(TextSpan(
                                              text: "",
                                              style: TextStyle(fontSize: 15),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text:
                                                        "Dr Donald is very calm and pays attention to details, he makes sure he explains things properly so you can understand the problem better.",
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            37, 40, 43, 1))),
                                              ])),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("See More Reviews",
                            style: TextStyle(
                                color: Color.fromRGBO(19, 82, 139, 1))),
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
