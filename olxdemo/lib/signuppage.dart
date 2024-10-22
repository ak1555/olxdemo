import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();
  TextEditingController place = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController otp = TextEditingController();

  ImagePicker picker = ImagePicker();
  String? prof =
      "https://st5.depositphotos.com/37141018/66178/i/450/depositphotos_661787042-stock-photo-rendering-yellow-cross-mark-white.jpg";

// void pickimage() async{
// final pickedfile=await picker.pickImage(source: ImageSource.gallery);
//  prof=pickedfile!.path;
// }

  void adddata() async {
    Map mp = {
      "email": email.text,
      "username": username.text,
      "password": password.text,
      "cpassword": cpassword.text,
      "place": place.text,
      "address": address.text,
      "profile": prof.toString(),
      "pincode": pincode.text,
      "phone": phone.text,
    };
    final res = await http.post(Uri.parse("http://jandk.tech/api/signup"),
        headers: {"Content-Type": "application/json"}, body: json.encode(mp));
 setState(() {
      email.clear();
    username.clear();
    password.clear();
    cpassword.clear();
    place.clear();
    address.clear();
    pincode.clear();
    phone.clear();
    otp.clear();
 });
    print(res.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              alignment: Alignment.center,
              padding: EdgeInsets.all(30),
              child: Image.network(
                  'https://logos-world.net/wp-content/uploads/2022/04/OLX-Symbol.png',
                  color: const Color.fromARGB(255, 1, 47, 116)),
            ),
            Container(
              height: 640,
              width: double.infinity,
              child: Expanded(
                child: ListView(
                  children: [
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
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2)),
                              hintText: "Email",
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: Icon(Icons.email_outlined),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent.shade700,
                                      width: 0.8))),
                        )),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
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
                          controller: username,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2)),
                              hintText: "Username",
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: Icon(Icons.perm_identity_outlined),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent.shade700,
                                      width: 0.8))),
                        )),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
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
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2)),
                              hintText: "Password",
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: Icon(Icons.remove_red_eye_outlined),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent.shade700,
                                      width: 0.8))),
                        )),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
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
                          controller: cpassword,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2)),
                              hintText: "Conform-Password",
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: Icon(Icons.remove_red_eye_outlined),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent.shade700,
                                      width: 0.8))),
                        )),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
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
                          controller: place,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2)),
                              hintText: "place",
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: Icon(Icons.place_outlined),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent.shade700,
                                      width: 0.8))),
                        )),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
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
                          controller: address,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2)),
                              hintText: "address",
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: Icon(Icons.place_outlined),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent.shade700,
                                      width: 0.8))),
                        )),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
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
                          controller: pincode,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2)),
                              hintText: "pincode",
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: Icon(Icons.post_add_rounded),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent.shade700,
                                      width: 0.8))),
                        )),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
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
                          controller: phone,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2)),
                              hintText: "phone",
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: Icon(Icons.phone_outlined),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent.shade700,
                                      width: 0.8))),
                        )),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
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
                          controller: otp,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2)),
                              hintText: "OTP",
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: Icon(
                                  Icons.no_encryption_gmailerrorred_outlined),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent.shade700,
                                      width: 0.8))),
                        )),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 50, right: 50),
                      child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.blue[700],
                              shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(0))),
                          onPressed: () {
                            adddata();
                            
                          },
                          child: Text(
                            "SUBMIT",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                    ),
                    SizedBox(
                      height: 25,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
