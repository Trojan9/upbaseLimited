import 'package:upbase_limited/model/core/doctors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:upbase_limited/model/services/base.dart';
import 'package:upbase_limited/providers/ProfileProvider.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AppointmentProvider with ChangeNotifier {
  List<Doctorsdata> doctors = [];
  List<Doctorsdata> teams = [];
  Doctorsdata doctordetail = Doctorsdata();
  bool isloading = false;
  bool isChecking = false;
  void setLoad(value) {
    isloading = value;
    notifyListeners();
  }

  setdoctordata(responsebody) async {
    doctordetail = await Doctorsdata.fromMap(responsebody);
    print(doctordetail.firstname);
    notifyListeners();
  }

  setlistfromapi(responsebody) async {
    return await responsebody
        .map<Doctorsdata>((json) => Doctorsdata.fromJson(json))
        .toList();
  }

  Future<Map<String, dynamic>> getdoctors() async {
    //setLoad(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${prefs.getString('token')}'
    };
    var request = http.Request(
        'GET', Uri.parse('${BaseService.rootEndpoint}available-doctors'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsefromstream = await http.Response.fromStream(response);
    print(responsefromstream);
    var responses = await json.decode(responsefromstream.body);
    print(responses);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      doctors = await setlistfromapi(
          await json.decode(responsefromstream.body)["data"]["data"]);
      // setLoad(false);
      notifyListeners();
      return {"status": "Success", "message": "${responses["message"]}"};
    } else {
      //  setLoad(false);
      notifyListeners();
      return {"status": "error", "message": "${responses["message"]}"};
    }
  }

  Future<Map<String, dynamic>> getTeam() async {
    // setLoad(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${prefs.getString('token')}'
    };
    var request =
        http.Request('GET', Uri.parse('${BaseService.rootEndpoint}teams'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsefromstream = await http.Response.fromStream(response);
    print(responsefromstream);
    var responses = await json.decode(responsefromstream.body);
    print(responses);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      teams = await setlistfromapi(
          await json.decode(responsefromstream.body)["data"]["data"]);
      // setLoad(false);
      notifyListeners();
      return {"status": "Success", "message": "${responses["message"]}"};
    } else {
      // setLoad(false);
      notifyListeners();
      return {"status": "error", "message": "${responses["message"]}"};
    }
  }

  Future<Map<String, dynamic>> getupcomingappointment() async {
    setLoad(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${prefs.getString('token')}'
    };
    var request = http.Request(
        'GET', Uri.parse('${BaseService.rootEndpoint}upcomingappointments/12'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsefromstream = await http.Response.fromStream(response);
    print(responsefromstream);
    var responses = await json.decode(responsefromstream.body);
    print(responses);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      setLoad(false);

      return {"status": "Success", "message": "${responses["message"]}"};
    } else {
      setLoad(false);
      return {"status": "error", "message": "${responses["message"]}"};
    }
  }

  Future<Map<String, dynamic>> getdoctordetail(var id) async {
    setLoad(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${prefs.getString('token')}'
    };
    var request = http.Request(
        'GET', Uri.parse('${BaseService.rootEndpoint}doctors/$id'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsefromstream = await http.Response.fromStream(response);
    print(responsefromstream);
    var responses = await json.decode(responsefromstream.body);
    print(responses);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      await setdoctordata(
          await json.decode(responsefromstream.body)['data'][0]);
      setLoad(false);

      return {"status": "Success", "message": "${responses["message"]}"};
    } else {
      setLoad(false);
      return {"status": "error", "message": "${responses["message"]}"};
    }
  }

  Future<Map<String, dynamic>> bookdoctor(var appointid, var date, var time,
      var centerid, var doctorid, var status) async {
    setLoad(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${prefs.getString('token')}'
    };
    var request = http.Request(
        'POST', Uri.parse('${BaseService.rootEndpoint}book-appointment'));
    request.body = json.encode({
      "appointment_id": appointid,
      "date": date,
      "time": time,
      "centre_id": centerid,
      "doctor_id": doctorid,
      "status": status
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsefromstream = await http.Response.fromStream(response);
    print(responsefromstream);
    var responses = await json.decode(responsefromstream.body);
    print(responses);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      setLoad(false);

      return {"status": "Success", "message": "${responses["message"]}"};
    } else {
      setLoad(false);
      return {"status": "error", "message": "${responses["message"]}"};
    }
  }

  Future<Map<String, dynamic>> getteammember(var id) async {
    setLoad(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${prefs.getString('token')}'
    };
    var request =
        http.Request('GET', Uri.parse('${BaseService.rootEndpoint}teams/$id'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsefromstream = await http.Response.fromStream(response);
    print(responsefromstream);
    var responses = await json.decode(responsefromstream.body);
    print(responses);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      await setdoctordata(
          await json.decode(responsefromstream.body)['data'][0]);
      setLoad(false);

      return {"status": "Success", "message": "${responses["message"]}"};
    } else {
      setLoad(false);
      return {"status": "error", "message": "${responses["message"]}"};
    }
  }

  Future<Map<String, dynamic>> rescheduleappointment(var id, var date) async {
    setLoad(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${prefs.getString('token')}'
    };
    var request = http.Request('PUT',
        Uri.parse('${BaseService.rootEndpoint}rescheduleappointments/$id'));
    request.body = json.encode({"date": date});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsefromstream = await http.Response.fromStream(response);
    print(responsefromstream);
    var responses = await json.decode(responsefromstream.body);
    print(responses);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      // await setdoctordata(await json.decode(responsefromstream.body));
      setLoad(false);

      return {"status": "Success", "message": "${responses["message"]}"};
    } else {
      setLoad(false);
      return {"status": "error", "message": "${responses["message"]}"};
    }
  }

  Future<Map<String, dynamic>> getavailabledate(var doctorid) async {
    setLoad(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${prefs.getString('token')}'
    };
    var request = http.Request('GET',
        Uri.parse('${BaseService.rootEndpoint}available-dates/$doctorid'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsefromstream = await http.Response.fromStream(response);
    print(responsefromstream);
    var responses = await json.decode(responsefromstream.body);
    print(responses);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      // await setdoctordata(await json.decode(responsefromstream.body));
      setLoad(false);

      return {"status": "Success", "message": "${responses["message"]}"};
    } else {
      setLoad(false);
      return {"status": "error", "message": "${responses["message"]}"};
    }
  }
}
