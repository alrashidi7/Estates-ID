import 'package:estates_identifier/screens/addDepartment.dart';
import 'package:estates_identifier/screens/addHouse.dart';
import 'package:estates_identifier/screens/addLand.dart';
import 'package:estates_identifier/screens/homePage.dart';
import 'package:estates_identifier/screens/login.dart';
import 'package:estates_identifier/screens/mainPage.dart';
import 'package:estates_identifier/screens/register.dart';
import 'package:estates_identifier/screens/updateDepartment.dart';
import 'package:estates_identifier/screens/updateHouse.dart';
import 'package:estates_identifier/screens/updateLand.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Estates ID',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(156, 216, 226, 1),
      ),
      home: MyHomePage(title: 'Estates ID'),
      routes: {
        "/login":(context)=> new Login(),
        "/home":(context)=> new HomePage("",""),
        "/addLand":(context)=> new AddLand(),
        "/addHouse":(context)=> new AddHouse(),
        "/register":(context)=> new Register(),
        "/addDepartment":(context)=> new AddDepartment(),
        "/updateLand":(context)=> new UpdateLand(""),
        "/updateHouse":(context)=> new UpdateHouse(""),
        "/updateDepartment":(context)=> new UpdateDepartment(""),
      },
    );
  }
}

