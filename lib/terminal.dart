import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyTerminal extends StatefulWidget {
  @override
  _MyTerminalState createState() => _MyTerminalState();
}

class _MyTerminalState extends State<MyTerminal> {
  var msgtextcontroller = TextEditingController();

  var fs = FirebaseFirestore.instance;
  var authc = FirebaseAuth.instance;

  String cmd,ans;
  
  var webdata;

  mydata(cmd) async {
    var url = 'http://192.168.1.6/cgi-bin/app.py?x=$cmd';
    var r = await http.get(url);
    setState(() {
      webdata = r.body;
    });

    print(r);
  }

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          brightness: Brightness.light ,
          title: Text('Your Terminal'),
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: deviceWidth * 0.70,
                    child: TextField(
                      controller: msgtextcontroller,
                      decoration: InputDecoration(
                          hintText: 'Enter command',
                          border: new UnderlineInputBorder(
                              borderSide: new BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: const BorderRadius.all(
          const Radius.circular(10.0),
        ),)),
                      onChanged: (value) {
                        cmd = value;
                      },
                    ),
                  ),
                  Container(
                    width: deviceWidth * 0.20,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.black87,
                            width: 3,
                            style: BorderStyle.solid),
                      ),
                      child: Text('SEND'),
                      onPressed:(){
                        msgtextcontroller.clear();
                         mydata(cmd);
                      } ,
                      
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                        BoxShadow(color: Colors.grey[300], spreadRadius: 4),
                             ],
                ),
                padding: EdgeInsets.all(10),
                child: Text(webdata ?? "Output is coming....."),
              ),
            ],
          ),
        ));
  }
}
