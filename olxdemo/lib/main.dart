import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:olxdemo/homepage.dart';
import 'package:olxdemo/loginpage.dart';
// import 'package:olxdemo/loginpage.dart';
import 'package:olxdemo/signuppage.dart';

void main() async {
  await Hive.initFlutter();
  final mybox=await Hive.openBox('mybox');
  runApp(
    MaterialApp(
      home: LoginPage(),
      routes: {
        "signup":(context)=>SignUp(),
        "home":(context)=>HomePage(),
      },
    )
  );
}