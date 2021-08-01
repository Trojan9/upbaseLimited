import 'package:upbase_limited/providers/appointmentprovider.dart';
import 'package:upbase_limited/ui/DoctorsProfile.dart';
import 'package:upbase_limited/ui/Profile.dart';
import 'package:upbase_limited/ui/aboutyou.dart';
import 'package:upbase_limited/ui/aboutyouUpdate.dart';
import 'package:upbase_limited/ui/appointmentselectdateandtime.dart';
import 'package:upbase_limited/ui/drawer.dart';
import 'package:upbase_limited/ui/locatioUpdate.dart';
import 'package:upbase_limited/ui/passwordchange.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class BookAppointments extends StatefulWidget {
  @override
  _BookAppointmentsState createState() => _BookAppointmentsState();
}

class _BookAppointmentsState extends State<BookAppointments> {
  bool docs = true;
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppointmentProvider acct =
        Provider.of<AppointmentProvider>(context, listen: false);
    if (Provider.of<AppointmentProvider>(context, listen: false)
            .doctors
            .length ==
        0) {
      acct.getdoctors();
    }
  }

  @override
  Widget build(BuildContext context) {
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
              child: Provider.of<AppointmentProvider>(context, listen: true)
                      .isloading
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
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20, top: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Book Appointment",
                                      style: TextStyle(
                                        fontSize: 22,
                                      ))),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 25,
                              ),
                              Row(
                                children: [
                                  RaisedButton(
                                    elevation: 0,
                                    onPressed: () {
                                      setState(() {
                                        docs = true;
                                      });
                                      AppointmentProvider acct =
                                          Provider.of<AppointmentProvider>(
                                              context,
                                              listen: false);
                                      if (Provider.of<AppointmentProvider>(
                                              context,
                                              listen: false)
                                          .doctors
                                          .isEmpty) {
                                        acct.getdoctors();
                                      }
                                    },
                                    textColor: docs
                                        ? Color.fromRGBO(241, 245, 248, 1)
                                        : Colors.black,
                                    //color: Color.fromRGBO(19, 82, 139, 1),
                                    padding: EdgeInsets.all(0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                    ),
                                    child: Container(
                                      height: 50,
                                      width:
                                          MediaQuery.of(context).size.width / 4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: docs
                                              ? Color.fromRGBO(19, 82, 139, 1)
                                              : Colors.white,
                                        ),
                                        color: docs
                                            ? Color.fromRGBO(19, 82, 139, 1)
                                            : Colors.white,
                                      ),
                                      padding: const EdgeInsets.all(12),
                                      child: Center(
                                        child: const Text('Doctor',
                                            style: TextStyle(
                                              fontSize: 12,
                                            )),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  RaisedButton(
                                    elevation: 1,
                                    onPressed: () {
                                      setState(() {
                                        docs = false;
                                      });
                                      AppointmentProvider acct =
                                          Provider.of<AppointmentProvider>(
                                              context,
                                              listen: false);
                                      if (Provider.of<AppointmentProvider>(
                                              context,
                                              listen: false)
                                          .teams
                                          .isEmpty) {
                                        acct.getTeam();
                                      }
                                    },
                                    textColor: docs
                                        ? Colors.black
                                        : Color.fromRGBO(241, 245, 248, 1),
                                    //color: Color.fromRGBO(19, 82, 139, 1),
                                    padding: EdgeInsets.all(0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                    ),
                                    child: Container(
                                      height: 50,
                                      width:
                                          MediaQuery.of(context).size.width / 4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: docs
                                              ? Colors.white
                                              : Color.fromRGBO(19, 82, 139, 1),
                                        ),
                                        color: docs
                                            ? Colors.white
                                            : Color.fromRGBO(19, 82, 139, 1),
                                      ),
                                      padding: const EdgeInsets.all(12),
                                      child: Center(
                                        child: const Text('Midwife',
                                            style: TextStyle(
                                              fontSize: 12,
                                            )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 25,
                              ),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Doctors Near You",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ))),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 25,
                              ),
                              ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  primary: false,
                                  shrinkWrap: true,
                                  itemCount: Provider.of<AppointmentProvider>(
                                          context,
                                          listen: false)
                                      .doctors
                                      .length,
                                  itemBuilder: (BuildContext context, index) {
                                    return Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DoctorsProfile(
                                                            index: index)));
                                          },
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                9,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            color: Color.fromRGBO(
                                                248, 248, 248, 1),
                                            child: Padding(
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
                                                    child: Provider.of<AppointmentProvider>(
                                                                        context,
                                                                        listen:
                                                                            false)
                                                                    .doctors[
                                                                        index]
                                                                    .dp ==
                                                                null ||
                                                            Provider.of<AppointmentProvider>(
                                                                        context,
                                                                        listen:
                                                                            false)
                                                                    .doctors[
                                                                        index]
                                                                    .dp ==
                                                                "null"
                                                        ? Image.asset(
                                                            "assets/images/profile.png",
                                                            height: 40.0,
                                                            width: 30.0,
                                                            fit: BoxFit.fill,
                                                          )
                                                        : Image.network(
                                                            Provider.of<AppointmentProvider>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                                .doctors[index]
                                                                .dp,
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
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                              "Dr ${Provider.of<AppointmentProvider>(context, listen: false).doctors[index].firstname} ${Provider.of<AppointmentProvider>(context, listen: false).doctors[index].lastname}")),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "${Provider.of<AppointmentProvider>(context, listen: false).doctors[index].speciality}",
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        160,
                                                                        164,
                                                                        168,
                                                                        1)),
                                                          ),
                                                          SizedBox(
                                                            width: 15,
                                                          ),
                                                          Icon(
                                                            Icons.star,
                                                            color: Color.alphaBlend(
                                                                Color.fromRGBO(
                                                                    245,
                                                                    211,
                                                                    108,
                                                                    1),
                                                                Color.fromRGBO(
                                                                    254,
                                                                    207,
                                                                    71,
                                                                    1)),
                                                          ),
                                                          Text(
                                                              "${Provider.of<AppointmentProvider>(context, listen: false).doctors[index].ratings}")
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
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
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                      ],
                                    );
                                  }),
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
