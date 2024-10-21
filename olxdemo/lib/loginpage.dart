import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool checkboxvalue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Container(
            height: 350,
            width: 350,
            child: Card(
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
                        width: 10,
                      ),
                      Text("Username"),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "UserName",
                            suffixIcon: Icon(Icons.perm_identity)),
                      )),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text("Password"),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Password",
                            suffixIcon: Icon(Icons.remove_red_eye)),
                      )),
                      SizedBox(
                        width: 10,
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
                                  left: 120, right: 120, top: 20, bottom: 20)),
                          onPressed: () {},
                          child: Text(
                            "LOGIN",
                            style: TextStyle(color: Colors.white, fontSize: 18),
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
                      Text("Don't Hane an Account?"),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 35,
                        width: 75,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(2)),
                        child: TextButton(
                            onPressed: () {},
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
        ),
      ),
    );
  }
}
