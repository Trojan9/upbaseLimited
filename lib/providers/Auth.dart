import 'package:upbase_limited/model/core/patient.dart';
import 'package:upbase_limited/model/services/base.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upbase_limited/sharedpreferences/profilePreference.dart';

class AuthProvider with ChangeNotifier {
  // ProfileProvider _myModel;

  // void update(ProfileProvider myModel) {
  //   _myModel = myModel;
  // }

  bool isloginLoading = false;
  bool issignupLoading = false;
  bool isChecking = false;

  String usermail = '';
  String accesstoken;
  void setLoggedIn(value) {
    isloginLoading = value;
    notifyListeners();
  }

  void setSignedUp(value) {
    issignupLoading = value;
    notifyListeners();
  }

  void setCheckingMail(value) {
    isChecking = value;
    notifyListeners();
  }

  void setaccesstoken(value) {
    accesstoken = value;
    notifyListeners();
  }

  bool loginloading() {
    return isloginLoading;
  }

  bool signuploading() {
    return issignupLoading;
  }

  Future<Map<String, dynamic>> login(
      String phonenumber, String password) async {
    setLoggedIn(true);
    var lengthprof = 0;
    var response;
    try {
      await getProfile(phonenumber);
      lengthprof = await allPatients
          .where((element) => element.phone == phonenumber)
          .toList()
          .length;
      response = "true";
    } on Exception catch (e) {
      response = e;
    }

    if (response == "true" && lengthprof > 0) {
      if (patient.password == password) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await getProfile(phonenumber);
        setLoggedIn(false);

        return {"status": "Success", "message": "LoggedIn Successful"};
      } else {
        setLoggedIn(false);
        return {"status": "error", "message": "PassWord Incorrect"};
      }
    } else {
      setLoggedIn(false);
      return {"status": "error", "message": "Not Registered"};
    }
  }

  Future<Map<String, dynamic>> location(
    String home_address,
    String country,
    String state,
    String lga,
  ) async {
    setLoggedIn(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var response;
    try {
      //user = await auth.currentUser();
      //userid = token;
      // print(userid);

      patient.address = home_address;
      patient.country = country;
      patient.state = state;
      patient.lga = lga;

      allPatients.removeWhere((element) => element.phone == patient.phone);
      await saveProfile(patient);
      await getProfile(patient.phone);
      response = "true";
    } on Exception catch (e) {
      response = e;
    }

    if (response == "true") {
      await getProfile(patient.phone);
      setLoggedIn(false);
      return {"status": "Success", "message": "Updated Successfully"};
    } else {
      setLoggedIn(false);
      return {
        "status": "Failed",
        "message": "$response" == "Page not found"
            ? "User not registered as Patient"
            : "$response"
      };
    }
  }

  Future<Map<String, dynamic>> register(
    String firstName,
    String lastName,
    String phonenumber,
    String password,
  ) async {
    setSignedUp(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    WidgetsFlutterBinding.ensureInitialized();
    String code;
    var response;
    try {
      //user = await auth.currentUser();
      //userid = token;
      // print(userid);
      var patientdetail = {
        "firstname": firstName,
        "lastname": lastName,
        "phone": phonenumber.toString(),
        "password": password.toString(),
        "created_at": " ",
        "updated_at": " ",
        "id": " ",
        "dp": null,
        "role_id": " ",
        "age": " ",
        "occupation": " ",
        "country": " ",
        "state": " ",
        "date_of_birth": " ",
        "address": " ",
        "lga": " ",
        "guardianphonenumber": " ",
        "preferredlang": " ",
        "pregnancyweeks": " "
      };
      Profiledata pat = Profiledata.fromMap(patientdetail);
      allPatients.add(pat);

      //print(cartlist.length);
      List jsonList = allPatients.map((player) => player.toJson()).toList();
      print("jsonList: ${jsonList}");
      await prefs.setString(
          'patient', jsonEncode(allPatients.map((i) => i.toJson()).toList()));
      await saveProfile(pat);

      await getProfile(phonenumber);
      print(patient.phone);
      print("here boss");
      Random random = new Random();
      int num1 = random.nextInt(10);
      int num2 = random.nextInt(10);
      int num3 = random.nextInt(10);
      int num4 = random.nextInt(10);
      code = "$num1" + "$num2" + "$num3" + "$num4";
      prefs.setString('code', code);
      response = "true";
    } on Exception catch (e) {
      response = e;
    }

    if (response == "true") {
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setString('token', responses["data"]["token"]);
      setSignedUp(false);
      return {"status": "Success", "message": "Use OTP code $code"};
    } else {
      setSignedUp(false);
      return {"status": "error", "message": "$response"};
    }
  }

  // Future<Map<String, dynamic>> logout() async {
  //   setLoggedIn(true);
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var headers = {
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer ${prefs.getString('token')}'
  //   };
  //   var request =
  //       http.Request('POST', Uri.parse('${BaseService.rootEndpoint}logout'));
  //   request.body = '''''';
  //   request.headers.addAll(headers);

  //   http.StreamedResponse response = await request.send();
  //   var responsefromstream = await http.Response.fromStream(response);
  //   print(responsefromstream);
  //   var responses = await json.decode(responsefromstream.body);
  //   print(responses);
  //   if (response.statusCode >= 200 && response.statusCode < 300) {
  //     setLoggedIn(false);

  //     return {"status": "Success", "message": "${responses["message"]}"};
  //   } else {
  //     setLoggedIn(false);
  //     return {"status": "error", "message": "${responses["message"]}"};
  //   }
  // }

  Future<Map<String, dynamic>> verifyotp(String code) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setLoggedIn(true);
    // var headers = {
    //   'Accept': 'application/json',
    //   'Content-Type': 'application/json'
    // };
    // var request =
    //     http.Request('POST', Uri.parse('${BaseService.rootEndpoint}verify'));
    // request.body = json.encode({"code": "$code"});
    // request.headers.addAll(headers);

    // http.StreamedResponse response = await request.send();
    // var responsefromstream = await http.Response.fromStream(response);
    // print(responsefromstream);
    // var responses = await json.decode(responsefromstream.body);
    // print(responses);

    if (code == prefs.getString('code')) {
      print(patient.firstname);
      setLoggedIn(false);
      return {"status": "Success", "message": "Pin Correct"};
    } else {
      setLoggedIn(false);
      return {"status": "error", "message": "Pin Incorrect"};
    }
  }

  Future<Map<String, dynamic>> forgotpass(String phonenumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setLoggedIn(true);
    String code;
    var response;
    var lengthprof = 0;
    try {
      await getProfile(phonenumber);
      lengthprof = await allPatients
          .where((element) => element.phone == phonenumber)
          .toList()
          .length;
      Random random = new Random();
      int num1 = random.nextInt(10);
      int num2 = random.nextInt(10);
      int num3 = random.nextInt(10);
      int num4 = random.nextInt(10);
      code = "$num1" + "$num2" + "$num3" + "$num4";
      prefs.setString('code', code);
      response = "true";
    } on Exception catch (e) {
      response = e;
    }
    if (response == "true" && lengthprof > 0) {
      setLoggedIn(false);
      return {"status": "Success", "message": "Use Code: $code"};
    } else {
      setLoggedIn(false);
      return {"status": "error", "message": "Not a Registerd User"};
    }
  }

  Future<Map<String, dynamic>> resetpassword(
    String password,
  ) async {
    setLoggedIn(true);

    var response;
    try {
      //user = await auth.currentUser();
      //userid = token;
      // print(userid);

      patient.password = password;
      // ProfileProvider().patient.country = country;
      // ProfileProvider().patient.state = state;
      // ProfileProvider().patient.lga = lga;

      allPatients.removeWhere((element) => element.phone == patient.phone);
      await saveProfile(patient);
      await getProfile(patient.phone);
      response = "true";
    } on Exception catch (e) {
      response = e;
    }

    if (response == "true") {
      setLoggedIn(false);

      return {"status": "Success", "message": "Updated Successfully"};
    } else {
      setLoggedIn(false);
      return {"status": "error", "message": "$response"};
    }
  }

  Future<Map<String, dynamic>> aboutyou(
    String dob,
    String lang,
    String pregweeks,
    String husbandphone,
  ) async {
    setLoggedIn(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var response;
    try {
      //user = await auth.currentUser();
      //userid = token;
      // print(userid);

      patient.date_of_birth = dob;
      patient.preferredlang = lang;
      patient.pregnancyweeks = pregweeks;
      patient.guardianphonenumber = husbandphone;

      allPatients.removeWhere((element) => element.phone == patient.phone);
      await saveProfile(patient);
      print(patient.phone);
      await getProfile(patient.phone);
      response = "true";
    } on Exception catch (e) {
      response = e;
    }

    if (response == "true") {
      await getProfile(patient.phone);
      setLoggedIn(false);
      return {"status": "Success", "message": "Updated Successfully"};
    } else {
      setLoggedIn(false);
      return {
        "status": "Failed",
        "message": "$response" == "Page not found"
            ? "User not registered as Patient"
            : "$response"
      };
    }
  }

  Future<Map<String, dynamic>> changepass(
      String oldpassword, String newpassword) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setLoggedIn(true);

    var response;
    if (patient.password == oldpassword) {
      try {
        //user = await auth.currentUser();
        //userid = token;
        // print(userid);

        patient.password = newpassword;
        // ProfileProvider().patient.country = country;
        // ProfileProvider().patient.state = state;
        // ProfileProvider().patient.lga = lga;

        allPatients.removeWhere((element) => element.phone == patient.phone);
        await saveProfile(patient);
        await getProfile(patient.phone);
        response = "true";
      } on Exception catch (e) {
        response = e;
      }

      if (response == "true") {
        setLoggedIn(false);

        return {"status": "Success", "message": "Updated Successfully"};
      } else {
        setLoggedIn(false);
        return {"status": "error", "message": "$response"};
      }
    } else {
      setLoggedIn(false);
      return {"status": "error", "message": "Wrong Old Password"};
    }
  }

  Profiledata patient = Profiledata();
  Profiledata patient2 = Profiledata();
  bool isloading = false;
  var checks = true;
  void setLoad(value) {
    isloading = value;
    notifyListeners();
  }

  void setvalue(var item, var value) {
    var pat = patient.toJson();
    pat['$item'] = value;
    patient = Profiledata.fromJson(pat);
    print(patient.firstname);
  }

  void setprofile(Profiledata patientfrom) {
    patient = patientfrom;
    notifyListeners();
  }

  setlistfromapi(responsebody) async {
    return await responsebody
        .map<Profiledata>((json) => Profiledata.fromJson(json))
        .toList();
  }

  setpatientdata(responsebody) async {
    patient = await new Profiledata.fromMap(responsebody);
    print(patient.firstname);
    checks = false;
    print("provider");
    checkdata();
    // notifyListeners();
  }

  checkdata() {
    print(checks);
    print("provider2");
  }

  void setcheck(value) {
    isChecking = value;
    notifyListeners();
  }

  // Future<Map<String, dynamic>> getprofile(var phonenumber) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var response;
  //   try {
  //     await getProfile(phonenumber);
  //     response = "true";
  //   } on Exception catch (e) {
  //     response = e;
  //   }

  //   if (response == "true") {
  //     await getProfile(phonenumber);

  //     return {"status": "Success", "message": "okay"};
  //   } else {
  //     return {"status": "error", "message": "okay"};
  //   }
  // }

  Future<Map<String, dynamic>> profileupdate(String firstname, String lastname,
      String phonenumber, String image) async {
    setLoad(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var response;
    try {
      //user = await auth.currentUser();
      //userid = token;
      // print(userid);
      var formerphone = patient.phone;

      patient.firstname = firstname;
      patient.lastname = lastname;
      patient.phone = phonenumber;
      patient.dp = image;

      allPatients.removeWhere((element) => element.phone == formerphone);
      await saveProfile(patient);
      await getProfile(patient.phone);
      response = "true";
    } on Exception catch (e) {
      response = e;
    }

    if (response == "true") {
      //await ProfileProvider().getprofile(ProfileProvider().patient.phone);
      await getProfile(patient.phone);
      setLoad(false);

      return {"status": "Success", "message": "Update Successful"};
    } else {
      setLoad(false);
      return {"status": "error", "message": "$response"};
    }
  }

  Future<Map<String, dynamic>> aboutyouupdate(
    String dob,
    String lang,
    String pregweeks,
    String husbandphone,
  ) async {
    setLoad(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var response;
    try {
      //user = await auth.currentUser();
      //userid = token;
      // print(userid);

      patient.date_of_birth = dob;
      patient.preferredlang = lang;
      patient.pregnancyweeks = pregweeks;
      patient.guardianphonenumber = husbandphone;

      allPatients.removeWhere((element) => element.phone == patient.phone);
      await saveProfile(patient);
      await getProfile(patient.phone);
      response = "true";
    } on Exception catch (e) {
      response = e;
    }

    if (response == "true") {
      await getProfile(patient.phone);
      setLoad(false);
      return {"status": "Success", "message": "Updated Successfully"};
    } else {
      setLoad(false);
      return {
        "status": "Failed",
        "message": "$response" == "Page not found"
            ? "User not registered as Patient"
            : "$response"
      };
    }
  }

  Future<Map<String, dynamic>> locationupdate(
    String home_address,
    String country,
    String state,
    String lga,
  ) async {
    setLoad(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var response;
    try {
      //user = await auth.currentUser();
      //userid = token;
      // print(userid);

      patient.address = home_address;
      patient.country = country;
      patient.state = state;
      patient.lga = lga;

      allPatients.removeWhere((element) => element.phone == patient.phone);
      await saveProfile(patient);
      await getProfile(patient.phone);
      response = "true";
    } on Exception catch (e) {
      response = e;
    }

    if (response == "true") {
      await getProfile(patient.phone);
      setLoad(false);
      return {"status": "Success", "message": "Updated Successfully"};
    } else {
      setLoad(false);
      return {
        "status": "Failed",
        "message": "$response" == "Page not found"
            ? "User not registered as Patient"
            : "$response"
      };
    }
  }

  Future<bool> saveProfile(Profiledata patient) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    allPatients.add(patient);

    //print(cartlist.length);
    await prefs.setString(
        'patient', jsonEncode(allPatients.map((i) => i.toJson()).toList()));

    print("object prefere");
    return prefs.commit();
  }

  Future<List<Profiledata>> getallProfiles() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await json
        .decode(prefs.getString('patient'))
        .map<Profiledata>((json) => Profiledata.fromJson(json))
        .toList();
  }

  Future<Profiledata> getProfile(String number) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    allPatients = await getallProfiles();
    var test;
    if (await allPatients
            .where((element) => element.phone == number)
            .toList()
            .length >
        0) {
      test = await allPatients
          .where((element) => element.phone == number)
          .toList()[0];
      print(test.phone);
      var patientdetail = {
        "firstname": test.firstname,
        "lastname": test.lastname,
        "phone": test.phone.toString(),
        "password": test.password.toString(),
        "created_at": test.created_at,
        "updated_at": test.updated_at,
        "id": test.id,
        "dp": test.dp,
        "role_id": test.role_id,
        "age": test.age,
        "occupation": test..occupation,
        "country": test.country,
        "state": test.state,
        "date_of_birth": test.date_of_birth,
        "address": test..address,
        "lga": test.lga,
        "guardianphonenumber": test.guardianphonenumber,
        "preferredlang": test.preferredlang,
        "pregnancyweeks": test.pregnancyweeks
      };
      await setpatientdata(patientdetail);

      //ProfileProvider().patient = new Profiledata.fromMap(patientdetail);
      // print(ProfileProvider().patient2.firstname);
      print("preference");
    } else {
      test = null;
    }
    //await ProfileProvider().checkdata();
    return test;
  }

  void removeProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("id");
  }
}
