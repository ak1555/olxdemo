import 'package:flutter/material.dart';
import 'package:olxdemo/homepage.dart';
import 'package:olxdemo/loginpage.dart';
// import 'package:olxdemo/loginpage.dart';
import 'package:olxdemo/signuppage.dart';

void main() {
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