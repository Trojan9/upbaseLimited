import 'dart:io';

import 'package:upbase_limited/model/core/patient.dart';
import 'package:upbase_limited/model/services/base.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:upbase_limited/sharedpreferences/profilePreference.dart';

class ProfileProvider with ChangeNotifier {
  Profiledata patient = Profiledata();
  bool isloading = false;
  bool isChecking = false;
  void setLoad(value) {
    isloading = value;
    notifyListeners();
  }

  setlistfromapi(responsebody) async {
    return await responsebody
        .map<Profiledata>((json) => Profiledata.fromJson(json))
        .toList();
  }

  setpatientdata(responsebody) async {
    patient = await Profiledata.fromMap(responsebody);
    print(patient.firstname);
    notifyListeners();
  }

  void setcheck(value) {
    isChecking = value;
    notifyListeners();
  }

  Future<Map<String, dynamic>> getprofile(var phonenumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var response;
    try {
      ProfileProvider().patient =
          await ProfilePreferences().getProfile(phonenumber);
      response = "true";
    } on Exception catch (e) {
      response = e;
    }

    if (response == "true") {
      ProfileProvider().patient =
          await ProfilePreferences().getProfile(phonenumber);

      return {"status": "Success", "message": "okay"};
    } else {
      return {"status": "error", "message": "okay"};
    }
  }

  Future<Map<String, dynamic>> profileupdate(String firstname, String lastname,
      String phonenumber, String image) async {
    setLoad(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var response;
    try {
      //user = await auth.currentUser();
      //userid = token;
      // print(userid);
      var formerphone = ProfileProvider().patient.phone;

      ProfileProvider().patient.firstname = firstname;
      ProfileProvider().patient.lastname = lastname;
      ProfileProvider().patient.phone = phonenumber;
      ProfileProvider().patient.dp = image;

      allPatients.removeWhere((element) => element.phone == formerphone);
      await ProfilePreferences().saveProfile(ProfileProvider().patient);
      ProfileProvider().patient = await ProfilePreferences()
          .getProfile(ProfileProvider().patient.phone);
      response = "true";
    } on Exception catch (e) {
      response = e;
    }

    if (response == "true") {
      //await ProfileProvider().getprofile(ProfileProvider().patient.phone);
      await ProfileProvider().getprofile(ProfileProvider().patient.phone);
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
}
