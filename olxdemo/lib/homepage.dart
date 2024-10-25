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
  List li = [];
  Map mp = {};
  String? a;
  String? ID;
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
    print("hiii");
    print(data["id"]);
    ID = data["id"];
    print("oiii");
    prof();
  }

  void prof() async {
    final reponse =
        await http.get(Uri.parse('http://jandk.tech/api/getuser/$ID'));
    setState(() {
      mp = jsonDecode(reponse.body);
    });

    print(mp["email"]);
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
        // leading:IconButton(onPressed: () {

        // }, icon: Icon(Icons.menu)),
        actions: [
          Container(
            width: 150,
            child: Row(
              children: [
                Icon(Icons.location_on_outlined),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Kochi, Ernakulam",
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          )
        ],
      ),
      drawer: Drawer(
          clipBehavior: Clip.none,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: Colors.orange)),
                child: Icon(
                  Icons.perm_identity_rounded,
                  size: 80,
                ),
              ),
              Container(
                height: 50,
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  mp["username"].toString(),
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800]),
                ),
              ),
              Container(
                height: 20,
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(mp["email"].toString()),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 20,
                width: double.infinity,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.phone,
                      size: 18,
                    ),
                    Text(mp["phone"].toString()),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 20,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_city_outlined,
                      size: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(mp["place"])
                  ],
                ),
              ),
              SizedBox(
                height: 260,
              ),
              Container(
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(border: Border.all()),
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
          child: Column(
            children: [
              Container(
                height: 65,
                width: double.infinity,
                margin: EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.orange),
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(50, 50),
                        top: Radius.circular(3))),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  margin:
                      EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
                  child: Expanded(
                      child: TextField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
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
                                border:
                                    Border.all(width: .2, color: Colors.orange),
                                borderRadius: BorderRadius.circular(5)),
                            child: ls[index]["images"] != null
                                ?
                                // Image.memory(base64Decode(ls[index]["images"][0]))
                                Text("data")
                                : Icon(Icons.perm_identity_outlined),
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
                                style:
                                    TextStyle(fontSize: 12, letterSpacing: 0.0),
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
            ],
          ),
        ),
      ),
    );
  }
}
