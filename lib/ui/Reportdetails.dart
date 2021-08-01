import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ReportDetails extends StatefulWidget {
  @override
  _ReportDetailsState createState() => _ReportDetailsState();
}

class _ReportDetailsState extends State<ReportDetails> {
  List<bool> drop = [true, true, true, true];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Row(
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
                    Text("20/02/2021")
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Report Details",
                              style: TextStyle(
                                fontSize: 22,
                              ))),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 9,
                        width: MediaQuery.of(context).size.width,
                        color: Color.fromRGBO(248, 248, 248, 1),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: Image.asset(
                                  "assets/images/Ellipse 6.png",
                                  height: 40.0,
                                  width: 30.0,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 16,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("Dr Alieu Donald"),
                                  Text(
                                    "Saturay, 22 May 2021",
                                    style: TextStyle(
                                        color:
                                            Color.fromRGBO(160, 164, 168, 1)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 17,
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
                        width: MediaQuery.of(context).size.height / 25,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            color: Color.fromRGBO(19, 82, 139, 1),
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Saturday, 14 May 2021",
                            style: TextStyle(
                                color: Color.fromRGBO(160, 164, 168, 1)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.timelapse_outlined,
                            color: Color.fromRGBO(19, 82, 139, 1),
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "1:00 pm - 2:00 pm",
                            style: TextStyle(
                                color: Color.fromRGBO(160, 164, 168, 1)),
                          ),
                        ],
                      ),
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
                                color: Color.fromRGBO(160, 164, 168, 1)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.height / 25,
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                drop[3] = !drop[3];
                              });
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height / 18,
                              width: MediaQuery.of(context).size.width,
                              color: Color.fromRGBO(240, 240, 240, 1),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, right: 18),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Vital Signs",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Icon(
                                      drop[3]
                                          ? Icons.arrow_drop_down
                                          : Icons.arrow_right,
                                      color: Color.fromRGBO(19, 82, 139, 1),
                                      size: 25,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          drop[3]
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Temperature",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    160, 164, 168, 1)),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "90 C",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Blood Pressure",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  160, 164, 168, 1)),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "234/333 mmHg",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Pulse",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  160, 164, 168, 1)),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "34 bpm",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                )
                              : Text("")
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                drop[0] = !drop[0];
                              });
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height / 18,
                              width: MediaQuery.of(context).size.width,
                              color: Color.fromRGBO(240, 240, 240, 1),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, right: 18),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Medications Dispersed",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Icon(
                                      drop[0]
                                          ? Icons.arrow_drop_down
                                          : Icons.arrow_right,
                                      color: Color.fromRGBO(19, 82, 139, 1),
                                      size: 25,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          drop[0]
                              ? ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  primary: false,
                                  shrinkWrap: true,
                                  itemCount: 2,
                                  itemBuilder: (BuildContext context, index) {
                                    return Column(
                                      children: [
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text("Report Details",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ))),
                                        SizedBox(
                                          height: 10,
                                        )
                                      ],
                                    );
                                  })
                              : Text(""),
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                drop[1] = !drop[1];
                              });
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height / 18,
                              width: MediaQuery.of(context).size.width,
                              color: Color.fromRGBO(240, 240, 240, 1),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, right: 18),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Next Appointment",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Icon(
                                      drop[1]
                                          ? Icons.arrow_drop_down
                                          : Icons.arrow_right,
                                      color: Color.fromRGBO(19, 82, 139, 1),
                                      size: 25,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          drop[1]
                              ? Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_today,
                                          color: Color.fromRGBO(19, 82, 139, 1),
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Saturday, 14 May 2021",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  160, 164, 168, 1)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.timelapse_outlined,
                                          color: Color.fromRGBO(19, 82, 139, 1),
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "1:00 pm - 2:00 pm",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  160, 164, 168, 1)),
                                        ),
                                      ],
                                    ),
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
                                              color: Color.fromRGBO(
                                                  160, 164, 168, 1)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                )
                              : Text("")
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                drop[2] = !drop[2];
                              });
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height / 18,
                              width: MediaQuery.of(context).size.width,
                              color: Color.fromRGBO(240, 240, 240, 1),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, right: 18),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Doctor’s Comment",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Icon(
                                      drop[2]
                                          ? Icons.arrow_drop_down
                                          : Icons.arrow_right,
                                      color: Color.fromRGBO(19, 82, 139, 1),
                                      size: 25,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          drop[2]
                              ? Text.rich(TextSpan(
                                  text:
                                      "Proin eget tortor risus. Proin eget tortor risus. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                  style: TextStyle(fontSize: 15),
                                  children: <TextSpan>[]))
                              : Text("")
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
