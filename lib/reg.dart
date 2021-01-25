import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyReg extends StatefulWidget {
  @override
  _MyRegState createState() => _MyRegState();
}

class _MyRegState extends State<MyReg> {
  var authc = FirebaseAuth.instance;

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text('Registration',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            fontStyle: FontStyle.italic,
            color: Colors.black),
            ),
            backgroundColor: Colors.blue[200],
            
      ),
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                  hintText: "Enter Email",
                  labelText: 'Enter Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  labelText: 'Enter Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Material(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30),
                elevation: 10,
                child: MaterialButton(
                  minWidth: 200,
                  height: 40,
              //     color: Theme.of(context).backgroundColor,
                textColor: Colors.indigoAccent,
                  child: Text('Submit',
                   style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'hind'
                ),),
                  onPressed: () async {
                    try {
                      var user = await authc.createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      print(email);
                      print(password);
                      print(user);

                      if (user.additionalUserInfo.isNewUser == true) {
                        print("Registered new user");
                        Navigator.pushNamed(context, "terminal");
                      }
                    } catch (e) {
                      print(e);
                    }
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