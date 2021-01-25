import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class MyLogin extends StatefulWidget {
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  var authc = FirebaseAuth.instance;

  String email;
  String password;
  bool sspin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light ,
        title: Text('Login Yourself',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            fontStyle: FontStyle.italic,
            color: Colors.black),
      ),
      backgroundColor: Colors.blue[200],
      ),
      body: ModalProgressHUD(
        inAsyncCall: sspin,
        child: Center(
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
                       borderSide: BorderSide(
                        color: Colors.black, 
                         width: 10.0),
                       ),
                  ),
                ),
                SizedBox(
                  height: 15,
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
                       borderSide: BorderSide(
                         color: Colors.black, 
                          width: 5.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Material(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(10),
                  elevation: 10,
                  child: MaterialButton(
                    minWidth: 200,
                    height: 50,
                    color: Theme.of(context).backgroundColor,
                textColor: Colors.indigoAccent,
                    child: Text('Login',
                    style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'hind'
                ),),
                    
                    onPressed: () async {
                      setState(() {
                        sspin = true;
                      });

                      try {
                        var userSignin = await authc.signInWithEmailAndPassword(
                            email: email, password: password);
                        print(userSignin);

                        if (userSignin != null) {
                          print("Logged In");
                          Navigator.pushNamed(context, "terminal");
                          setState(() {
                            sspin = false;
                          });
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
      ),
    );
  }
}