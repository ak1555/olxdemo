import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool checkboxvalue = false;

  void adddata() async {
    Map mp = {"email": email.text, "password": password.text};
    final res = await http.post(Uri.parse("http://jandk.tech/api/signin"),
        headers: {"Content-Type": "application/json"}, body: json.encode(mp));
    print(jsonDecode(res.body));

  if(res.statusCode==200){
    Map m=jsonDecode(res.body);
    String a=m[1];
  }else{
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("${jsonDecode(res.body)}"),
      );
    },);
  }








    setState(() {
      email.clear();
      password.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Container(
                    height: 190,
                    width: 190,
                    child: Image.network(
                      'https://logos-world.net/wp-content/uploads/2022/04/OLX-Symbol.png',
                      color: const Color.fromARGB(255, 1, 47, 116),
                    )),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                height: 400,
                width: double.infinity,
                child: Card(
                  borderOnForeground: true,
                  shape: BeveledRectangleBorder(
                      side: BorderSide(color: Colors.red.shade500, width: 1)),
                  color: const Color.fromARGB(255, 80, 110, 192),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "LOGIN",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          // Text("Username"),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: TextField(
                            controller: email,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Email",
                                suffixIcon: Icon(Icons.email_outlined)),
                          )),
                          SizedBox(
                            width: 15,
                          )
                        ],
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          // Text("Password"),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: TextField(
                            controller: password,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Password",
                                fillColor: Colors.white,
                                filled: true,
                                suffixIcon:
                                    Icon(Icons.remove_red_eye_outlined)),
                          )),
                          SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              style: TextButton.styleFrom(
                                  overlayColor:
                                      const Color.fromARGB(255, 1, 84, 151),
                                  backgroundColor: Colors.blueAccent.shade100,
                                  padding: EdgeInsets.only(
                                      left: 120,
                                      right: 120,
                                      top: 20,
                                      bottom: 20)),
                              onPressed: () {
                                adddata();
                              },
                              child: Text(
                                "LOGIN",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ))
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      // Row(
                      //   children: [
                      //     Checkbox(
                      //       value: checkboxvalue,
                      //       onChanged: (value) {},
                      //     )
                      //   ],
                      // )
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't Hane an Account?",
                            style: TextStyle(color: Colors.grey.shade200),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 35,
                            width: 75,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(2)),
                            child: TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.white),
                                onPressed: () {
                                  Navigator.pushNamed(context, "signup");
                                },
                                child: Text(
                                  "SIGNUP",
                                  style: TextStyle(
                                      color: Colors.lightBlueAccent[800],
                                      fontSize: 13),
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
