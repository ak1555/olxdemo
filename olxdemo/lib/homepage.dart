import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List ls=[];
  Map mp={};
  String? a;
  final mybox=Hive.box('mybox');

  void add()async{
    setState(() {
      a=mybox.get(1);
    });
     final resp=await http.get(Uri.parse('http://jandk.tech/api/getproducts'),
          headers: {
            "Authorization":"Bearer ${a}"
          }
          );
          // print(resp.body);
           mp=json.decode(resp.body);
          setState(() {
           ls.add(mp);
          });
          print(ls);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    add();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        // color: Colors.amber,
        child: Container(
          height: 600,
          width: double.infinity,
          child: Expanded(
              child: ListView.builder(
                itemCount: ls.length,
            itemBuilder: (context, index) {
              return Container(height:55,width:double.infinity,color: Colors.red,child:  Text(ls[index]["product1"][index]["pname"].toString()));
            },
          )),
        ),
      ),
    );
  }
}
