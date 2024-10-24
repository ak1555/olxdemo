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
  List ls = [];
  Map mp = {};
  String? a;
  final mybox = Hive.box('mybox');

  void add() async {
    setState(() {
      a = mybox.get(1);
    });
    final resp = await http.get(Uri.parse('http://jandk.tech/api/getproducts'),
        headers: {"Authorization": "Bearer ${a}"});
    // print(resp.body);
    var data = json.decode(resp.body);
    setState(() {
      ls = data["products1"];
    });
    print(ls[2][3]);
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
      appBar: AppBar(
      //   leading: IconButton(onPressed: ()=> Scaffold.of(context).openDrawer(
          
      //     ), icon: Icon(Icons.perm_identity_rounded,))
      actions: [
        Container(
          width: 150,
          child: Row(children: [
            Icon(Icons.location_on_outlined),
            SizedBox(width: 15,),
            Text("Kochi, Ernakulam")
          ],),
        )
      ],
      ),
      drawer: Drawer(
          clipBehavior: Clip.none,
          child: Column(
            children: [
              SizedBox(height: 50,),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all()),
                    child: Icon(Icons.perm_identity_rounded,size: 80,),
              )
            ],
          )),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        // color: Colors.amber,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.only(left: 8, right: 8),
          child: Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 4,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2),
              itemCount: ls.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 7,
                      ),
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            border: Border.all(width: .2, color: Colors.grey),
                            borderRadius: BorderRadius.circular(5)),
                        // child:
                        // Image.asset(ls[index]["images"][0])
                        // : Icon(Icons.perm_identity_outlined),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 25,
                          ),
                          Text(
                            ls[index]["pname"].toString(),
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 25,
                          ),
                          Text(
                            "Category: ",
                            style: TextStyle(fontSize: 12, letterSpacing: 0.0),
                          ),
                          Text(ls[index]["category"].toString(),
                              style: TextStyle(fontSize: 15)),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 25,
                          ),
                          Icon(
                            Icons.currency_rupee_rounded,
                            size: 15,
                          ),
                          Text(
                            ls[index]["price"].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 25,
                          ),
                          Container(
                              height: 25,
                              width: 150,
                              child: Text(
                                ls[index]["description"].toString(),
                                overflow: TextOverflow.ellipsis,
                              )),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
