import 'package:upbase_limited/providers/Auth.dart';

import 'package:upbase_limited/providers/appointmentprovider.dart';
import 'package:upbase_limited/providers/setpagedrawer.dart';
import 'package:upbase_limited/ui/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:upbase_limited/utils/constant.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          // ChangeNotifierProvider(create: (_) => ProfileProvider()),
          ChangeNotifierProvider(create: (_) => AppointmentProvider()),
          ChangeNotifierProvider(create: (_) => Setpageprovider()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: kPrimaryColor,
          ),
          home: Splashscreen(),
        ));
  }
}
