import 'package:upbase_limited/model/core/patient.dart';
import 'package:upbase_limited/model/services/base.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

List<Profiledata> allPatients = [];

class ProfilePreferences {
  Future<bool> saveProfile(Profiledata patient) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    allPatients.add(patient);

    //print(cartlist.length);
    prefs.setString('patient', json.encode(allPatients));

    print("object prefere");
    return prefs.commit();
  }

  Future<List<Profiledata>> getallProfiles() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return await json
        .decode(prefs.getString('patient'))
        .map<Profiledata>((json) => Profiledata.fromJson(json))
        .toList();
  }

  Future<Profiledata> getProfile(String number) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    allPatients = await getallProfiles();
    return await allPatients
        .where((element) => element.phone == number)
        .toList()[0];
  }

  void removeProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("id");
  }
}
