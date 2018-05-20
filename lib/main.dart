import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:instagramclone/screens/home.dart';
import 'package:instagramclone/screens/login.dart';
import 'package:instagramclone/screens/signup.dart';

void main() async {
  FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'FireSore',
    routes: {
      "home-page": (context) => MyHomePage(),
      "login-page": (context) => LoginPage(),
      "signup-page": (context) => SignupPage(),
    },
    home: firebaseUser != null ? MyHomePage() : LoginPage(),
  ));
}
