import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PregnancyRedAlert extends StatefulWidget {
  @override
  _PregnancyRedAlertState createState() => _PregnancyRedAlertState();
}

class _PregnancyRedAlertState extends State<PregnancyRedAlert> {
  List chosen = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  List issues = [
    "Vaginal Bleeding",
    "Convulsions/fits",
    "Severe headaches with blurred vision",
    "Fever and too weak to get out of bed.",
    "Convulsions/fits",
    "Severe headaches with blurred vision",
    "Fever and too weak to get out of bed."
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
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
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Pregnancy Red Alert",
                              style: TextStyle(
                                fontSize: 22,
                              ))),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 25,
                      ),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          primary: false,
                          shrinkWrap: true,
                          itemCount: issues.length,
                          itemBuilder: (BuildContext context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      chosen[index] = !chosen[index];
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: IconButton(
                                            icon: Icon(
                                              chosen[index]
                                                  ? Icons.check_circle
                                                  : Icons.radio_button_off,
                                              size: 25,
                                              color: Color.fromRGBO(
                                                  251, 78, 78, 1),
                                            ),
                                            onPressed: () async {
                                              setState(() {
                                                chosen[index] = !chosen[index];
                                              });
                                            }),
                                      ),
                                      Expanded(
                                        flex: 8,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text.rich(TextSpan(
                                                text: "${issues[index]}",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                children: <TextSpan>[])),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text.rich(TextSpan(
                                                text: "",
                                                style: TextStyle(fontSize: 15),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text:
                                                          "Do you have constant pain in your head alone or head and upper part of your neck, and whenever you see things it looks clouded?",
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              37, 40, 43, 1))),
                                                ])),
                                          ],
                                        ),
                                      ),
                                      // Text("Vaginal Bleeding")
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            );
                          }),
                      SizedBox(
                        height: 15,
                      ),
                      RaisedButton(
                        elevation: 0,
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder:
                          //             (BuildContext context) =>
                          //                 Otp()));
                        },
                        textColor: Colors.white,
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
                              color: Color.fromRGBO(251, 78, 78, 1),
                            ),
                            color: Color.fromRGBO(251, 78, 78, 1),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Center(
                            child: const Text('Send Alert',
                                style: TextStyle(fontSize: 15)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
