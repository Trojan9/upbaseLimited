import 'package:upbase_limited/model/core/patient.dart';
import 'package:upbase_limited/model/services/base.dart';
import 'package:upbase_limited/providers/ProfileProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upbase_limited/sharedpreferences/profilePreference.dart';

class AuthProvider with ChangeNotifier {
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
      ProfileProvider().patient =
          await ProfilePreferences().getProfile(phonenumber);
      lengthprof = await allPatients
          .where((element) => element.phone == phonenumber)
          .toList()
          .length;
      response = "true";
    } on Exception catch (e) {
      response = e;
    }

    if (response == "true" && lengthprof > 0) {
      if (ProfileProvider().patient.password == password) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await ProfileProvider().getprofile(phonenumber);
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

      ProfileProvider().patient.address = home_address;
      ProfileProvider().patient.country = country;
      ProfileProvider().patient.state = state;
      ProfileProvider().patient.lga = lga;

      allPatients.removeWhere(
          (element) => element.phone == ProfileProvider().patient.phone);
      await ProfilePreferences().saveProfile(ProfileProvider().patient);
      ProfileProvider().patient = await ProfilePreferences()
          .getProfile(ProfileProvider().patient.phone);
      response = "true";
    } on Exception catch (e) {
      response = e;
    }

    if (response == "true") {
      await ProfileProvider().getprofile(ProfileProvider().patient.phone);
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
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String code;
    var response;
    try {
      //user = await auth.currentUser();
      //userid = token;
      // print(userid);
      var patientdetail = {
        "firstname": firstName,
        "lastname": lastName,
        "phone": phonenumber,
        "password": password,
      };
      Profiledata pat = Profiledata.fromMap(patientdetail);
      await ProfilePreferences().saveProfile(pat);
      ProfileProvider().patient =
          await ProfilePreferences().getProfile(phonenumber);
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
    final SharedPreferences prefs = await SharedPreferences.getInstance();
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
      setLoggedIn(false);
      return {"status": "Success", "message": "Pin Correct"};
    } else {
      setLoggedIn(false);
      return {"status": "error", "message": "Pin Incorrect"};
    }
  }

  Future<Map<String, dynamic>> forgotpass(String phonenumber) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setLoggedIn(true);
    String code;
    var response;
    try {
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
      setLoggedIn(false);
      return {"status": "Success", "message": "Use Code: $code"};
    } else {
      setLoggedIn(false);
      return {"status": "error", "message": "$response"};
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

      ProfileProvider().patient.password = password;
      // ProfileProvider().patient.country = country;
      // ProfileProvider().patient.state = state;
      // ProfileProvider().patient.lga = lga;

      allPatients.removeWhere(
          (element) => element.phone == ProfileProvider().patient.phone);
      await ProfilePreferences().saveProfile(ProfileProvider().patient);
      ProfileProvider().patient = await ProfilePreferences()
          .getProfile(ProfileProvider().patient.phone);
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

      ProfileProvider().patient.date_of_birth = dob;
      ProfileProvider().patient.preferredlang = lang;
      ProfileProvider().patient.pregnancyweeks = pregweeks;
      ProfileProvider().patient.guardianphonenumber = husbandphone;

      allPatients.removeWhere(
          (element) => element.phone == ProfileProvider().patient.phone);
      await ProfilePreferences().saveProfile(ProfileProvider().patient);
      ProfileProvider().patient = await ProfilePreferences()
          .getProfile(ProfileProvider().patient.phone);
      response = "true";
    } on Exception catch (e) {
      response = e;
    }

    if (response == "true") {
      await ProfileProvider().getprofile(ProfileProvider().patient.phone);
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
    try {
      //user = await auth.currentUser();
      //userid = token;
      // print(userid);

      ProfileProvider().patient.password = newpassword;
      // ProfileProvider().patient.country = country;
      // ProfileProvider().patient.state = state;
      // ProfileProvider().patient.lga = lga;

      allPatients.removeWhere(
          (element) => element.phone == ProfileProvider().patient.phone);
      await ProfilePreferences().saveProfile(ProfileProvider().patient);
      ProfileProvider().patient = await ProfilePreferences()
          .getProfile(ProfileProvider().patient.phone);
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
}
