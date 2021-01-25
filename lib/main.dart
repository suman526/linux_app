import 'package:firebase_app/home.dart';
import 'package:firebase_app/login.dart';
import 'package:firebase_app/reg.dart';
import 'package:firebase_app/terminal.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "home",
      routes: {
        "home": (context) => MyHome(),
        "reg": (context) => MyReg(),
        "login": (context) => MyLogin(),
        "terminal": (context) => MyTerminal(),
      },
    ),
  );
}
